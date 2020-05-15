package com.dingpet.lostpets.p001.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dingpet.lostpets.p001.mapper.LostPets_P001_Mapper;
import com.dingpet.lostpets.p001.vo.Criteria;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;
import com.dingpet.lostpets.p003.vo.LostPets_P003_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LostPets_P001_ServiceImpl implements LostPets_P001_Service{

	private LostPets_P001_Mapper mapper;

	//목록 조회
	@Override
	public List<Map<String, String>> list(Criteria cri) {
		return mapper.listWithPaging(cri);
	}
	
	public int getTotalAmount(Criteria cri) {
		return mapper.getTotalAmount(cri);
	}
	
	//주인 찾기 최신 목록 조회
	public List<LostPets_P003_VO> recentCompleted(){
		return mapper.recentCompleted();
	}
	
	//주인 찾기 최신 목록 조회
	public List<LostPets_P001_VO> recentLost(){
		return mapper.recentLost();
	}

	//주인 찾기 최신 목록 조회
	public List<LostPets_P001_VO> recentFind(){
		return mapper.recentFind();
	}
	
	
	
	
	//주인 찾기 전체 목록 조회
	public List<LostPets_P001_VO> getLost(Criteria cri){
		return mapper.getLost(cri);
	}
	//페이지네이션
	public int getLostAmount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getLostAmount(cri);
	}


	
	//반려견 찾기 전체 목록 조회
	public List<LostPets_P001_VO> getFind(Criteria cri){
		return mapper.getFind(cri);
	}
	//페이지네이션
	public int getFindAmount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getFindAmount(cri);
	}
	
	
	//완료 목록 조회
	public List<LostPets_P003_VO> getCompleted(Criteria cri){
		return mapper.getCompleted(cri);
	}
	
	public int getCompletedAmount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getCompletedAmount(cri);
	}
	
	

	//등록
	public void write(Map<String, Object> writeMap){
		String dog_id = mapper.getDogId();
		writeMap.put("dog_id", dog_id);
		
		String board_id = mapper.getBoardId();
		writeMap.put("board_id", board_id);
		
		mapper.writeLost(writeMap);
		mapper.writeDog(writeMap);
		log.info("write");
	}
	
	// 등록 시 사진 업로드
	public void upload(Map<String, Object> writeMap){
		mapper.upload(writeMap);
		log.info("upload");
	}
	
	//조회
	public LostPets_P001_VO view(String board_id) {
		return mapper.view(board_id);
	}
	
	//완료 조회
	public LostPets_P003_VO completedView(String match_id) {
		// TODO Auto-generated method stub
		return mapper.completedView(match_id);
	}


	//삭제
	public boolean delete(String board_id, String dog_id) {
		log.info("delete==========" + board_id);
		
		boolean result = false;
		if(mapper.deleteDog(dog_id) == 1 && mapper.deleteLost(board_id) == 1 && mapper.deletePhoto(board_id) == 1) {
			result = true;
		}
		return result;
	}

	//수정
	public boolean modify(LostPets_P001_VO lostVO) {
		log.info("modify==========" + lostVO);
		return mapper.modifyLost(lostVO) == 1 && mapper.modifyDog(lostVO) == 1;
	}
	
	
}
