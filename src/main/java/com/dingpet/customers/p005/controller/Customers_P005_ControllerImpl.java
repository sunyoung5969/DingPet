package com.dingpet.customers.p005.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.customers.p005.service.CustomersP005Service;

import lombok.AllArgsConstructor;

@RequestMapping("/customers/p005/*")
@AllArgsConstructor
@Controller
public class Customers_P005_ControllerImpl implements Customers_P005_Controller{

	private CustomersP005Service service;
	
	@RequestMapping("/massage")
	public void massage(Model model) {
		
		model.addAttribute("massage", "메시지 페이지 입니당");
		
	}
}
