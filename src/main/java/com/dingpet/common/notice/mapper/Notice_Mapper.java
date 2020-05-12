package com.dingpet.common.notice.mapper;

import java.util.List;

import com.dingpet.common.notice.vo.Notice_VO;
import com.dingpet.petsitting.p004.vo.PetSitting_P004_VO;

public interface Notice_Mapper {
	
	// 알림 번호 생성
	public int getNoticeIdSequence();
	
	// 알림 데이터 삽입
	public void setNotice(Notice_VO noticeVO);
	
	// 읽지않은 알림 수 카운트
	public int getNoticeCount(Notice_VO noticeVO);

	// 알림 데이터 가져오기
	public List<Notice_VO> getNotice(Notice_VO noticeVO);

	public void readNotice(Notice_VO noticeNO);

}
