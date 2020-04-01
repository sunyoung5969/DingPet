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
	
}
