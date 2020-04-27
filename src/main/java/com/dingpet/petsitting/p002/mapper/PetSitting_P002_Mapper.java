package com.dingpet.petsitting.p002.mapper;

import java.util.List;

import com.dingpet.petsitting.p002.vo.PetSitting_P002_VO;

public interface PetSitting_P002_Mapper {
	
	public int getOrderIdSequence();

	public void reservationInsert(PetSitting_P002_VO reserved);
	
	// 고객이 예약한 예약리스트
	public List<PetSitting_P002_VO> reservedSitterList(PetSitting_P002_VO vo);
	
	// 시터가 예약받은 예약리스트
	public List<PetSitting_P002_VO> reservedCustList(PetSitting_P002_VO vo);

}
