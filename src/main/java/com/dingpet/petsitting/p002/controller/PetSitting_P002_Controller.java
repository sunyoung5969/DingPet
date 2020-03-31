package com.dingpet.petsitting.p002.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.petsitting.p002.service.PetSitting_P002_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/petsitting/p002/*")
@AllArgsConstructor
@Controller
public class PetSitting_P002_Controller {
	
	private PetSitting_P002_Service service;
}
