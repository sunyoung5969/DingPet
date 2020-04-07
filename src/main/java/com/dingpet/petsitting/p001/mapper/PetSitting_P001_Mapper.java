package com.dingpet.petsitting.p001.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.dingpet.petsitting.p001.vo.PetSitting_P001_VO;

public interface PetSitting_P001_Mapper {
	
	public void profileInsert(PetSitting_P001_VO profile);
	
	public void inserttest(PetSitting_P001_VO profile);
}
