package com.dingpet.customers.p001.mapper;

import com.dingpet.customers.p001.vo.Customers_P001_VO;

public interface Customers_P001_Mapper {
	
	//일반회원 등록
	public void insert1(Customers_P001_VO customers);
	
	//펫시터회원 등록
	public void insert2(Customers_P001_VO customers);

	//로그인 
	public Customers_P001_VO loginCheck(Customers_P001_VO customers);
}
