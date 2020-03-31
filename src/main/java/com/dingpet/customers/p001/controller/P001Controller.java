package com.dingpet.customers.p001.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.customers.p001.service.P001Service;

import lombok.AllArgsConstructor;

@RequestMapping("/customers/p001/*")
@AllArgsConstructor
@Controller
public class P001Controller {
	
	private P001Service service;
	
	@RequestMapping("/signin")
	public void signin(Model model) {
		
		System.out.println("제발요");
		int test = service.getTotal();
		
		model.addAttribute("test", test);
		
	}
	
	@RequestMapping("/signup")
	public void signup(Model model) {
		
		System.out.println("제발요");
		int test = service.getTotal();
		
		model.addAttribute("test", test);
		
	}
	
	@RequestMapping("/change")
	public void change(Model model) {
		
		System.out.println("제발요");
		int test = service.getTotal();
		
		model.addAttribute("test", test);
		
	}
}
