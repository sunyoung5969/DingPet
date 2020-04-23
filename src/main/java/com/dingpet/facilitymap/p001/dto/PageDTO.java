package com.dingpet.facilitymap.p001.dto;

import lombok.Data;

@Data
public class PageDTO {
	
	private int page; //페이지번호
	private int amount; // 페이지당 최대갯수

	public PageDTO() {
		page = 1 ;
		amount = 5;
	}
}
