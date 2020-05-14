package com.dingpet.facilitymap.p001.service;

import java.util.List;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_AttachVO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_ReplyVO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

public interface FacilityMap_P001_Service {
	// 병원 맵 마킹
	public List<FacilityMap_P001_VO> getMediMap(PlaceDTO dto);
	// 약국 맵 마킹
	public List<FacilityMap_P001_VO> getMediMap2(PlaceDTO dto);
	// 카페 맵 마킹
	public List<FacilityMap_P001_VO> getCafeMap(PlaceDTO dto);
	// 식당 맵 마킹
	public List<FacilityMap_P001_VO> getRestaurantMap(PlaceDTO dto) ;
	// 호텔 맵 마킹
	public List<FacilityMap_P001_VO> getHotelMap(PlaceDTO dto) ;
	// 상세정보 (동물병원,약국)
	public FacilityMap_P001_VO getMediCenter(int num);
	// 상세정보 (카페, 호텔 등(test))
	public FacilityMap_P001_VO getDogPlace(int num);
	// 시설등록(업로드)
	public void register(FacilityMap_P001_VO vo);
	// 시설 리뷰 등록 
	public void reviewregister(FacilityMap_P001_ReplyVO vo);
	// 시퀀스 get 
	public int getSeq();
	// 총 별점 평균 get
	public String getStarAvg(String site_id);
	// 첨부파일 리스트 get
	public List<FacilityMap_AttachVO> getAttachList(int site_id);
	// 첨부 삭제 
	public void removeAttach(int site_id);
	
}
