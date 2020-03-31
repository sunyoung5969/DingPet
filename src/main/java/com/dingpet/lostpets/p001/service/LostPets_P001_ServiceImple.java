package com.dingpet.lostpets.p001.service;

import org.springframework.stereotype.Service;

import com.dingpet.lostpets.p001.mapper.LostPets_P001_Mapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class LostPets_P001_ServiceImple implements LostPets_P001_Service{

	private LostPets_P001_Mapper mapper;
	
}
