package com.dingpet.customers.p005.mapper;

import org.apache.ibatis.annotations.Select;

import com.dingpet.customers.p005.vo.CustomersP005VO;

public interface CustomersP005Mapper {
	
	//메시지함
	public CustomersP005VO inbox(String member_id);

	
}
