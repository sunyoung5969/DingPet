package com.dingpet.petsitting.p002.service;

import com.dingpet.petsitting.p002.vo.PetSitting_P002_VO;

public interface PetSitting_P002_Service {
	
	public int getOrderIdSequence();

	public void reservationInsert(PetSitting_P002_VO reserved);
}
