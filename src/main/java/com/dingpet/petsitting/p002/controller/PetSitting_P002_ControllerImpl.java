package com.dingpet.petsitting.p002.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dingpet.customers.p001.vo.Customers_P001_VO;
import com.dingpet.petsitting.p002.service.KakaoPay;
import com.dingpet.petsitting.p002.service.PetSitting_P002_Service;
import com.dingpet.petsitting.p002.vo.KakaoPayApprovalVO;
import com.dingpet.petsitting.p002.vo.KakaoPayCancelVO;
import com.dingpet.petsitting.p002.vo.PetSitting_P002_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/petsitting/p002/*")
@AllArgsConstructor
@Controller
public class PetSitting_P002_ControllerImpl implements PetSitting_P002_Controller{ 
		
	private PetSitting_P002_Service service;
			
	private KakaoPay kakaoPay;
	
	@RequestMapping(value = "reservation", method=RequestMethod.POST)
	@Override
	public String reservation(HttpServletRequest request, PetSitting_P002_VO reserved, Model model) {
		// TODO Auto-generated method stub
		
// ---------------------------- 주문 번호 생성 ---------------------------
		
		HttpSession session = request.getSession();
		
		String order_id = "";
		int seq_order_id = 0;
		Date now = new Date();
		
		SimpleDateFormat form = new SimpleDateFormat("yyyyMMddHH");
		
		order_id = form.format(now);
		
		seq_order_id = service.getOrderIdSequence();
				
		String seq = String.format("%04d", seq_order_id);
		
		order_id += seq;
		
		reserved.setOrder_ID(order_id);
// -------------------------------------------------------------------	
		
		session.setAttribute("reinfo", reserved);
		
		return "redirect:" + kakaoPay.kakaoPayReady(reserved);	
		
	}
	
    @RequestMapping("kakaoPaySuccess")
	@Override
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
    	
    	HttpSession session = request.getSession();
    	
    	PetSitting_P002_VO reserved = new PetSitting_P002_VO();
    	
    	reserved = (PetSitting_P002_VO)session.getAttribute("reinfo");
    	
   // ----------------------------------- 날짜 변환 -----------------------------------------------
        KakaoPayApprovalVO reserved_info = kakaoPay.kakaoPayInfo(pg_token, reserved);
                
        SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = form.format(reserved_info.getCreated_at());
        
   //--------------------------------------------------------------------------------------------
        
        reserved.setPayment_Date(date);
        reserved.setVat(reserved_info.getAmount().getVat()); 	
        reserved.setItem_Name(reserved_info.getItem_name());
        reserved.setTid(reserved_info.getTid());
        session.removeAttribute("reinfo");
        
        service.reservationInsert(reserved);
        
        model.addAttribute("info", reserved);
	}
    
    @RequestMapping("kakaoPayCancel")
	@Override
	public String reservationicancel(Model model, PetSitting_P002_VO reserved) {
		// TODO Auto-generated method stub
		
    	reserved = service.getReservedInfo(reserved);
    	    	
    	KakaoPayCancelVO cancelVO = kakaoPay.kakaoPayCancel(reserved);
    	
    	service.deleteReserved(reserved);

    	return "redirect:/petsitting/p002/reservationlist";
	}

    @RequestMapping("reservationlist")
	@Override
	public void reservationlist(HttpServletRequest request, Model model, PetSitting_P002_VO reserved) {
		// TODO Auto-generated method stub
    	
    	HttpSession session = request.getSession();
    	Customers_P001_VO user_id = (Customers_P001_VO)session.getAttribute("customers");
    	reserved.setMember_ID(user_id.getMember_id());
    	
    	List<PetSitting_P002_VO> sitterList = service.reservedSitterList(reserved);
    	List<PetSitting_P002_VO> custList = service.reservedCustList(reserved);
    	
    	String startDate, startTime, endDate, endTime = "";
    	
    	for(int i = 0; i < sitterList.size(); i++) {
    		startDate = sitterList.get(i).getStart_Date();
    		startTime = sitterList.get(i).getStart_Time();
    		endDate = sitterList.get(i).getEnd_Date();
    		endTime = sitterList.get(i).getEnd_Time();

        	sitterList.get(i).setStart_Date2(startDate.replaceAll("-", ""));
        	sitterList.get(i).setStart_Time2(startDate.replaceAll("-", "")+startTime.replaceAll(":", ""));
        	sitterList.get(i).setEnd_Date2(endDate.replaceAll("-", ""));
        	sitterList.get(i).setEnd_Time2(endDate.replaceAll("-", "")+endTime.replaceAll(":", ""));
    	}
    	
    	for(int i = 0; i < custList.size(); i++) {
    		startDate = custList.get(i).getStart_Date();
    		startTime = custList.get(i).getStart_Time();
    		endDate = custList.get(i).getEnd_Date();
    		endTime = custList.get(i).getEnd_Time();

    		custList.get(i).setStart_Date2(startDate.replaceAll("-", ""));
        	custList.get(i).setStart_Time2(startDate.replaceAll("-", "")+startTime.replaceAll(":", ""));
        	custList.get(i).setEnd_Date2(endDate.replaceAll("-", ""));
        	custList.get(i).setEnd_Time2(endDate.replaceAll("-", "")+endTime.replaceAll(":", ""));
    	}
    	
    	Date date = new Date();
    	SimpleDateFormat current = new SimpleDateFormat("yyyyMMdd");
    	SimpleDateFormat currentTime = new SimpleDateFormat("HH00");
    	
		// 고객이 예약한 예약리스트
		model.addAttribute("mySitterList", sitterList);
		//시터가 예약받은 예약리스트
    	model.addAttribute("myCustList", custList);
    	
    	model.addAttribute("date", current.format(date));
    	model.addAttribute("currentTime", current.format(date)+currentTime.format(date));
    	System.out.println(current.format(date)+currentTime.format(date));
    	
	}
 
}
