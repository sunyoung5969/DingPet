package com.dingpet.customers.p003.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dingpet.customers.p003.service.Customers_P003_Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/customers/p003/*")
@AllArgsConstructor
@Controller
public class Customers_P003_ControllerImpl implements Customers_P003_Controller{

	private Customers_P003_Service service;
	
	@RequestMapping(value="/infoupdate", method= {RequestMethod.GET})
	public void infoupdate() {
		log.info("일반 회원의 정보를 수정하는 페이지");
	}
	
	@GetMapping("/petsitterupdate")
	public void petsitterupdate() {
		log.info("펫시터 회원의 정보를 수정하는 페이지");
	}
}
