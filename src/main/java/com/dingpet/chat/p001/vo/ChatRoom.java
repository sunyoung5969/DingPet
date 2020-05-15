package com.dingpet.chat.p001.vo;

import java.util.Date;

public class ChatRoom {

	private int roomNo;
	private String roomName;
	private String room_owner;
	private char del_flag;
	private String roomMember;
	private String roomType;
	private String roomPw;
	private Date reg_date;
	private String anick;
	private String bnick;

	public String getAnick() {
		return anick;
	}

	public void setAnick(String anick) {
		this.anick = anick;
	}

	public String getBnick() {
		return bnick;
	}

	public void setBnick(String bnick) {
		this.bnick = bnick;
	}

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



	public String getRoom_owner() {
		return room_owner;
	}

	public void setRoom_owner(String room_owner) {
		this.room_owner = room_owner;
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

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public String getRoomPw() {
		return roomPw;
	}

	public void setRoomPw(String roomPw) {
		this.roomPw = roomPw;
	}

	@Override
	public String toString() {
		return "ChatRoom [roomNo=" + roomNo + ", roomName=" + roomName + ", owner=" + room_owner + ", del_flag=" + del_flag
				+ ", roomMember=" + roomMember + ", roomType=" + roomType + ", roomPw=" + roomPw + ", reg_date="
				+ reg_date + "]";
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}