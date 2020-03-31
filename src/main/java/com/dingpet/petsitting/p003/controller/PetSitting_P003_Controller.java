package com.dingpet.petsitting.p003.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.petsitting.p003.service.PetSitting_P003_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/petsitting/p003/*")
@AllArgsConstructor
@Controller
public class PetSitting_P003_Controller {
	
	private PetSitting_P003_Service service;
}
