package com.dingpet.lostpets.p002.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.lostpets.p002.service.LostPets_P002_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/lostpets/p002/*")
@AllArgsConstructor
@Controller
public class LostPets_P002_Controller {

	private LostPets_P002_Service service;
}
