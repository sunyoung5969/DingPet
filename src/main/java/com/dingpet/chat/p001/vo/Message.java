package com.dingpet.chat.p001.vo;

public class Message {
	private String roomName; // 방이름
	private String writer; // 작성자
	private String message; // 내용
	private String chatdate; // 보낸날짜
	private String memberList; // 멤버
	private String messageType; // 타입
	private String sender; // 보낸이
	private String target; // 받는이
	private String roomno; // 방번호
	private String member; // 멤버
	private String send_date; // 보낸날짜
	
	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getRoomno() {
		return roomno;
	}

	public void setRoomno(String roomno) {
		this.roomno = roomno;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}


	
	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public String getChatdate() {
		return chatdate;
	}

	public void setChatdate(String chatdate) {
		this.chatdate = chatdate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getMemberList() {
		return memberList;
	}

	public void setMemberList(String memberList) {
		this.memberList = memberList;
	}

	@Override
	public String toString() {
		return "Message [roomName=" + roomName + ", writer=" + writer + ", message=" + message + ", chatdate="
				+ chatdate + ", memberList=" + memberList + "]";
	}

}