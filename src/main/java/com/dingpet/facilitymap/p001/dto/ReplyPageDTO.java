package com.dingpet.facilitymap.p001.dto;

import java.util.List;

import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_ReplyVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {

  private int replyCnt;
  private List<FacilityMap_P001_ReplyVO> list;
}
