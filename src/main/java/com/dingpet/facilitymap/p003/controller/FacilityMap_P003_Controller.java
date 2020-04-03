package com.dingpet.facilitymap.p003.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.facilitymap.p003.service.FacilityMap_P003_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/facilitymap/p003/*")
@AllArgsConstructor
@Controller
public class FacilityMap_P003_Controller {

	private FacilityMap_P003_Service service;
	
	@RequestMapping("/register")
	public void test(Model model) {
		
		model.addAttribute("register", "등록 페이지 입니다");
	}
}
