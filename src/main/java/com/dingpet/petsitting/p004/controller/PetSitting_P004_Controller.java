package com.dingpet.petsitting.p004.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.petsitting.p004.service.PetSitting_P004_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/petsitting/p004/*")
@AllArgsConstructor
@Controller
public class PetSitting_P004_Controller {
	
	private PetSitting_P004_Service service;
}
