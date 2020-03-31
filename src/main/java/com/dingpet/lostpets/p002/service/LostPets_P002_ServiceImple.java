package com.dingpet.lostpets.p002.service;

import org.springframework.stereotype.Service;

import com.dingpet.lostpets.p002.mapper.LostPets_P002_Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class LostPets_P002_ServiceImple implements LostPets_P002_Service{

	private LostPets_P002_Mapper mapper;
	
}
