package com.dingpet.lostpets.p001.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dingpet.lostpets.p001.vo.Criteria;
import com.dingpet.lostpets.p001.vo.LostPets_Reply_VO;

public interface LostPets_Reply_Service {
	// 댓글 작성
	public int write(LostPets_Reply_VO reply_vo);

	// 댓글 조회
	public LostPets_Reply_VO view(String reply_id);

	// 댓글 삭제
	public int delete(String reply_id);

	// 댓글 수정
	public int modify(LostPets_Reply_VO reply_vo);

	// 댓글 목록
	public List<LostPets_Reply_VO> list(Criteria cri, String site_id);
}
