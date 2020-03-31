package com.dingpet.customers.p004.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.customers.p004.service.CustomersP004Service;

import lombok.AllArgsConstructor;

@RequestMapping("/customers/p004/*")
@AllArgsConstructor
@Controller
public class CustomersP004Controller {

	private CustomersP004Service service;	
	
	@RequestMapping("/withdraw")
	public void withdraw(Model model) {
		
		model.addAttribute("with", "회원탈퇴페이지입니다");
	}
	
}
