package com.dingpet.petsitting.p001.vo;

import lombok.Data;

@Data
public class PetSitting_P001_VO {
	
	private String id;
	private String content;
	private String small;
	private String middle;
	private String big;
	private String postcode;
	private String roadAddress;
	private String jibunAddress;
	private String detailAddress;
	
	private String[] petService;
	private String[] closed;
}
