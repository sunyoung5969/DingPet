package com.dingpet.petsitting.p002.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import com.dingpet.petsitting.p002.vo.PetSitting_P002_VO;

public interface PetSitting_P002_Controller {

	public String reservation(HttpServletRequest request ,PetSitting_P002_VO reserved, Model model);
	
	public void kakaoPaySuccess(String pg_token,HttpServletRequest request, Model model);
	
	public void reservationlist(HttpServletRequest request, Model model, PetSitting_P002_VO reserved);

	public String reservationicancel(Model model, PetSitting_P002_VO reserved);
}
