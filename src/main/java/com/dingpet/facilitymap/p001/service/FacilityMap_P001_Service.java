package com.dingpet.facilitymap.p001.service;

import java.util.List;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

public interface FacilityMap_P001_Service {
	// 병원 맵 마킹
	public List<FacilityMap_P001_VO> getMediMap(PlaceDTO dto);
	// 약국 맵 마킹
	public List<FacilityMap_P001_VO> getMediMap2(PlaceDTO dto);
	// 상세정보 (동물병원,약국)
	public FacilityMap_P001_VO getMediCenter(int num);
}
