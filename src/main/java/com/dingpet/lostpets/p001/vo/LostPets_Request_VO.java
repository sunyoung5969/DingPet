package com.dingpet.lostpets.p001.vo;

public class LostPets_Request_VO {
	private String category; 
	private String request_id; 
	private String receiver_id; 
	private String receiver_b_id; 
	private String sender_id; 
	private String sender_b_id; 
	private String request_date; 
	private String status; 
	private String completed_date;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRequest_id() {
		return request_id;
	}
	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}
	public String getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}
	public String getReceiver_b_id() {
		return receiver_b_id;
	}
	public void setReceiver_b_id(String receiver_b_id) {
		this.receiver_b_id = receiver_b_id;
	}
	public String getSender_id() {
		return sender_id;
	}
	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}
	public String getSender_b_id() {
		return sender_b_id;
	}
	public void setSender_b_id(String sender_b_id) {
		this.sender_b_id = sender_b_id;
	}
	public String getRequest_date() {
		return request_date;
	}
	public void setRequest_date(String request_date) {
		this.request_date = request_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCompleted_date() {
		return completed_date;
	}
	public void setCompleted_date(String completed_date) {
		this.completed_date = completed_date;
	} 
	
	
}
