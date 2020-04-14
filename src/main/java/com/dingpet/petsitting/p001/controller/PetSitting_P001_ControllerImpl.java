package com.dingpet.petsitting.p001.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

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
	
	@RequestMapping("profilelist")
	@Override
	public void profilelist(Model model) {
		// TODO Auto-generated method stub
				
		model.addAttribute("list", service.profileGetList());

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
		
		//String id = String.valueOf((int)((Math.random()*8999)+1000));
		//profile.setMember_ID(id);
		
		try {

//--------------------------- 이용 가능 서비스	 --------------------------
	
			String[] petServiceYN = new String[8];

			for(int i=0; i < 8; i++) {
				if(request.getParameter(String.valueOf(i)) != null){
					petServiceYN[i] = (String)request.getParameter(String.valueOf(i));
				}else {
					petServiceYN[i] = "N";
				}
			}
			
			profile.setPetService(petServiceYN);
			
			//service.petServiceInsert(profile);
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
				UUID profile_UUID = UUID.randomUUID();
				UUID license_UUID = UUID.randomUUID();

				MultipartFile mFile = uploadFile.getFile(index);
				fileName = mFile.getOriginalFilename();

				if(!fileName.equals("")) {

					if(index.equals("profilePic")) {
						saveFile = new File(uploadFolder, profile_UUID.toString()+"profile_"+fileName);
						filePath = saveFile.getPath();
						profile.setProfile_PicPath(filePath);
					}else {
						saveFile = new File(uploadFolder, license_UUID.toString()+"license_"+fileName);
						filePath = saveFile.getPath();
						profile.setLicense_PicPath(filePath);
						service.licenseInsert(profile);
					}
						
					try {
						mFile.transferTo(saveFile);
					} catch (Exception e) {
						// TODO: handle exception
						System.out.println("사진업로드 Exception " + e);
					}
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

				profile.setSchedule_Closed((String)jsonArr.get(i));
				System.out.println("휴무일 뽑아봐 " + profile.getSchedule_Closed());
				service.closedInsert(profile);
			}
			
			service.profileInsert(profile);
			
			System.out.println("컨트롤러 끗끝끗");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		
		
		
//---------------------------------------------------------------------------
	
		return "/petsitting/p001/sitterlist";
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
	
	@RequestMapping("/profilelookup_f")
	@Override
	public void profilelookup_f() {
		// TODO Auto-generated method stub
		
	}
	//===샘플 시작 ===
	@RequestMapping("/profilelookup")
	@Override
	public void lookup(Model model, PetSitting_P001_VO profile) {
		// TODO Auto-generated method stub
		System.out.println(service.profileLookup(profile));		
		
		model.addAttribute("profile", service.profileLookup(profile));		
		model.addAttribute("closed", service.getClosedList(profile));
		model.addAttribute("license", service.getLicenseList(profile));
	}
	
	@RequestMapping("/profileregister_f")
	@Override
	public void profileregister_f() {
		// TODO Auto-generated method stub
		
	}
	
	@RequestMapping("/profilelist_f")
	@Override
	public void profilelist_f() {
		// TODO Auto-generated method stub
		
	}
	//===샘플 페이지 끝 ===
}
