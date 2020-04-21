package com.dingpet.customers.p005.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.customers.p005.service.CustomersP005Service;
import com.dingpet.customers.p005.vo.CustomersP005VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/customers/p005/*")
@AllArgsConstructor
@Controller
public class Customers_P005_ControllerImpl implements Customers_P005_Controller{

	private CustomersP005Service service;
	
	//@RequestMapping("/message")
	//public void message(Model model) {
	//	
	//	model.addAttribute("message", "메시지 페이지 입니당");	
	//}
	
	@RequestMapping("/message")
	public CustomersP005VO inbox(String member_id) {
		log.info("메세지함controller");
		service.inbox(member_id);
		return service.inbox(member_id);
		
	}

}
