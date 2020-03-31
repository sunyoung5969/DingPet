package com.dingpet.customers.p005.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.customers.p005.service.P005Service;

import lombok.AllArgsConstructor;

@RequestMapping("/customers/p005/*")
@AllArgsConstructor
@Controller
public class P005Controller {

	private P005Service service;
	
	@RequestMapping("/massage")
	public void massage(Model model) {
		
		model.addAttribute("massage", "메시지페이지입니당");
		
	}
}
