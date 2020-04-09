package com.dingpet.customers.p001.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.customers.p001.service.Customers_P001_Service;
import com.dingpet.customers.p001.vo.Customers_P001_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/customers/p001/*")
@AllArgsConstructor
@Controller
@Log4j
public class Customers_P001_ControllerImpl implements Customers_P001_Controller {
	
	private Customers_P001_Service service;
	
	@GetMapping("/signin")
	public void signin() {
		log.info("로그인 페이지");
	}
	
	@GetMapping("/signup")
	public void signup() {
		log.info("회원가입 페이지");
	}
	
	@PostMapping("/signup")
	public String signup(Customers_P001_VO customers) {
		log.info("컨트롤러 회원가입 처리");
		//customers.setMember_id("heoinhye");
		//customers.setMember_pwd("12345");
		//customers.setMember_email("hoinhye@naver.com");
		//customers.setMember_nickname("허이네");
		service.signup(customers);
		
		return "redirect:/customers/p001/signin";
	}
	
	@GetMapping("/change")
	public void change() {
		log.info("펫시터회원 신청 페이지");
	}
	
	@PostMapping("/change")
	public void change(Customers_P001_VO customers) {
		log.info("컨트롤러 펫시터회원 신청 처리");
		service.change(customers);
	}	
	
	



	

	
	

}
