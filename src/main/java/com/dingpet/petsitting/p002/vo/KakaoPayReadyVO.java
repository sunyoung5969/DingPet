package com.dingpet.petsitting.p002.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
public class KakaoPayReadyVO {
	
	private String tid;						// 결제 고유 번호
	private String next_redirect_pc_url;	// PC웹일 경우  사용자 정보 입력 화면 리다이렉트 URL
	private Date created_at;				// 결제 준비 요청 시간
}
