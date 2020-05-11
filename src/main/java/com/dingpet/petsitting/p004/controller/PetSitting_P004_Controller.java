package com.dingpet.petsitting.p004.controller;

import org.springframework.ui.Model;

import com.dingpet.petsitting.p004.vo.PetSitting_P004_VO;

public interface PetSitting_P004_Controller {

	public void reviewregister(Model model, PetSitting_P004_VO reviewVO);
	
	public void reviewregisterconfirm(Model model, PetSitting_P004_VO reviewVO);

}
