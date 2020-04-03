package com.dingpet.facilitymap.p001.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.facilitymap.p001.service.FacilityMap_P001_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/facilitymap/p001/*")
@AllArgsConstructor
@Controller
public class FacilityMap_P001_ControllerImpl implements FacilityMap_P001_Controller{
	
	private FacilityMap_P001_Service service;
	
	@RequestMapping("/mylocation")
	public void mylocation(Model model) {
		
	}
	
	@RequestMapping("/facilityMap")
	public void facilityMap(Model model) {
		
	}
}
