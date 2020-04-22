package com.dingpet.lostpets.p001.vo;

import java.util.List;

public class LostPets_photos_VO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private long board_id;
	private String category;
	
	private List<LostPets_photos_VO> photoList;
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public boolean isFileType() {
		return fileType;
	}
	public void setFileType(boolean fileType) {
		this.fileType = fileType;
	}
	public long getBoard_id() {
		return board_id;
	}
	public void setBoard_id(long board_id) {
		this.board_id = board_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public List<LostPets_photos_VO> getPhotoList() {
		return photoList;
	}
	public void setPhotoList(List<LostPets_photos_VO> photoList) {
		this.photoList = photoList;
	}
}
