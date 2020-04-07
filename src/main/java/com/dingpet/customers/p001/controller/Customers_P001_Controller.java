package com.dingpet.customers.p001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.dingpet.customers.p001.vo.Customers_P001_VO;

public interface Customers_P001_Controller {
	
/*
public String signin_f(ModelAndView mav, HttpServletRequest request, HttpServletResponse response);
*/
	
	
	//샘플페이지 시작
	public void signup_f(Customers_P001_VO member);

	public void insertmem(Customers_P001_VO member);
	
	
	
}
