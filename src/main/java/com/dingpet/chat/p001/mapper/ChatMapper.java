package com.dingpet.chat.p001.mapper;

import java.util.List;
import java.util.Map;

import com.dingpet.chat.p001.vo.ChatRoom;
import com.dingpet.chat.p001.vo.Criteria;

public interface ChatMapper {

	public List<ChatRoom> listChatRoom(Criteria cri) throws Exception;
	public int getTotalRoomNum() throws Exception;
	public void createRoom(ChatRoom room) throws Exception;
	public int getChatRoomNo() throws Exception;
	public void removeRoom(int roomNo) throws Exception;
	public ChatRoom getRoom(int roomNo) throws Exception;
	public ChatRoom getRoomByOwner(ChatRoom room) throws Exception;
	public String getMembers(int roomNo) throws Exception;
	public void addMember(Map<String, String> params) throws Exception;
	public String getOwner(int roomNo) throws Exception;
	public void updateOwner(Map<String, String> params2)throws Exception;
	public String getRoomType(int roomNo) throws Exception;
	public void changeRoomType(Map<String, String> params) throws Exception;
}
