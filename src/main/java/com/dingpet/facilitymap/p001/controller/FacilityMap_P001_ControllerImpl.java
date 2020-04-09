package com.dingpet.facilitymap.p001.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.service.FacilityMap_P001_Service;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/facilitymap/p001/*")
@AllArgsConstructor
@Log4j
@Controller
public class FacilityMap_P001_ControllerImpl implements FacilityMap_P001_Controller{
	
	private FacilityMap_P001_Service service;
	
	@RequestMapping("/mylocation")
	public void mylocation(Model model) {
		
	}
	
	@RequestMapping("/facilityMap")
	public void facilityMap(Model model) {
		
	}
	
	@GetMapping("/medicenterMap")
	@Override
	public void medicenterMap(@ModelAttribute("PlaceDTO") PlaceDTO dto, Model model, FacilityMap_P001_VO vo) {
		log.info("====mediMap Method====");
		log.info(dto);
		log.info(service);
		model.addAttribute("sample", "Hello List");
		model.addAttribute("places", service.getMediMap(dto));		
	}	
}
