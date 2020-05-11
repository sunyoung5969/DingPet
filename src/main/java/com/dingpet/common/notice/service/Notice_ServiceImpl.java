package com.dingpet.common.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingpet.common.notice.mapper.Notice_Mapper;
import com.dingpet.common.notice.vo.Notice_VO;
import com.dingpet.petsitting.p004.vo.PetSitting_P004_VO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class Notice_ServiceImpl implements Notice_Service{

	private Notice_Mapper mapper;
	
	@Override
	public void setNotice(Notice_VO noticeVO) {
		// TODO Auto-generated method stub
		mapper.setNotice(noticeVO);
	}

	@Override
	public int getNotieCount(Notice_VO noticeVO) {
		// TODO Auto-genserated method stub
		return mapper.getNoticeCount(noticeVO);
	}

	@Override
	public List<Notice_VO> getNotice(Notice_VO noticeVO) {
		// TODO Auto-generated method stub
		return mapper.getNotice(noticeVO);
	}

	@Override
	public int getNoticeIdSequence() {
		// TODO Auto-generated method stub
		return mapper.getNoticeIdSequence();
	}

	@Override
	public void readNotice(Notice_VO noticeNO) {
		// TODO Auto-generated method stub
		mapper.readNotice(noticeNO);
	}

}
