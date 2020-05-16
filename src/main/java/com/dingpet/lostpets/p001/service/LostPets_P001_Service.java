package com.dingpet.lostpets.p001.service;

import java.util.List;
import java.util.Map;

import com.dingpet.lostpets.p001.vo.Criteria;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;
import com.dingpet.lostpets.p003.vo.LostPets_P003_VO;

public interface LostPets_P001_Service {

	// 목록 조회
	public List<Map<String,String>> list(Criteria cri);
	//전체 글 개수 가져오기
	public int getTotalAmount(Criteria cri);
	
	
	//주인 찾기 최신 목록 조회
	public List<LostPets_P003_VO> recentCompleted();

	//주인 찾기 최신 목록 조회
	public List<LostPets_P001_VO> recentLost();
	
	//반려견 찾기 최신 목록 조회
	public List<LostPets_P001_VO> recentFind();
	
	
	//주인 찾기 전체 목록 조회
	public List<LostPets_P001_VO> getLost(Criteria cri);
	public int getLostAmount(Criteria cri);
	
	//반려견 찾기 전체 목록 조회
	public List<LostPets_P001_VO> getFind(Criteria cri);
	public int getFindAmount(Criteria cri);

	//완료 목록 조회
	public List<LostPets_P003_VO> getCompleted(Criteria cri);
	public int getCompletedAmount(Criteria cri);
	
	
	
	// 등록
	public void write(Map<String, Object> writeMap);
	public void upload(Map<String, Object> writeMap);
	
	
	
	// 조회
	public LostPets_P001_VO view(String board_id);

	// 완료 조회
	public LostPets_P003_VO completedView(String match_id);

	
	
	// 삭제
	public boolean delete(String board_id, String dog_id);

	
	
	// 수정
	public boolean modify(LostPets_P001_VO lostVO);


}
