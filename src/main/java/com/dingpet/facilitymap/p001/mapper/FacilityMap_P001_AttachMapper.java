package com.dingpet.facilitymap.p001.mapper;

import java.util.List;

import com.dingpet.facilitymap.p001.vo.FacilityMap_AttachVO;


public interface FacilityMap_P001_AttachMapper {
	
	public void insert(FacilityMap_AttachVO vo);

	public void delete(String uuid);

	public List<FacilityMap_AttachVO> findBySiteno(int site_id);

	public void deleteAll(int site_id);

	
}
