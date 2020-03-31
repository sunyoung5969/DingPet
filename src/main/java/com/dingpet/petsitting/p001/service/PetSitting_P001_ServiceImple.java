package com.dingpet.petsitting.p001.service;

import org.springframework.stereotype.Service;

import com.dingpet.petsitting.p001.mapper.PetSitting_P001_Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PetSitting_P001_ServiceImple implements PetSitting_P001_Service{
	
	private PetSitting_P001_Mapper mapper;
}
