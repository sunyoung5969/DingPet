package com.dingpet.facilitymap.p001.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.vo.Criteria;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_ReplyVO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

public interface FacilityMap_P001_ReplyMapper {
	
	// 리뷰 작성
	public int write(FacilityMap_P001_ReplyVO reply_vo);
	// 댓글 조회
	public FacilityMap_P001_ReplyVO view(String review_id);
	// 댓글 삭제
	public int delete(String review_id);
	// 댓글 수정
	public int modify(FacilityMap_P001_ReplyVO reply_vo);
	// 댓글 목록
	public List<FacilityMap_P001_ReplyVO> list(@Param("cri") Criteria cri, @Param("site_id") String site_id);
}
