package com.dingpet.petsitting.p001.vo;

import lombok.Data;

@Data
public class PetSitting_P001_VO {
	
	private String id;				// 회원 아이디
	private String profilePicPath;	// 프로필 사진 경로
	private String content;			// 자기 소개
	private String licensePicPath;	// 자격증 사진 경로
	private String licenseName;		// 자격증 명
	private String licenseAgency;	// 자격증 발급기관
	private String small;			// 소형견 가격
	private String middle;			// 중형견 가격
	private String big;				// 대형견 가격
	private String postcode;		// 우편번호
	private String roadAddress;		// 도로명 주소
	private String jibunAddress;	// 지번 주소
	private String detailAddress;	// 상세 주소
	private String code;
	private String servicename;
	private String serviceyn;
	
	private String[] petService;	// 펫서비스
	private String[] closed;		// 휴무일
}
