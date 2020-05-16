package com.dingpet.lostpets.p001.mapper;

import java.util.List;
import java.util.Map;

import com.dingpet.lostpets.p001.vo.Criteria;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;
import com.dingpet.lostpets.p003.vo.LostPets_P003_VO;

public interface LostPets_P001_Mapper {
	
	//페이징 처리한 목록
	public List<Map<String,String>> listWithPaging(Criteria cri);
	//유기견 글 전체 카운트
	public int getTotalAmount(Criteria cri);
	
	//최신 완료 글 9개
	public List<LostPets_P003_VO> recentCompleted();
	
	//최신 주인 찾기 글 9개
	public List<LostPets_P001_VO> recentLost();
	
	//최신 반려견 찾기 글 9개
	public List<LostPets_P001_VO> recentFind();
	
	
	//완료 글 목록
	public List<LostPets_P003_VO> getCompleted(Criteria cri);	
	public int getCompletedAmount(Criteria cri);
		
	//주인 찾기 글 목록
	public List<LostPets_P001_VO> getLost(Criteria cri);
	public int getLostAmount(Criteria cri);
	
	//반려견 찾기 글 목록
	public List<LostPets_P001_VO> getFind(Criteria cri);	
	public int getFindAmount(Criteria cri);

	
	
	
	//등록
	public String getDogId();
	public String getBoardId();
	
	public void writeLost(Map<String, Object> writeMap);
	public void writeDog(Map<String, Object> writeMap);
	public void upload(Map<String, Object> writeMap);
	
	
	
	//조회
	public LostPets_P001_VO view(String board_id);
	
	//완료 조회
	public LostPets_P003_VO completedView(String match_id);
	

	
	//수정
	public int modifyLost(LostPets_P001_VO lostVO);
	public int modifyDog(LostPets_P001_VO lostVO);
	
	
	
	//삭제
	public int deleteLost(String board_id);
	public int deletePhoto(String board_id);
	public int deleteDog(String dog_id);
	
	

	
}
