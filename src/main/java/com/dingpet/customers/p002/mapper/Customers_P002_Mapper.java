package com.dingpet.customers.p002.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.ui.Model;

import com.dingpet.customers.p002.vo.Customers_P002_VO;

public interface Customers_P002_Mapper {

	public String lostId(String id);
	public String lostPwd(Customers_P002_VO vo);
}
