package com.dingpet.facilitymap.p005.service;

import org.springframework.stereotype.Service;

import com.dingpet.facilitymap.p005.mapper.FacilityMap_P005_Mapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class FacilityMap_P005_ServiceImple implements FacilityMap_P005_Service{

	private FacilityMap_P005_Mapper mapper;
}
