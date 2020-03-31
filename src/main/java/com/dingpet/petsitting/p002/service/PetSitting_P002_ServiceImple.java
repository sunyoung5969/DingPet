package com.dingpet.petsitting.p002.service;

import org.springframework.stereotype.Service;

import com.dingpet.petsitting.p002.mapper.PetSitting_P002_Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PetSitting_P002_ServiceImple implements PetSitting_P002_Service{
	
	private PetSitting_P002_Mapper mapper;
}
