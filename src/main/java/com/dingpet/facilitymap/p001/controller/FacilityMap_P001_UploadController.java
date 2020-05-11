package com.dingpet.facilitymap.p001.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.dingpet.facilitymap.p001.dto.FileAttachDTO;

public interface FacilityMap_P001_UploadController {
	
	// AJAX 업로드 Action
	public ResponseEntity<List<FileAttachDTO>> uploadFormPost(MultipartFile[] uploadFile);
	// Display
	public ResponseEntity<byte[]> getFile(String fname);
	// AJAX delete Action 
	public ResponseEntity<String> deleteFile(String fileName, String type); 
	
}
