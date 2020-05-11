package com.dingpet.chat.p001.vo;

public class Message {
	private String roomName;
	private String writer;
	private String message;
	private String chatdate;
	private String memberList;
	private String messageType;

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