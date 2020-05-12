package com.dingpet.chat.p001.service;

import java.util.List;

import com.dingpet.chat.p001.vo.ChatRoom;
import com.dingpet.chat.p001.vo.Criteria;
import com.dingpet.chat.p001.vo.Message;


public interface ChatService {
	public List<Message> getMessage(int roomno) throws Exception;
	public void saveMessage(Message message) throws Exception; 
	List<ChatRoom> listChatRoom(Criteria cri, String newOwner) throws Exception;
	public int totalRoomNum() throws Exception;
	public int getChatRoomNo() throws Exception ;
	public void createRoom(ChatRoom room) throws Exception;
	public ChatRoom getRoom(int roomNo) throws Exception;
	public ChatRoom getRoomByOwner(ChatRoom room) throws Exception;
	public void addMember(int roomNo, String member) throws Exception;
	public int removeMember(int roomNo, String member) throws Exception;
	public String getMembers(int roomNo) throws Exception;
	
}
