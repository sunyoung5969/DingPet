package com.dingpet.lostpets.p001.mapper;

import java.util.List;

import com.dingpet.lostpets.p001.vo.LostPets_photos_VO;

public interface LostPets_Photos_Mapper {
	
	public List<LostPets_photos_VO> readPhoto(long board_id);
	
	public void insert(LostPets_photos_VO vo);
	
	public void delete(String uuid);
	
}
