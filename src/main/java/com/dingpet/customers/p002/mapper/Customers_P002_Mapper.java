package com.dingpet.customers.p002.mapper;

import org.apache.ibatis.annotations.Select;

import com.dingpet.customers.p002.vo.Customers_P002_VO;

public interface Customers_P002_Mapper {

	public Customers_P002_VO lostId(Customers_P002_VO id);
	public Customers_P002_VO lostPwd(Customers_P002_VO pwd);
}
