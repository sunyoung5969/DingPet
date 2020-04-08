package com.dingpet.facilitymap.p001.service;

import org.springframework.stereotype.Service;

import com.dingpet.facilitymap.p001.mapper.FacilityMap_P001_Mapper;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class FacilityMap_P001_ServiceImple implements FacilityMap_P001_Service {
	
	private FacilityMap_P001_Mapper mapper;
	
	@Override
	public void mediMap(FacilityMap_P001_VO mediMap) {
		// TODO Auto-generated method stub
		mapper.meditest(mediMap);
	}
	
}
