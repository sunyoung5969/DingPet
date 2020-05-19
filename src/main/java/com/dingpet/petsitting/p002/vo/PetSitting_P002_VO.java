package com.dingpet.petsitting.p002.vo;

import lombok.Data;

@Data
public class PetSitting_P002_VO {
	
	private String order_ID;		// 주문번호
	private String payment_Date;	// 결제 일시
	private String item_Name;		// 상품명
	private String sitter_ID;		// 펫시터 아이디
	private String sitter_NickName;	// 펫시터 닉네임
	private String sitter_Photo;
	private String member_ID;		// 고객 아이디
	private String member_NickName;	// 고객 닉네임
	private String member_Photo;
	private String start_Date;		// 시작날짜
	private String start_Time;		// 시작시간
	private String end_Date;		// 종료날짜
	private String end_Time;		// 종료시간
	private String start_Date2;		// 시작날짜
	private String start_Time2;		// 시작시간
	private String end_Date2;		// 종료날짜
	private String end_Time2;		// 종료시간

	private int vat;				// 부과세
	private String total_amount;	// 총금액
	private String tid;				// 결제번호
	
}
