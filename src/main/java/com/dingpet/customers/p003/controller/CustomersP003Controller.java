package com.dingpet.customers.p003.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.customers.p003.service.CustomersP003Service;

import lombok.AllArgsConstructor;

@RequestMapping("/customers/p003/*")
@AllArgsConstructor
@Controller
public class CustomersP003Controller {

	private CustomersP003Service service;
	
	@RequestMapping("/infoupdate")
	public void infoupdate(Model model) {
		
		model.addAttribute("info", "infoupdate 페이지입니다");
		
	}
}
