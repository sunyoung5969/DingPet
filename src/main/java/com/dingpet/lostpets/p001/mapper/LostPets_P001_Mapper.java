package com.dingpet.lostpets.p001.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;

public interface LostPets_P001_Mapper {
	
	//목록 조회
	public List<Map<String,String>> list();
	
	//등록
	public void writeLost(Map<String, Object> writeMap);
	public void writeDog(Map<String, Object> writeMap);
	
	//조회
	public LostPets_P001_VO view(String board_id);
	
	//수정
	public int modify(LostPets_P001_VO lostVO);
	
	//삭제
	public int deleteLost(String board_id);
	public int deleteDog(String dog_id);
	
	
}
