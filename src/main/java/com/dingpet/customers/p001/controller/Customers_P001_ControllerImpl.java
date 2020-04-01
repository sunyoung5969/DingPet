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
	
	@RequestMapping("/signin")
	@Override
	public void signin(Model model) {
		// TODO Auto-generated method stub
		
		System.out.println("¿ÀÄÉ¤Ä¤»¿ÀÄáÄĞÄáÄÉ±¿À¿À¿ÀÄÉÄÉ±Q¿ÀÄĞÀÌ¿ÀÄÉÀÌ");
		
		int test = service.getTotal();
		
		model.addAttribute("test", test);
		
	}
	
	@RequestMapping("/signup")
	@Override
	public void signup(Model model) {
		// TODO Auto-generated method stub
		
	}
	
	@RequestMapping("/change")
	@Override
	public void change(Model model) {
		// TODO Auto-generated method stub
		
	}
	


	
	

	
	

}
