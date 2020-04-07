package com.dingpet.petsitting.p001.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public String registerdata(Model model, PetSitting_P001_VO profile, MultipartHttpServletRequest uploadFile) {
		// TODO Auto-generated method stub

		String[] petService;
		String[] closed;

		try {

//--------------------------- 이용 가능 서비스	 --------------------------
			/*
			인서트떄 넣어야 될것 - 서비스코드, 가능여부, 서비스 이름
			 */
			
			petService = new String[8];

			for(int i=0; i < 8; i++) {
				if(request.getParameter(String.valueOf(i)) != null){
					petService[i] = (String)request.getParameter(String.valueOf(i));
					profile.setId("11224");
					profile.setServiceyn(petService[i]);
					profile.setServicename("service"+i);
					profile.setCode(String.valueOf(i));
					//service.profile(profile);
				}else {
					petService[i] = "N";
					profile.setId("11224");
					profile.setServiceyn(petService[i]);
					profile.setServicename("service"+i);
					profile.setCode(String.valueOf(i));
					//service.profile(profile);
				}
			}			
			
//--------------------------------------------------------------------

//---------------------------	사진 업로드 데이터 처리	---------------------------
			
			String uploadFolder = "/home/testpic";
			//String uploadFolder = "C:\\test\\pic";
			
			String fileName = "";
			
			Iterator<String> files = uploadFile.getFileNames();
			
			while(files.hasNext()) {
				
				File saveFile;
				String filePath;
				String index = files.next();
				
				MultipartFile mFile = uploadFile.getFile(index);
				fileName = mFile.getOriginalFilename();
				

				if(index.equals("profilePic")) {
					saveFile = new File(uploadFolder, "profile_"+fileName);
					filePath = saveFile.getPath();
					profile.setProfilePicPath(filePath);
					System.out.println("vo파일경로 저장된거 잘 가져오니 = " + profile.getProfilePicPath());
				}else {
					saveFile = new File(uploadFolder, "license_"+fileName);
					filePath = saveFile.getPath();
					profile.setLicensePicPath(filePath);
					System.out.println("vo파일경로 저장된거 잘 가져오니 = " + profile.getLicensePicPath());
				}
				
				System.out.println("파일경로 = " + filePath);

				try {
					mFile.transferTo(saveFile);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}

//---------------------------------------------------------------------------

//--------------------------- 휴무일 데이터 처리 -----------------------------
			
			//json형태의 문자열 가져오기
			String json = request.getParameter("closedSave");
			
			//문자열을 json형태로 변환
			JSONParser jsonparser = new JSONParser();
			JSONObject jsonOb = (JSONObject)jsonparser.parse(json);
			
			//json에 있는 배열을 가져오기
			JSONArray jsonArr = (JSONArray)jsonOb.get("closed");
			
			closed = new String[jsonArr.size()];
			
			for(int i=0; i<jsonArr.size(); i++) {
				closed[i] = (String)jsonArr.get(i);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
//---------------------------------------------------------------------------
	
		return "/petsitting/p001/sitterlist";
	}	
	
	@RequestMapping("/profilelookup_f")
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
