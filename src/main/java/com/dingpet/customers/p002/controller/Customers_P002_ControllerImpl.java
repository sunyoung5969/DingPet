package com.dingpet.customers.p002.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dingpet.customers.p002.service.Customers_P002_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/customers/p002/*")
@AllArgsConstructor
@Controller
public class Customers_P002_ControllerImpl implements Customers_P002_Controller {

	private Customers_P002_Service service;
	
	@RequestMapping(value="/lostid", method = {RequestMethod.GET})
	public void lostid() {
		System.out.println("아이디분실");
	}
	
	
	
	@RequestMapping("/checkid")
	@Override
	public void checkid() {
		System.out.println("아이디 확인");
	}
	
	@RequestMapping("/lostpwd")
	@Override
	public void lostpwd() {
		System.out.println("비밀번호를 잊어버렸어요");
	}

	@RequestMapping("/changepwd")
	@Override
	public void changepwd() {
		System.out.println("비밀번호를 변경할래요");
		
	}
	
}
