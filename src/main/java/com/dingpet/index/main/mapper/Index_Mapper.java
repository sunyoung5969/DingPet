package com.dingpet.index.main.mapper;

import java.util.List;

import com.dingpet.index.main.vo.IndexPetsitterVO;
import com.dingpet.index.main.vo.IndexPriceVO;

public interface Index_Mapper {

	// 펫시터 명예의 전당
	public List<IndexPetsitterVO> getHoF();
	
	// 시터 평균 가격
	public IndexPriceVO getPriceAVG();
}
