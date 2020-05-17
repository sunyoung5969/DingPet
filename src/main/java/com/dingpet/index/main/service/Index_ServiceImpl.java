package com.dingpet.index.main.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingpet.index.main.mapper.Index_Mapper;
import com.dingpet.index.main.vo.IndexPetsitterVO;
import com.dingpet.index.main.vo.IndexPriceVO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class Index_ServiceImpl implements Index_Service{

	private Index_Mapper mapper;
	
	@Override
	public List<IndexPetsitterVO> getHoF() {
		// TODO Auto-generated method stub
		return mapper.getHoF();
	}

	@Override
	public IndexPriceVO getPriceAVG() {
		// TODO Auto-generated method stub
		return mapper.getPriceAVG();
	}

}
