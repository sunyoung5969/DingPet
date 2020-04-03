package com.dingpet.petsitting.p001.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dingpet.petsitting.p001.service.PetSitting_P001_Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/petsitting/p001/*")
@AllArgsConstructor
@Controller
public class PetSitting_P001_ControllerImpl implements PetSitting_P001_Controller{
	
	private HttpServletRequest request;
	private PetSitting_P001_Service service;
	
	@RequestMapping("sitterlist")
	@Override
	public void petsitterlist(Model model) {
		// TODO Auto-generated method stub
		
	}

	@RequestMapping("profileregister")
	@Override
	public void register(Model model) {
		// TODO Auto-generated method stub
		
	}
	
	@RequestMapping(value="registerdata", method=RequestMethod.POST)
	@Override
	public String registerdata(Model model) {
		// TODO Auto-generated method stub
		String small = "";
		String middle = "";
		String big = "";
		
		try {
			/*
			small = (String)request.getParameter("small");
			middle = (String)request.getParameter("middle");
			big = (String)request.getParameter("big");
			String profilepic = (String)request.getParameter("profilepic");			// 프로필 사진
			String content = (String)request.getParameter("content");				// 내용
			String 장기예약 = (String)request.getParameter("장기예약");					// 장기예약
			String 노년케어 = (String)request.getParameter("노년케어");					// 노년케어
			String 목욕가능 = (String)request.getParameter("목욕가능");					// 목욕가능
			String 산책가능 = (String)request.getParameter("산책가능");					// 산책가능
			String 실내놀이 =	(String)request.getParameter("실내놀이");					// 실내놀이
			String 약물복용 =	(String)request.getParameter("약물복용");					// 약물복용
			String 집앞픽업 =	(String)request.getParameter("집앞픽업");					// 직앞픽업
			String 퍼피케어 =	(String)request.getParameter("퍼피케어");					// 퍼피케어
			String postcode = (String)request.getParameter("postcode");				// 우편번호
			String roadAddress = (String)request.getParameter("roadAddress");		// 도로명주소
			String jibunAddress = (String)request.getParameter("jibunAddress");		// 지번 주소
			String detailAddress = (String)request.getParameter("detailAddress");	// 상세 주소
			String extraAddress	= (String)request.getParameter("extraAddress");		// 참고 항목
			
			model.addAttribute("small", Integer.parseInt(small));
			model.addAttribute("middle", Integer.parseInt(middle));
			model.addAttribute("big", Integer.parseInt(big));
			
			log.info(profilepic);			// 프로필 사진
			log.info(content);				// 자기소개
			log.info(장기예약);				// 장기예약
			log.info(노년케어);				// 노년케어
			log.info(목욕가능);				// 목욕가능
			log.info(산책가능);				// 산책가능
			log.info(실내놀이);				// 실내놀이
			log.info(약물복용);				// 약물복용
			log.info(집앞픽업);				// 직앞픽업
			log.info(퍼피케어);				// 퍼피케어
			log.info(small);				// 소형견가격
			log.info(middle);				// 중형견가격
			log.info(big);					// 대형견 가격
			log.info(postcode);				// 우편번호
			log.info(roadAddress);			// 도로명주소
			log.info(jibunAddress);			// 지번 주소
			log.info(detailAddress);		// 상세 주소
			log.info(extraAddress);			// 참고 항목
			*/
			
		
			
		
				
				log.info(request.getParameterValues("closedSave.name"));

			
			
		} catch (Exception e) {
			// TODO: handle exception
		}		
	
	
		return "/petsitting/p001/sitterlist";
	}	
	
	@RequestMapping("/lookup")
	@Override
	public void lookup(Model model) {
		// TODO Auto-generated method stub
		
	}

	@RequestMapping("/update")
	@Override
	public void update(Model model) {
		// TODO Auto-generated method stub
		
	}

	@RequestMapping("/delete")
	@Override
	public void delete(Model model) {
		// TODO Auto-generated method stub
		
	}

	
}
