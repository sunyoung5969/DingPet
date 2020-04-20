package com.dingpet.facilitymap.p001.dto;

import lombok.Data;

@Data
public class FileAttachDTO {
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;	
}
