package com.dingpet.chat.p001.vo;

public class C002MessageVO {
	/*
	 TABLE MESSAGE
	 	message_id  varchar2(20), 		// 메시지 id 
	    msgDatetime    VARCHAR2(30),	// 메시지 전송시간
	    msgText    VARCHAR2(500),		// 메시지 내용
	    memNum    VARCHAR2(20) NOT NULL,	// 채팅참여자 일련변호
	    chatroomId    VARCHAR2(20) NOT NULL	// 채팅방 ID
	 */
	String message_id;
	String msgDatetime;
	String msgText;
	String memNum;
	String chatroomId;
	public String getMessage_id() {
		return message_id;
	}
	public void setMessage_id(String message_id) {
		this.message_id = message_id;
	}
	public String getMsgDatetime() {
		return msgDatetime;
	}
	public void setMsgDatetime(String msgDatetime) {
		this.msgDatetime = msgDatetime;
	}
	public String getMsgText() {
		return msgText;
	}
	public void setMsgText(String msgText) {
		this.msgText = msgText;
	}
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	public String getChatroomId() {
		return chatroomId;
	}
	public void setChatroomId(String chatroomId) {
		this.chatroomId = chatroomId;
	}
}
