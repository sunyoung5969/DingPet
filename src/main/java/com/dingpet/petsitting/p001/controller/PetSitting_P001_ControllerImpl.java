package com.dingpet.petsitting.p001.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.petsitting.p001.service.PetSitting_P001_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/petsitting/p001/*")
@AllArgsConstructor
@Controller
public class PetSitting_P001_ControllerImpl implements PetSitting_P001_Controller{
	
	private PetSitting_P001_Service service;

	@RequestMapping("sitterlist")
	@Override
	public void petsitterlist(Model model) {
		// TODO Auto-generated method stub
		
	}

	@RequestMapping("profileregister")
	@Override
	public void profileregister(Model model) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}
