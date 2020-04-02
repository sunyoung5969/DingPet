package com.dingpet.customers.p003.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.customers.p003.service.Customers_P003_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/customers/p003/*")
@AllArgsConstructor
@Controller
public class Customers_P003_ControllerImpl implements Customers_P003_Controller{

	private Customers_P003_Service service;
	
	@RequestMapping("/infoupdate")
	public void infoupdate(Model model) {
		
		model.addAttribute("info", "infoupdate 페이지 입니당");
		
	}
}
