package com.dingpet.petsitting.p002.vo;

import lombok.Data;

@Data
public class Canceled_AmountVO {
	private int total;		// 전체 취소 금액
	private int tax_free;	// 취소된 비과세 금액
	private int vat;		// 취소된 부가세 금액
	private int discount;	// 할인 금액
}
