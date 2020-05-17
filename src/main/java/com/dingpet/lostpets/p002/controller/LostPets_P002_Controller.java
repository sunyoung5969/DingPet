package com.dingpet.lostpets.p002.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dingpet.lostpets.p002.service.LostPets_P002_Service;
import com.dingpet.lostpets.p002.vo.LostPets_P002_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/lostpets/p002/")
@Controller
@AllArgsConstructor
public class LostPets_P002_Controller {
	
	LostPets_P002_Service service;
	
	@GetMapping("/map")
	public void map() {
		
	}

	@GetMapping("/map/{category}")
	@ResponseBody
	public ResponseEntity<List<LostPets_P002_VO>> getMarkers(LostPets_P002_VO vo, @PathVariable("category") String category){
		return new ResponseEntity<>(service.getLost(vo), HttpStatus.OK);
	}
}
