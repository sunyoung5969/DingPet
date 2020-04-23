package com.dingpet.facilitymap.p001.vo;

import java.util.List;

import lombok.Data;

@Data
public class FacilityMap_P001_ReplyVO {
	private int place_num; 				// 
	private int site_id; 				// 시설 ID
	private String review_id;			// 리뷰 ID
	private String member_id;			// 유저 ID
	private String review_content;		// 리뷰 내용
	private String review_report;		// 신고수
	private String review_name;			// 리뷰 작성자 이름
	private String review_email;		// 리뷰 작성 이메일
	private int review_star;			// 리뷰 별점
	private String review_pic;			// 사진 PATH
	private String review_picname;		// 사진 파일 이름
	private int sitesq;					// 시퀀스
	private List<FacilityMap_AttachVO> attachList; // 첨부파일 리스트
	
}
