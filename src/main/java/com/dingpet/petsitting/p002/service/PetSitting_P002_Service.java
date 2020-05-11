package com.dingpet.petsitting.p002.service;

import java.util.List;

import com.dingpet.petsitting.p002.vo.PetSitting_P002_VO;

public interface PetSitting_P002_Service {
	
	// 예약 번호 생성 시퀀스
	public int getOrderIdSequence();

	// 예약 정보 삽입 INSERT
	public void reservationInsert(PetSitting_P002_VO reserved);
	
	// 예약 정보 가져오기 SELECT
	public PetSitting_P002_VO getReservedInfo(PetSitting_P002_VO vo);
	
	// 고객이 예약한 예약리스트 SELECT
	public List<PetSitting_P002_VO> reservedSitterList(PetSitting_P002_VO vo);
	
	// 시터가 예약받은 예약리스트 SELECT
	public List<PetSitting_P002_VO> reservedCustList(PetSitting_P002_VO vo);
	
	// 예약 삭제 DELETE
	public void deleteReserved(PetSitting_P002_VO vo);

}
