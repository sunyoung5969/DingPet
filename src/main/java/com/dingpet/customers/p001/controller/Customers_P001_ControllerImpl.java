package com.dingpet.customers.p001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dingpet.customers.p001.service.Customers_P001_Service;
import com.dingpet.customers.p001.vo.Customers_P001_VO;

import lombok.AllArgsConstructor;

@RequestMapping("/customers/p001/*")
@AllArgsConstructor
@Controller
public class Customers_P001_ControllerImpl implements Customers_P001_Controller {
	
	private Customers_P001_Service service;
	
/*
@RequestMapping("/min")
	@Override
	public String signin_f(ModelAndView mav, HttpServletRequest request, HttpServletResponse response) {
		String mem_id = request.getParameter("mem_id");
		
		mav = new ModelAndView();
		mav.addObject("mem_id", mem_id);
		
		return "change";
	}
*/
	

	@RequestMapping("/signup_f")
	@Override
	public void signup_f(Customers_P001_VO member) {
		// TODO Auto-generated method stub

	}
	
	
	@RequestMapping("/insertmem")
	public void insertmem(Customers_P001_VO member) {
		
		member.setMember_id("2999");
		member.setMember_email("eeee");
		member.setMember_nickname("nnnnn");
		member.setMember_pwd("ppppp");
		
		service.insertmember(member);
	}
	
	


	
	

}
