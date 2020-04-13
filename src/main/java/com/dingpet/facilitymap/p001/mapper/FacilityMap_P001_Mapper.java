package com.dingpet.facilitymap.p001.mapper;

import java.util.List;
import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

public interface FacilityMap_P001_Mapper {
	
	public List<FacilityMap_P001_VO> meditest(PlaceDTO dto);
	public FacilityMap_P001_VO readcenter(int PLACE_NUM);
}
