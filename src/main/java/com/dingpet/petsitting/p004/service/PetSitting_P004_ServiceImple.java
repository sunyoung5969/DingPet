package com.dingpet.petsitting.p004.service;

import org.springframework.stereotype.Service;

import com.dingpet.petsitting.p004.mapper.PetSitting_P004_Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PetSitting_P004_ServiceImple implements PetSitting_P004_Service{
	
	private PetSitting_P004_Mapper mapper;
}
