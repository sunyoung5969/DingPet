package com.dingpet.lostpets.p001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;

public interface LostPets_P001_Service {

	// 목록 조회
	public List<Map<String,String>> list();
	
	public void write(Map<String, Object> writeMap) throws Exception;

	// 등록
	//public void write(LostPets_P001_VO lostVO);

	// 조회
	public LostPets_P001_VO view(String board_id);

	// 삭제
	public boolean delete(String board_id, String dog_id);

	// 수정
	public boolean modify(LostPets_P001_VO lostVO);

}
