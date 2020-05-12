package com.dingpet.lostpets.p001.service;

import java.util.List;
import java.util.Map;

import com.dingpet.lostpets.p001.vo.Criteria;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;

public interface LostPets_P001_Service {

	// 목록 조회
	public List<Map<String,String>> list(Criteria cri);
	//전체 글 개수 가져오기
	public int getTotalAmount(Criteria cri);
	
	// 등록
	public void write(Map<String, Object> writeMap);
	public void upload(Map<String, Object> writeMap);
	
	// 조회
	public LostPets_P001_VO view(String board_id);

	// 삭제
	public boolean delete(String board_id, String dog_id);

	// 수정
	public boolean modify(LostPets_P001_VO lostVO);
	
	//요청 목록
	public List<LostPets_P001_VO> myList(String member_id);
	public List<LostPets_P001_VO> requestList(String member_id);

}
