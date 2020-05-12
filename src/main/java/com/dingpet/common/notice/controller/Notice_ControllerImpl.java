package com.dingpet.common.notice.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dingpet.common.notice.service.Notice_Service;
import com.dingpet.common.notice.vo.Notice_VO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RequestMapping("/common/notice/*")
@Controller
public class Notice_ControllerImpl implements Notice_Controller {
	
	private Notice_Service service;

	@RequestMapping(value="setNotice", method=RequestMethod.POST )
	@Override
	@ResponseBody
	public Map setNotice(HttpServletRequest request, Model model, Notice_VO noticeVO) {
		// TODO Auto-generated method stub
		
		System.out.println("알림 데이터 디비 삽입 컨트롤러 진입");
		
		Map map = new HashMap();
		
	//---------------------------- 알림 번호 생성 ------------------------------	
		String noticeid = "";

		Date date = new Date();
		SimpleDateFormat formdate = new SimpleDateFormat("yyMMdd");
		noticeid = formdate.format(date);
		
		String seq = String.format("%04d", service.getNoticeIdSequence());
		
		noticeid += seq;
		
		noticeVO.setNotice_ID(noticeid);	// 알림번호 vo에 저장
	//----------------------------------------------------------------------
		
	//---------------------------- 알림 날짜 생성 ------------------------------
		SimpleDateFormat formdate2 = new SimpleDateFormat("yy/MM/dd HH:mm");
		String sendDate = formdate2.format(date);
		noticeVO.setSend_Date(sendDate);	// 알림날짜 vo에 저장
	//----------------------------------------------------------------------
		
	//---------------------------- 데이터 가져오기 -----------------------------
		noticeVO.setMember_ID(request.getParameter("member_ID"));				// 받는 유저 아이디 저장
		noticeVO.setSender_ID(request.getParameter("sender_ID"));				// 보내는 유저 아이디 저장
		noticeVO.setNotice_Contents(request.getParameter("notice_Contents"));	// 알림 내용 저장
		noticeVO.setUrl(request.getParameter("url"));							// 매핑 주소 저장
	//----------------------------------------------------------------------
		service.setNotice(noticeVO);	// 디비에 데이터 삽입

		try {
			map.put("status", "ok");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("status", "fail");
		}
		
		return map;
	}
	
	@RequestMapping(value = "noticeCount", method=RequestMethod.POST)
	@Override
	@ResponseBody
	public Map getNoticeCount(HttpServletRequest request, Notice_VO noticeVO) {
		// TODO Auto-generated method stub

		noticeVO.setMember_ID(request.getParameter("member_id"));
		
		Map data = new HashMap();
		
		data.put("count", service.getNotieCount(noticeVO));
		
		return data;
	}
	
	@RequestMapping(value = "getnotice", method=RequestMethod.POST)
	@Override
	@ResponseBody
	public Map getNotice(HttpServletRequest request, Model model, Notice_VO noticeVO) {
		// TODO Auto-generated method stub
		
		Map map = new HashMap();
		
		noticeVO.setMember_ID(request.getParameter("member_id"));
		//model.addAttribute("noticeList", service.getNotice(noticeVO));
		
		map.put("result", service.getNotice(noticeVO));
		System.out.println(map.get("result"));
		return map;
	}

	@RequestMapping("mappingurl")
	@Override
	public String mappingURL(HttpServletRequest request, Notice_VO noticeVO) {
		// TODO Auto-generated method stub
		
		String type = request.getParameter("notice_Type");
		String member_ID = request.getParameter("member_ID");
		
		noticeVO.setNotice_Type(type);
		noticeVO.setMember_ID(member_ID);
		
		if(type.equals("예약")) {
			// 알람 테이블 읽음확인 변경 
			
			service.readNotice(noticeVO);
			
			return "redirect:/petsitting/p002/reservationlist";
		}
		return null;
	}

}
