package com.dingpet.customers.p001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.customers.p001.vo.Customers_P001_VO;

public interface Customers_P001_Controller {
	
	public void signin();
	public void signup();
	public void change();

}
