package com.dingpet.petsitting.p001.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.dingpet.petsitting.p001.service.PetSitting_P001_Service;
import com.dingpet.petsitting.p001.vo.PetSitting_P001_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/petsitting/p001/*")
@AllArgsConstructor
@Controller
public class PetSitting_P001_ControllerImpl implements PetSitting_P001_Controller{
	
	private HttpServletRequest request;
	private PetSitting_P001_Service service;
	
	@RequestMapping("sitterlist")
	@Override
	public void petsitterlist(Model model) {
		// TODO Auto-generated method stub
		
	}

	@RequestMapping("profileregister")
	@Override
	public void register(Model model) {
		// TODO Auto-generated method stub
		
	}
	
	@RequestMapping(value="registerdata", method=RequestMethod.POST)
	@Override
	public String registerdata(Model model, PetSitting_P001_VO profile, MultipartFile uploadFile) {
		// TODO Auto-generated method stub
		/*
		String id = "";
		String content = "";
		String small = "";
		String middle = "";
		String big = "";
		String postcode = "";
		String roadAddress = "";
		String jibunAddress = "";;
		String detailAddress = "";
		*/
		String[] petService;
		String[] closed;
		
		try {
//--------------------------- 등록 데이터 처리 -----------------------------	
			/*
			 오케이
			id = (String)request.getParameter("id");
			content = (String)request.getParameter("content");
			small = (String)request.getParameter("small");
			middle = (String)request.getParameter("middle");
			big = (String)request.getParameter("big");
			postcode = (String)request.getParameter("postcode");
			roadAddress = (String)request.getParameter("roadAddress");
			jibunAddress = (String)request.getParameter("jibunAddress");;
			detailAddress = (String)request.getParameter("detailAddress");
			*/
			
//-------------------------------------------------------------
			
//--------------------------- 서비스 데이터 처리	 --------------------------
			
			petService = new String[8];

			for(int i=0; i < 8; i++) {
				if(request.getParameter(String.valueOf(i)) != null){
					petService[i] = (String)request.getParameter(String.valueOf(i));
				}else {
					petService[i] = "N";
				}
			}			
			
//--------------------------------------------------------------------

//---------------------------	사진 업로드	---------------------------
			
			String uploadFolder = "/home/testpic";
			String filename = uploadFile.getOriginalFilename();
			
			File saveFile = new File(uploadFolder, filename);
			
			try {
				uploadFile.transferTo(saveFile);
			} catch (Exception e) {
				// TODO: handle exception
			}

//---------------------------------------------------------------------------

//--------------------------- 휴무일 데이터 처리 -----------------------------
			
			//json까먹음
			String json = request.getParameter("closedSave");
			
			//json까먹음
			JSONParser jsonparser = new JSONParser();
			JSONObject jsonOb = (JSONObject)jsonparser.parse(json);
			
			//json까먹음
			JSONArray jsonArr = (JSONArray)jsonOb.get("closed");
			
			closed = new String[jsonArr.size()];
			
			for(int i=0; i<jsonArr.size(); i++) {
				closed[i] = (String)jsonArr.get(i);
				System.out.println("json까먹음 " + closed[i]);
				//json까먹음;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			log.info("wpqk?!");
			System.out.println(e);
		}
		
//---------------------------------------------------------------------------
	
		return "/petsitting/p001/sitterlist";
	}	
	
	@RequestMapping("/lookup")
	@Override
	public void lookup(Model model) {
		// TODO Auto-generated method stub
		
	}

	@RequestMapping("/update")
	@Override
	public void update(Model model) {
		// TODO Auto-generated method stub
		
	}

	@RequestMapping("/delete")
	@Override
	public void delete(Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void profilelookup_f() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void profileregister_f() {
		// TODO Auto-generated method stub
		
	}

	
}
