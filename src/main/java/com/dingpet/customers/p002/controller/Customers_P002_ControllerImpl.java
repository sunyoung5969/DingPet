package com.dingpet.customers.p002.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dingpet.customers.p002.service.Customers_P002_Service;
import com.dingpet.customers.p002.vo.Customers_P002_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@RequestMapping("/customers/p002/*")
@AllArgsConstructor
@Controller
public class Customers_P002_ControllerImpl implements Customers_P002_Controller {

	private Customers_P002_Service service;
	
	@RequestMapping(value="/lostid", method = {RequestMethod.GET})
	public void lostid() {
		System.out.println("아이디찾기 페이지");
	}
	
	//아이디 찾기
	@RequestMapping(value="/lostid", method = {RequestMethod.POST})
	public String lostid(Customers_P002_VO id) {
		System.out.println("아이디찾기");
		System.out.println(service.lostId(id));
		return "redirect:/customers/p001/signin";
	}
	
		@RequestMapping(value="/lostpwd", method = {RequestMethod.GET})
		public void lostpwd() {
			System.out.println("비밀번호찾기 페이지");
		}
	
	//비밀번호 찾기
	@RequestMapping(value="/lostpwd", method = {RequestMethod.POST})
	public String lostpwd(Customers_P002_VO pwd) {
		System.out.println("비밀번호찾기 페이지");
		System.out.println(service.lostPwd(pwd));
		return "redirect:/customers/p001/signin";
	}
	
	
	
	@RequestMapping("/checkid")
	@Override
	public void checkid() {
		System.out.println("아이디 확인");
	}
	

	@RequestMapping("/changepwd")
	@Override
	public void changepwd() {
		System.out.println("비밀번호를 변경할래요");
		
	}


}
