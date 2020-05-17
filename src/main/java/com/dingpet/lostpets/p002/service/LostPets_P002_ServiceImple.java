package com.dingpet.lostpets.p002.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingpet.lostpets.p002.mapper.LostPets_P002_Mapper;
import com.dingpet.lostpets.p002.vo.LostPets_P002_VO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class LostPets_P002_ServiceImple implements LostPets_P002_Service{

	private LostPets_P002_Mapper mapper;
	
	//주인 찾기 
	public List<LostPets_P002_VO> getLost(LostPets_P002_VO vo){
		return mapper.getLost(vo);
	}

	//주인 찾기 
	public List<LostPets_P002_VO> getFind(LostPets_P002_VO vo){
		return mapper.getFind(vo);
	}
}
