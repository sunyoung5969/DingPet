package com.dingpet.petsitting.p001.vo;

import lombok.Data;

@Data
public class PetSitting_P001_VO {
	
	private String member_ID;				// 회원 아이디
	private String profile_PicPath;			// 프로필 사진 경로
	private String profile_Content;			// 자기 소개
	private String license_PicPath;			// 자격증 사진 경로
	private String license_Name;			// 자격증 명
	private String license_Agency;			// 자격증 발급기관
	private String license_Date;			// 자격증 발급날짜
	private String price_Small;				// 소형견 가격
	private String price_Medium;			// 중형견 가격
	private String price_Large;				// 대형견 가격
	private String profile_Postcode;		// 우편번호
	private String profile_RoadAddress;		// 도로명 주소
	private String profile_JibunAddress;	// 지번 주소
	private String profile_DetailAddress;	// 상세 주소
	private String schedule_Closed;			// 휴무일
	private String list_Address;			// 리스트 주소	
	private String service_00;
	private String service_01;
	private String service_02;
	private String service_03;
	private String service_04;
	private String service_05;
	private String service_06;
	private String service_07;
	
	private String[] petService;			// 펫서비스

}
