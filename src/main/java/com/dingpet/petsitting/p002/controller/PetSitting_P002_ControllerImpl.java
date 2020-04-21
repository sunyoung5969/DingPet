package com.dingpet.petsitting.p002.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dingpet.petsitting.p002.service.KakaoPay;
import com.dingpet.petsitting.p002.service.PetSitting_P002_Service;
import com.dingpet.petsitting.p002.vo.KakaoPayApprovalVO;
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
		
		System.out.println("왜 안넘오인 : "+reserved);
		
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
        log.info("결제결제결제 " +reserved_info.getApproved_at());
        String date = form.format(reserved_info.getCreated_at());
        
   //--------------------------------------------------------------------------------------------
        
        reserved.setPayment_Date(date);
        reserved.setVat(reserved_info.getAmount().getVat()); 	
        reserved.setItem_Name(reserved_info.getItem_name());
       
        session.removeAttribute("reinfo");
        
        service.reservationInsert(reserved);
        
        model.addAttribute("info", reserved);
        
	}

}
