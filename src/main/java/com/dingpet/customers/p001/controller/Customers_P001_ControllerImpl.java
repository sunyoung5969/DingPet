package com.dingpet.customers.p001.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.customers.p001.service.Customers_P001_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/customers/p001/*")
@AllArgsConstructor
@Controller
public class Customers_P001_ControllerImpl implements Customers_P001_Controller {
	
	private Customers_P001_Service service;
	

	@RequestMapping("/signin_f")
	@Override
	public void signin_f() {
		// TODO Auto-generated method stub
		
	}

	@RequestMapping("/signup_f")
	@Override
	public void signup_f() {
		// TODO Auto-generated method stub
		
	}
	
	


	
	

	
	

}
