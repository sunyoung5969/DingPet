package com.dingpet.customers.p001.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.dingpet.customers.p001.service.Customers_P001_Service;
import com.dingpet.customers.p001.vo.Customers_P001_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@AllArgsConstructor
@Controller
@Log4j
@RequestMapping("/customers/p001/*")
public class Customers_P001_ControllerImpl implements Customers_P001_Controller {
	
	private Customers_P001_Service service;
	

	@RequestMapping(value="/mem", method = {RequestMethod.POST})
	public void signin(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		log.info("id중복체크");

		PrintWriter pw = response.getWriter();
		
		String id = (String)request.getParameter("id");
	
		int overlappedId = service.overlappedId(id);
		
		if(overlappedId >= 1) {
			pw.print("not_usable");
		}else {
			pw.print("usable");
		}
	
	}	
	
	
	@RequestMapping(value="/logout", method= {RequestMethod.GET})
	public ModelAndView signout(HttpServletRequest request, HttpServletResponse response) {
		log.info("로그아웃");
		HttpSession session = request.getSession();
		session.removeAttribute("customers");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	
	@RequestMapping(value="/signin", method = {RequestMethod.GET})
	public void signin() {
		log.info("로그인 페이지 출력");
	}
	
	@RequestMapping(value="/signin", method = {RequestMethod.POST})
	public ModelAndView signin(@ModelAttribute("customers") Customers_P001_VO customers,
			HttpServletRequest request, HttpServletResponse response)  {
		log.info("로그인 처리");	
		ModelAndView mav = new ModelAndView();
		Customers_P001_VO result = service.loginCheck(customers);
				
		if(result != null) {
			HttpSession session = request.getSession();
			session.setAttribute("customers", result);
			session.setAttribute("isLogOn", true);
			mav.setViewName("redirect:/");
			log.info("로그인 성공");
			
		}else {
			mav.setViewName("redirect:/customers/p001/signin");
			log.info("로그인 실패");
		}
		
		return mav;
	
	}
	
	
	
	@GetMapping("/signup")
	public void signup() {
		log.info("회원가입 페이지");
	}
	
	@PostMapping("/signup")
	public String signup(Customers_P001_VO customers) {
		log.info("회원가입 처리");
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



	@RequestMapping(value="/myinfo", method= {RequestMethod.GET})
	public void myinfo() {
		log.info("내정보");
	}


	@Override
	public void signout() {
		// TODO Auto-generated method stub
		
	}




}
