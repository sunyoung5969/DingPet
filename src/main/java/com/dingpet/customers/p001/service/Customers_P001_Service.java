package com.dingpet.customers.p001.service;

import com.dingpet.customers.p001.vo.Customers_P001_VO;

public interface Customers_P001_Service {
	
	//일반회원 등록
	public void signup(Customers_P001_VO customers);
	
	//펫시터회원 등록
	public void change(Customers_P001_VO customers);

	
}
