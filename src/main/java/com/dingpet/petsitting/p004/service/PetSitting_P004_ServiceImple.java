package com.dingpet.petsitting.p004.service;

import org.springframework.stereotype.Service;

import com.dingpet.petsitting.p004.mapper.PetSitting_P004_Mapper;
import com.dingpet.petsitting.p004.vo.PetSitting_P004_VO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PetSitting_P004_ServiceImple implements PetSitting_P004_Service{
	
	private PetSitting_P004_Mapper mapper;

	@Override
	public int getReviewIDSequence() {
		// TODO Auto-generated method stub
		return mapper.getReviewIDSequence();
	}

	@Override
	public void setReview(PetSitting_P004_VO reviewVO) {
		// TODO Auto-generated method stub
		mapper.setReview(reviewVO);
	}


}
