package com.dingpet.lostpets.p003.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;
import com.dingpet.lostpets.p003.service.LostPets_P003_Service;
import com.dingpet.lostpets.p003.vo.LostPets_P003_VO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/lostpets/request/*")
public class LostPets_P003_ControllerImpl implements LostPets_P003_Controller {
	
	private LostPets_P003_Service service;

	//요청 목록 가져오기
		@GetMapping("/list")
		public void request(@RequestParam("member_id") String member_id, Model model) {
			//받은 요청
			List<LostPets_P001_VO> myList = service.myList(member_id);		//내가 쓴 글 목록
			List<LostPets_P001_VO> requestFrom = service.requestFrom(member_id); 		//내 글에 대한 요청 목록

			//보낸 요청
			List<LostPets_P001_VO> myRequest = service.myRequest(member_id);		//내 요청 목록
			List<LostPets_P001_VO> requestTo = service.requestTo(member_id); 		//내 요청을 수신한 글 목록
			
			model.addAttribute("myList", myList);
			model.addAttribute("requestFrom", requestFrom);
			
			model.addAttribute("myRequest", myRequest);
			model.addAttribute("requestTo", requestTo);
		}
		
		@PostMapping("/complete")
		public String complete(LostPets_P003_VO vo, MultipartHttpServletRequest uploadFile, RedirectAttributes rttr) throws Exception {
			//image upload
			String uploadFolder = "/var/lib/tomcat8/webapps/lost";
			String fileName = "";
			String filePath = "";
			
			Iterator<String> files = uploadFile.getFileNames();

			while(files.hasNext()) {
				
				File saveFile;
				String index = files.next();
				UUID uuid = UUID.randomUUID();
				
				MultipartFile mFile = uploadFile.getFile(index);
				fileName = mFile.getOriginalFilename();
				String savedFileName = uuid.toString() + fileName;

				if(!fileName.equals("")) {
					saveFile = new File(uploadFolder,  uuid.toString() + fileName);
					filePath = saveFile.getPath();
					vo.setPhoto_name( uuid.toString() + fileName);
					vo.setPhoto_path(uploadFolder +"/"+ uuid.toString() + fileName);
						
					try {
						mFile.transferTo(saveFile);
					} catch (Exception e) {
						// TODO: handle exception
						System.out.println("사진업로드 Exception " + e);
					}
			
				}
			}
			
			service.write(vo);
			
			return "redirect:/lostpets/request/list?member_id=" + vo.getMember_id();
		}
}
