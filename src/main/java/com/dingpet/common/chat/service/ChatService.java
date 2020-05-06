package com.dingpet.common.chat.service;

import java.util.List;

import com.dingpet.common.chat.vo.ChatRoom;
import com.dingpet.common.chat.vo.Criteria;


public interface ChatService {

	List<ChatRoom> listChatRoom(Criteria cri) throws Exception;
	public int totalRoomNum() throws Exception;

	public void createRoom(ChatRoom room) throws Exception;
	public ChatRoom getRoom(int roomNo) throws Exception;
	public ChatRoom getRoomByOwner(String owner) throws Exception;
	public void addMember(int roomNo, String member) throws Exception;
	public int removeMember(int roomNo, String member) throws Exception;
	public String getMembers(int roomNo) throws Exception;
	
}
