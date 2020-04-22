package com.dingpet.lostpets.p001.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dingpet.lostpets.p001.vo.Criteria;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;

public interface LostPets_P001_Mapper {
	
	//페이징 처리한 목록
	public List<Map<String,String>> listWithPaging(Criteria cri);
	
	//등록
	public String getDogId();
	public void writeLost(Map<String, Object> writeMap);
	public void writeDog(Map<String, Object> writeMap);
	
	//조회
	public LostPets_P001_VO view(String board_id);
	
	//수정
	public int modifyLost(LostPets_P001_VO lostVO);
	public int modifyDog(LostPets_P001_VO lostVO);
	
	//삭제
	public int deleteLost(String board_id);
	public int deleteDog(String dog_id);
	
	public int getTotalAmount(Criteria cri);
}
