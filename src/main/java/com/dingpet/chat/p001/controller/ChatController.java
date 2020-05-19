package com.dingpet.chat.p001.controller;

import java.security.Provider.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dingpet.chat.p001.service.ChatService;
import com.dingpet.chat.p001.vo.ChatRoom;
import com.dingpet.chat.p001.vo.Criteria;
import com.dingpet.chat.p001.vo.PageMaker;
import com.dingpet.customers.p001.service.Customers_P001_Service;
import com.dingpet.customers.p001.vo.Customers_P001_VO;

import lombok.extern.log4j.Log4j;
//import sun.tools.serialver.resources.serialver;

@Log4j
@RequestMapping("/chat/*")
@Controller
public class ChatController {
	
	
	@Autowired
	ChatService chatService;
	@Autowired
	Customers_P001_Service userService;

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	@RequestMapping(value = "createRoom", method = RequestMethod.GET)
	public String createRoomGET(Criteria cri, Model model) {
		model.addAttribute("cri", cri);
		return "chat/createRoom";
	}
	// 친구목록 가져오기
	@RequestMapping(value = "/getFriendList", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public List getFriendList(@RequestBody String info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		log.info("get/post /getFriendList");
		List<Map<String, Object>> resultMap = null;
		List<Map<String, Object>> tmp = null;
		List<String> classList = null;
		
		log.info(resultMap);
		return resultMap;
	}
	@RequestMapping(value = "createRoom", method = RequestMethod.POST) // 방 만들 때
	public String createRoomPost(ChatRoom room, Criteria cri, HttpServletRequest request, Model model ) throws Exception {
		logger.info("-------------------------------->>>>>>>>>>>>>>>>>>>>>>>" + room);
		room.setRoomType(room.getRoomPw() == "" || room.getRoomPw() == null? "Normal" : "Secret");
		room.setRoomNo(chatService.getChatRoomNo());
		request.setAttribute("room", room);
		model.addAttribute("owner", room.getRoom_owner());
		chatService.createRoom(room); // db에 방 넣어줌
		// 알아서 페이지값이 들어옴
		
		return	"redirect:/chat/chatList";
			
	}
	
	@RequestMapping(value="/chatList", method = RequestMethod.GET)
	public String tempPage(Criteria cri, Model model, HttpSession session) throws Exception {
		Customers_P001_VO sessionId = (Customers_P001_VO) session.getAttribute("customers");
		String newOwner = sessionId.getMember_id();
		System.out.println("세션id는 :"+ newOwner);		
		PageMaker pagemaker = new PageMaker();
		int total = chatService.totalRoomNum();
		
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(total);
		
		if(cri.getPerPageNum() != 10 || cri.getPage() > pagemaker.getTempEndPage()) {// 
			
			cri.setPage(1);
			cri.setPerPageNum(10);
			
			pagemaker.setCri(cri);
			pagemaker.setTotalCount(total);
		}
		
		model.addAttribute("roomList", chatService.listChatRoom(cri, newOwner));
		model.addAttribute("pageMaker", pagemaker);
		
		return "chat/chatList";
	}
//	RoomL


	@RequestMapping(value = "enterRoom", method = {RequestMethod.GET}) // 방 들어갈 때, createRoom후에 url 바꾸기 위해 만듦
	public String chat(HttpServletRequest request, HttpSession session, Model model, Criteria cri) throws Exception {
		// 방에 멤버 추가해줌
		Customers_P001_VO sessionId = (Customers_P001_VO) session.getAttribute("customers");
		System.out.println("세션id는 : "+sessionId.getMember_id());
		
		ChatRoom room = (ChatRoom) request.getAttribute("room");
		ChatRoom room2 = chatService.getRoomByOwner(room);
		System.out.println("room1: "+room);
		System.out.println("room2: "+room2);
		model.addAttribute("room", room2);
		model.addAttribute("cri", cri);
		
		return "chat/room";
	}
//	
	@ResponseBody
	@RequestMapping(value = "enterRoom", method = {RequestMethod.POST}) // 방 들어갈 때, list에서 pick해서 들어갈 때
	public Map chat(int roomNo, HttpSession session, HttpServletRequest request, ChatRoom room, Model model
												, Criteria cri) throws Exception {
		//세션 id 가져오기 
		Customers_P001_VO sessionId = (Customers_P001_VO) session.getAttribute("customers");
		System.out.println("세션 아이디 "+sessionId);
		// 방에 멤버 추가해줌
		
		System.out.println(roomNo +"```"+ room + "---- -------");
		System.out.println("id는 " + sessionId.getMember_id());
		chatService.addMember(roomNo, sessionId.getMember_id());
		model.addAttribute("cri", cri);
		model.addAttribute("room", chatService.getRoom(roomNo));
		model.addAttribute("msgList",chatService.getMessage(roomNo));

		Map map = new HashMap();
		map.put("room2", chatService.getRoom(roomNo));
		map.put("chatList", chatService.getMessage(roomNo));		
		//return "chat/room";
		return map;
	}
	
}
