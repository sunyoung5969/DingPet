package com.dingpet.facilitymap.p001.service;

import java.util.List;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

public interface FacilityMap_P001_Service {
	
	public List<FacilityMap_P001_VO> getMediMap(PlaceDTO dto);
	public FacilityMap_P001_VO getMediCenter(int num);
}
