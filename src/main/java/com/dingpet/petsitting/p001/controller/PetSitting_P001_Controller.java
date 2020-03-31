package com.dingpet.petsitting.p001.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.petsitting.p001.service.PetSitting_P001_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/petsitting/p001/*")
@AllArgsConstructor
@Controller
public class PetSitting_P001_Controller {
	
	private PetSitting_P001_Service service;
}
