package com.dingpet.common.notice.vo;

import lombok.Data;

@Data
public class Notice_VO {
	private String notice_Type;			// 알림유형
	private String notice_ID;			// 알림번호
	private String member_ID;			// 수신자
	private String sender_ID;			// 발신자
	private String send_Date;			// 발신시각
	private String notice_Contents;		// 알림내용
	private String confirm_Read;		// 읽음확인
	private String url;					// 매핑주소
}
