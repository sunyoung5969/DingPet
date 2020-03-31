package com.dingpet.facilitymap.p002.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.facilitymap.p002.service.FacilityMap_P002_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/facilitymap/p002/*")
@AllArgsConstructor
@Controller
public class FacilityMap_P002_Controller {

	private FacilityMap_P002_Service service;
	
	@RequestMapping("/categories")
	public void categories(Model model) {
		
	}
}
