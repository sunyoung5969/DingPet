package com.dingpet.lostpets.p003.service;

import org.springframework.stereotype.Service;

import com.dingpet.lostpets.p003.mapper.LostPets_P003_Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class LostPets_P003_ServiceImple implements LostPets_P003_Service{

	private LostPets_P003_Mapper mapper;
	
}
