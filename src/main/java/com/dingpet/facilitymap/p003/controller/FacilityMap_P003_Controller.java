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
	
	//=== 샘플페이지 시작 ===
	@RequestMapping("/facilityinfo_f")
	public void facilityinfo_f(Model model) {
		
	}
		
	@RequestMapping("/facilityregister_f")
	public void facilityregister_f(Model model) {
		
	}
	//=== 샘플페이지 끝 ===	
}
