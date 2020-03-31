package com.dingpet.customers.p002.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.customers.p002.service.P002Service;

import lombok.AllArgsConstructor;

@RequestMapping("/customers/p002/*")
@AllArgsConstructor
@Controller
public class P002Controller {

	private P002Service service;
	
	@RequestMapping("/lostid")
	public void lostid(Model model) {
		
		System.out.println("©юди╓д╓╩©юдАдпдАди·╠©ю©ю©юдиди╠Q©юдпюл©юдиюл");
		
		int test2 = service.getTotal();
		
		model.addAttribute("test2", test2);
		
	}
	
}
