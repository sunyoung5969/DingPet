package com.dingpet.petsitting.p003.service;

import org.springframework.stereotype.Service;

import com.dingpet.petsitting.p003.mapper.PetSitting_P003_Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PetSitting_P003_ServiceImple implements PetSitting_P003_Service{
	
	private PetSitting_P003_Mapper mapper;
}
