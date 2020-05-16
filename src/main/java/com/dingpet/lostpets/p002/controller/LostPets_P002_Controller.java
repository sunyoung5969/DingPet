package com.dingpet.lostpets.p002.controller;

import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;
import com.dingpet.lostpets.p002.service.LostPets_P002_Service;
import com.dingpet.lostpets.p002.vo.LostPets_P002_VO;

import lombok.AllArgsConstructor;

@RequestMapping("/lostpets/p002/")
@Controller
@AllArgsConstructor
public class LostPets_P002_Controller {
	
	LostPets_P002_Service service;
	
	@GetMapping("/map")
	public void map() {
		
	}
/*
	@GetMapping
	public ResponseEntity<List<LostPets_P002_VO>> display(){
		
		
		return new ResponseEntity<>(service.myList(member_id), HttpStatus.OK);
	}*/
}
