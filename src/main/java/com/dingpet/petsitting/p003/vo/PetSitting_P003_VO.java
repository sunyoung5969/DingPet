package com.dingpet.petsitting.p003.vo;

import lombok.Data;

@Data
public class PetSitting_P003_VO {
	
	private String log_ID;					// 일지 번호
	private String reservation_ID;			// 예약 번호
	private String log_Date;				// 일지 일시
	private String log_Type;				// 일지 유형
	private String log_Title;				// 일지 제목
	private String log_Photo;				// 일지 사진
	private String log_Content;				// 일지 내용
	private String start_Time;				// 산책 시작 시간
	private String end_Time;				// 산책 종료 시간
	private String distance;				// 산책 총 거리
	private String path_Photo;				// 산책 경로 사진
		
	private String locationJSON;			// 산책 위치 위도 경도 JSON 문자열
	
	private LocationVO locationVO;			// 위도 경도 객체
}
