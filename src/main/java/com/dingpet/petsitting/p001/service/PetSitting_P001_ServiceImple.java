package com.dingpet.petsitting.p001.service;

import org.springframework.stereotype.Service;

import com.dingpet.petsitting.p001.mapper.PetSitting_P001_Mapper;
import com.dingpet.petsitting.p001.vo.PetSitting_P001_VO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PetSitting_P001_ServiceImple implements PetSitting_P001_Service{
	
	private PetSitting_P001_Mapper mapper;

	@Override
	public void profile(PetSitting_P001_VO profile) {
		// TODO Auto-generated method stub
		mapper.inserttest(profile);
	}
}
