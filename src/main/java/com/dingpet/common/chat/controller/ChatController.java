package com.dingpet.common.chat.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.dingpet.common.chat.service.ChatService;
import com.dingpet.common.chat.vo.ChatRoom;
import com.dingpet.common.chat.vo.Criteria;
import com.dingpet.common.chat.vo.PageMaker;
import com.dingpet.customers.p001.service.Customers_P001_Service;

import lombok.extern.log4j.Log4j;

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
	public String createRoomPost(ChatRoom room, Criteria cri, Principal princ) throws Exception {
		logger.info("-------------------------------->>>>>>>>>>>>>>>>>>>>>>>" + room);

		room.setOwner(princ.getName());
		room.setRoomMember(princ.getName());
		
		chatService.createRoom(room); // db에 방 넣어줌
		// 알아서 페이지값이 들어옴
		return	"redirect:/chat/enterRoom";
			
	}
	
	@RequestMapping(value="chatList", method = RequestMethod.GET)
	public String tempPage(Criteria cri, Model model) throws Exception {
		
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
		
		model.addAttribute("roomList", chatService.listChatRoom(cri));
		model.addAttribute("pageMaker", pagemaker);
		
		return "chat/chatList";
	}
//	RoomL


	@RequestMapping(value = "enterRoom", method =RequestMethod.GET) // 방 들어갈 때, createRoom후에 url 바꾸기 위해 만듦
	public String chat(Principal princ, Model model, Criteria cri) throws Exception {
		// 방에 멤버 추가해줌
		
		ChatRoom room2 = chatService.getRoomByOwner(princ.getName());
		
		model.addAttribute("room", room2);
		model.addAttribute("cri", cri);
		//model.addAttribute("member", userService.getUser(princ.getName()).getUserName());
		return "chat/room";
	}
//	
	@RequestMapping(value = "enterRoom", method =RequestMethod.POST) // 방 들어갈 때, list에서 pick해서 들어갈 때
	public String chat(int roomNo, Principal princ,ChatRoom room, Model model
												, Criteria cri) throws Exception {
		// 방에 멤버 추가해줌
		System.out.println(roomNo +""+ room + "---- -------");
		
		chatService.addMember(roomNo, princ.getName());
		model.addAttribute("cri", cri);
		model.addAttribute("room", chatService.getRoom(roomNo));
		//model.addAttribute("member", userService.getUser(princ.getName()).getUserName());

		return "chat/room";
	}
	
}
