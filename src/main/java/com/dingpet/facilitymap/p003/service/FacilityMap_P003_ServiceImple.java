package com.dingpet.facilitymap.p003.service;

import org.springframework.stereotype.Service;

import com.dingpet.facilitymap.p003.mapper.FacilityMap_P003_Mapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class FacilityMap_P003_ServiceImple implements FacilityMap_P003_Service{
	
	private FacilityMap_P003_Mapper mapper;
	
}
