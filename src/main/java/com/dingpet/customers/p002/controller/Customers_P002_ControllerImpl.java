package com.dingpet.customers.p002.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.customers.p002.service.Customers_P002_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/customers/p002/*")
@AllArgsConstructor
@Controller
public class Customers_P002_ControllerImpl implements Customers_P002_Controller {

	private Customers_P002_Service service;
	
	@RequestMapping("/lostid")
	public void lostid(Model model) {
		
		System.out.println("반려견을 잃어버렸어요");
		
		int test2 = service.getTotal();
		
		model.addAttribute("test2", test2);
		
	}
	
}
