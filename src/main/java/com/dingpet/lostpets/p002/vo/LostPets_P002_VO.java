package com.dingpet.lostpets.p002.vo;

public class LostPets_P002_VO {
	private String category;
	private String board_id;
	private String title;
	private String content;
	private String x;
	private String y;
	
	private String dog_breed;
	private String dog_sex;
	private String found_date;
	
	private String mid;
	private String description;
	private String score;
	
	private String currentX;
	private String currentY;
	
	private String maxX;
	private String minX;
	private String maxY;
	private String minY;
	
	
	
	@Override
	public String toString() {
		return "LostPets_P002_VO [category=" + category + ", board_id=" + board_id + ", title=" + title + ", content="
				+ content + ", x=" + x + ", y=" + y + ", dog_breed=" + dog_breed + ", dog_sex=" + dog_sex
				+ ", found_date=" + found_date + ", mid=" + mid + ", description=" + description + ", score=" + score
				+ ", currentX=" + currentX + ", currentY=" + currentY + ", maxX=" + maxX + ", minX=" + minX + ", maxY="
				+ maxY + ", minY=" + minY + "]";
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	public String getMaxX() {
		return maxX;
	}
	public void setMaxX(String maxX) {
		this.maxX = maxX;
	}
	public String getMinX() {
		return minX;
	}
	public void setMinX(String minX) {
		this.minX = minX;
	}
	public String getMaxY() {
		return maxY;
	}
	public void setMaxY(String maxY) {
		this.maxY = maxY;
	}
	public String getMinY() {
		return minY;
	}
	public void setMinY(String minY) {
		this.minY = minY;
	}
	public String getCurrentX() {
		return currentX;
	}
	public void setCurrentX(String currentX) {
		this.currentX = currentX;
	}
	public String getCurrentY() {
		return currentY;
	}
	public void setCurrentY(String currentY) {
		this.currentY = currentY;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDog_breed() {
		return dog_breed;
	}
	public void setDog_breed(String dog_breed) {
		this.dog_breed = dog_breed;
	}
	public String getDog_sex() {
		return dog_sex;
	}
	public void setDog_sex(String dog_sex) {
		this.dog_sex = dog_sex;
	}
	public String getFound_date() {
		return found_date;
	}
	public void setFound_date(String found_date) {
		this.found_date = found_date;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	
	

}
