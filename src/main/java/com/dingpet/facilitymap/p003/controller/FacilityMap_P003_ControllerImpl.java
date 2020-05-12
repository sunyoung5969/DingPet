package com.dingpet.facilitymap.p003.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dingpet.facilitymap.p003.service.FacilityMap_P003_Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@RequestMapping("/facilitymap/p003/*")
@AllArgsConstructor
@Log4j
@Controller
public class FacilityMap_P003_ControllerImpl implements FacilityMap_P003_Controller{
	
	private FacilityMap_P003_Service service;
	
//	@RequestMapping("/register")
//	public void test(Model model) {
//		
//		model.addAttribute("register", "등록 페이지 입니다");
//	}
	
}
