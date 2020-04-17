package com.dingpet.facilitymap.p001.mapper;

import java.util.List;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

public interface FacilityMap_P001_Mapper {
	
	//동물병원 맵마킹
	public List<FacilityMap_P001_VO> meditest(PlaceDTO dto);
	//동물약국 맵마킹
	public List<FacilityMap_P001_VO> medicenterSearch(PlaceDTO dto);
	//상세정보 페이지 (동물병원,약국)
	public FacilityMap_P001_VO readcenter(int PLACE_NUM);
	
	//시설정보 등록 
	public List<FacilityMap_P001_VO> registerPlace(FacilityMap_P001_VO vo);
}
