package com.dingpet.index.main.vo;

import java.util.List;

import lombok.Data;

@Data
public class ChatClient {
	private int site_id; 				// 넘버
	private String name; 		// 이름  
	private String id;					// 아이디
	private String phone;				// 전화번호
	private String site_type;		// 사진 이름
	private String site_date;			// 날짜
	private int sitesq;					// 시퀀스
	private int replyCnt;				// 리뷰 카운트 
	
}
