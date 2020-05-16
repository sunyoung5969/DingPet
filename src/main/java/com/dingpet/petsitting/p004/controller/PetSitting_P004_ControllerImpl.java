package com.dingpet.petsitting.p004.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dingpet.petsitting.p004.service.PetSitting_P004_Service;
import com.dingpet.petsitting.p004.vo.PetSitting_P004_VO;

import lombok.AllArgsConstructor;

@RequestMapping("/petsitting/p004/*")
@AllArgsConstructor
@Controller
public class PetSitting_P004_ControllerImpl implements PetSitting_P004_Controller {
	
	private PetSitting_P004_Service service;
	
	@RequestMapping("reviewregister")
	@Override
	public void reviewregister(Model model, PetSitting_P004_VO reviewVO) {
		// TODO Auto-generated method stub
		System.out.println("skldjalksjdlkasjdlkasjdlkas " + reviewVO.getReservation_ID());
		model.addAttribute("reservation_ID", reviewVO.getReservation_ID());
	}

	@RequestMapping(value="reviewregisterconfirm", method=RequestMethod.POST)
	@Override
	public void reviewregisterconfirm(Model model, PetSitting_P004_VO reviewVO) {
		// TODO Auto-generated method stub
		
		
	//---------------------리뷰 날짜 생성 ------------------------------
		
		String reviewID = reviewVO.getReservation_ID();
		
		int seq_review_id = service.getReviewIDSequence();
		
		String seq = String.format("%04d", seq_review_id);
		
		reviewID += seq;
		
		reviewVO.setReview_ID(reviewID);
	
	//--------------------------------------------------------------
	
	//---------------------리뷰 번호 생성 ------------------------------
		
		Date date = new Date();
		
		SimpleDateFormat reviewform = new SimpleDateFormat("yy/MM/dd HH:mm");
		
		String reviewDate = reviewform.format(date);
		
		
		reviewVO.setReview_Date(reviewDate);
		
	//--------------------------------------------------------------
		
		model.addAttribute("ok", reviewVO);
		System.out.println("?????????????????");
		System.out.println(reviewVO);
		service.setReview(reviewVO);
	}
}
