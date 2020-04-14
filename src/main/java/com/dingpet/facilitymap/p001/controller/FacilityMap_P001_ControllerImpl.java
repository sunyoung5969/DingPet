package com.dingpet.facilitymap.p001.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	@Override
	public ResponseEntity<List<FacilityMap_P001_VO>> medicenterMap(PlaceDTO dto) {
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8"); 
		System.out.println("11111111111");
		log.info("====mediMap Method====");
		List<FacilityMap_P001_VO> list = service.getMediMap(dto);
		log.info(dto);
		log.info(service);
		String msg = "";
		boolean status = list.isEmpty();
		if (status) {
			msg = "fail";
		} else {
			msg = "success";
		}
		log.info(msg);
		log.info("====End Map Method====");
		return new ResponseEntity<>(list, HttpStatus.OK);	
	} // medicenter End
		
	@GetMapping("/mediMap2")
	@ResponseBody
	@Override
	public ResponseEntity<List<FacilityMap_P001_VO>> mediMap2(PlaceDTO dto) {
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8"); 
		log.info("====Map22 Method====");
		List<FacilityMap_P001_VO> data = service.getMediMap2(dto);
		log.info(dto);
		log.info(service);
		String msg = "";
		boolean status = data.isEmpty();
		if (status) {
			msg = "fail";
		} else {
			msg = "success";
		}
		log.info(msg);
		log.info("====End Map22 Method====");
		return new ResponseEntity<>(data, HttpStatus.OK);	
	} // mediMap End
	
	@RequestMapping("/register")
	public void test(Model model) {
		
		model.addAttribute("register", "등록 페이지 입니다");
	}
	@RequestMapping("/infopage")
	public void facilityinfo(@RequestParam("place_num") int place_num, Model model) {
		System.out.println("1111111111111111111111111111111111111111111111111111111111111111111");
		model.addAttribute("infopage", "조회 페이지 입니다");
		model.addAttribute("sample", "Hello List");
		model.addAttribute("info", service.getMediCenter(place_num));
		
	}
	
	
}
