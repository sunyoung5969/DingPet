package com.dingpet.facilitymap.p001.vo;

import lombok.Data;

@Data
public class FacilityMap_AttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private int site_id;
}
