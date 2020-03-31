package com.dingpet.lostpets.p003.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.lostpets.p003.service.LostPets_P003_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/lostpets/p003/*")
@AllArgsConstructor
@Controller
public class LostPets_P003_Controller {

	private LostPets_P003_Service service;
}
