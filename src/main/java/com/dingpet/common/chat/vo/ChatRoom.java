package com.dingpet.common.chat.vo;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ChatRoom {

	private int roomNo;
	private String roomName;
	private String owner;
	private char del_flag;
	private String roomMember;
	private Date reg_date;


	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public char getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(char del_flag) {
		this.del_flag = del_flag;
	}

	public String getRoomMember() {
		return roomMember;
	}

	public void setRoomMember(String roomMember) {
		this.roomMember = roomMember;
	}
	@Override
	public String toString() {
		return "ChatRoom [roomNo=" + roomNo + ", roomName=" + roomName + ", owner=" + owner + ", del_flag=" + del_flag
				+ ", roomMember=" + roomMember + ", reg_date=" + reg_date + "]";
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}