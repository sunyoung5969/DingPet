package com.dingpet.customers.p001.mapper;

import org.apache.ibatis.annotations.Select;

public interface Customers_P001_Mapper {
	
	@Select("select count(*) from tbl_board")
	public int getTotal();
	
}
