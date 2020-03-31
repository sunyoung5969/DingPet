package com.dingpet.facilitymap.p004.service;

import org.springframework.stereotype.Service;

import com.dingpet.facilitymap.p004.mapper.FacilityMap_P004_Mapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class FacilityMap_P004_ServiceImple implements FacilityMap_P004_Service {
	
	private FacilityMap_P004_Mapper mapper;
	
}
