package com.dingpet.facilitymap.p001.vo;

import java.util.List;

import lombok.Data;

@Data
public class FacilityMap_P001_VO {
	private int place_num; 				// 넘버
	private int site_id; 				// 넘버
	private String address_name; 		// 주소  
	private String category_group_code;	// 카테고리 그룹 코드
	private String category_group_name; // 카테고리 그룹 명
	private String category_name;		// 카테고리 이름
	private String distance;			// 거리
	private String id;					// 아이디
	private String phone;				// 전화번호
	private String place_name;			// 장소이름
	private String place_url;			// 시설상세페이지
	private String road_address_name;	// 도로명주소
	private String x;					// X 좌표
	private String y;					// Y 좌표
	private String detailAddress;		// 상세 주소
	private String place_text;			// 시설 간단 소개
	private String place_pic;			// 사진
	private String place_picname;		// 사진 이름
	private String site_type;		// 사진 이름
	private int sitesq;					// 시퀀스
	private List<FacilityMap_AttachVO> attachList; // 첨부파일 리스트
	
}
