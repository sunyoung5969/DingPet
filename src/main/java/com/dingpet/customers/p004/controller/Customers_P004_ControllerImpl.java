package com.dingpet.customers.p004.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.customers.p004.service.Customers_P004_Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/customers/p004/*")
@AllArgsConstructor
@Controller
public class Customers_P004_ControllerImpl implements Customers_P004_Controller{

	private Customers_P004_Service service;	
	
	@RequestMapping("/withdraw")
	public String withdraw(String member_id, RedirectAttributes rttr) {
		if(service.withdraw(member_id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/index";
	}
	
	
	//회원탈퇴완료 페이지
	@RequestMapping(value="/withdraw_", method={RequestMethod.GET})
	public void withdraw_() {
		log.info("회원탈퇴완료 페이지");
	}
	
	
	
	
}
