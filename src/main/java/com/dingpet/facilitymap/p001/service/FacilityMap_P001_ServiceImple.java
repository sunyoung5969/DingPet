package com.dingpet.facilitymap.p001.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.mapper.FacilityMap_P001_Mapper;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class FacilityMap_P001_ServiceImple implements FacilityMap_P001_Service {
	
	private FacilityMap_P001_Mapper mapper;
	
	@Override
	public List<FacilityMap_P001_VO> getMediMap(PlaceDTO dto) {
		// 동물병원 맵 마킹
		return mapper.meditest(dto);
	}
	
	@Override
	public List<FacilityMap_P001_VO> getMediMap2(PlaceDTO dto) {
		// 약국 맵 마킹
		return mapper.medicenterSearch(dto);
	}
	
	@Override
	public FacilityMap_P001_VO getMediCenter(int num) {
		// TODO Auto-generated method stub
		return mapper.readcenter(num);
	}
}
