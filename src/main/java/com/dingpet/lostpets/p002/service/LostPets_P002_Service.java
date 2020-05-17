package com.dingpet.lostpets.p002.service;

import java.util.List;

import com.dingpet.lostpets.p002.vo.LostPets_P002_VO;

public interface LostPets_P002_Service {

	public List<LostPets_P002_VO> getLost(LostPets_P002_VO vo);
	
	public List<LostPets_P002_VO> getFind(LostPets_P002_VO vo);
}
