package com.dingpet.customers.p002.mapper;

import org.apache.ibatis.annotations.Select;

public interface P002Mapper {

	@Select("select count(*) from tbl_board")
	public int getTotal();

}
