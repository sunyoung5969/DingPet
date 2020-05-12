package com.dingpet.petsitting.p002.vo;

import lombok.Data;

@Data
public class KakaoPayCancelVO {
	
	private String tid;
	private String canceled_at;
	private Canceled_AmountVO total;
}
