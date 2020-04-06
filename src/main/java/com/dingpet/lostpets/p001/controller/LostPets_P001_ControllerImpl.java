package com.dingpet.lostpets.p001.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.lostpets.p001.service.LostPets_P001_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/lostpets/p001/*")
@AllArgsConstructor
@Controller
public class LostPets_P001_ControllerImpl implements LostPets_P001_Controller {
	
	private LostPets_P001_Service service;

	//샘플페이지 시작
	@RequestMapping("/tempshelterslist_f")
	@Override
	public void tempshelterslist_f() {
		
	}
	
	@RequestMapping("/tempsheltersregister_f")
	@Override
	public void tempsheltersregister_f() {
		
	}
	//샘플페이지 끝
}
