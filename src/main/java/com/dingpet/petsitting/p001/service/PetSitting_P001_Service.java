package com.dingpet.petsitting.p001.service;

import java.util.List;

import com.dingpet.petsitting.p001.vo.PetSitting_P001_VO;

public interface PetSitting_P001_Service {
	
	// 프로필 목록 SELECT
	public List<PetSitting_P001_VO> profileGetList();
	
	// 프로필 기본데이터 INSERT
	public void profileInsert(PetSitting_P001_VO profile);
	
	// 자격증데이터 INSERT
	public void licenseInsert(PetSitting_P001_VO profile);
	
	// 이용 가능 서비스 INSERT
	public void petServiceInsert(PetSitting_P001_VO profile);
	
	// 휴무일 INSERT
	public void closedInsert(PetSitting_P001_VO profile);
		
	// 활동 사진 INSERT
	public void albumInsert(PetSitting_P001_VO profile);

	// 프로필 조회 SELECT
	public PetSitting_P001_VO profileLookup(PetSitting_P001_VO profile);
	

}
