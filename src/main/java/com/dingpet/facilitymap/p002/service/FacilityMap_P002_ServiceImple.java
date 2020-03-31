package com.dingpet.facilitymap.p002.service;

import org.springframework.stereotype.Service;

import com.dingpet.facilitymap.p002.mapper.FacilityMap_P002_Mapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class FacilityMap_P002_ServiceImple implements FacilityMap_P002_Service{
	
	private FacilityMap_P002_Mapper mapper;
	
}
