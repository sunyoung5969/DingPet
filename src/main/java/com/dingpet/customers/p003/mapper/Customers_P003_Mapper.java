package com.dingpet.customers.p003.mapper;

import org.apache.ibatis.annotations.Select;

import com.dingpet.customers.p003.vo.Customers_P003_VO;

public interface Customers_P003_Mapper {
	
	//일반회원 정보 수정
	public int update1(Customers_P003_VO customers);
	
	//펫시터 회원 정보 수정
	public int update2(Customers_P003_VO customers);
}
