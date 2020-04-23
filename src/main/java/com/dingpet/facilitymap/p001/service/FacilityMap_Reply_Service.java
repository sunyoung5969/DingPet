package com.dingpet.facilitymap.p001.service;

import java.util.List;

import com.dingpet.facilitymap.p001.vo.Criteria;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_ReplyVO;

public interface FacilityMap_Reply_Service {
	
	// 댓글 작성
	public int write(FacilityMap_P001_ReplyVO reply_vo) ;
	// 댓글 조회
	public FacilityMap_P001_ReplyVO view(String review_id);
	// 댓글 삭제
	public int delete(String review_id) ;
	// 댓글 수정
	public int modify(FacilityMap_P001_ReplyVO reply_vo) ;
	// 댓글 목록
	public List<FacilityMap_P001_ReplyVO> list(Criteria cri, String site_id);

}
