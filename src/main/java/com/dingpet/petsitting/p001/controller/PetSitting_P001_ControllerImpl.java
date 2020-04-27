package com.dingpet.petsitting.p001.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		System.out.println("제발 오니?");
		model.addAttribute("list", service.profileGetList());

	}

	@RequestMapping("profileregister")
	@Override
	public void register(Model model) {
		// TODO Auto-generated method stub
		
	}
	
	@RequestMapping("profileregister_f")
	@Override
	public void register_f(Model model) {
		// TODO Auto-generated method stub
		
	}
	
	@RequestMapping(value="registerdata", method=RequestMethod.POST)
	@Override
	public String registerdata(Model model, PetSitting_P001_VO profile, MultipartHttpServletRequest uploadFile, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		System.out.println(profile);

		String[] closed;
		
		try {

//---------------------------	사진 업로드 데이터 처리	---------------------------
			
			//String uploadFolder = "/var/lib/tomcat8/webapps/img";
			String uploadFolder = "C:\\test\\pic";
			
			String fileName = "";
			
			Iterator<String> files = uploadFile.getFileNames();		// 

			while(files.hasNext()) {
				
				File saveFile;
				String filePath;
				String index = files.next();
				UUID profile_UUID = UUID.randomUUID();
				UUID license_UUID = UUID.randomUUID();
				UUID gallery_UUID = UUID.randomUUID();

				MultipartFile mFile = uploadFile.getFile(index);
				fileName = mFile.getOriginalFilename();
				
				if(!fileName.equals("")) {

					if(index.equals("profilePic")) { // 단일 파일
						saveFile = new File(uploadFolder, profile_UUID.toString()+"profile_"+fileName);
						filePath = saveFile.getPath();
						profile.setProfile_PicPath(filePath);
						
						try {
							mFile.transferTo(saveFile);
						} catch (Exception e) {
							// TODO: handle exception
							System.out.println("사진업로드 Exception " + e);
						}
					}else if(index.equals("licensePic")){ // 단일 파일
						saveFile = new File(uploadFolder, license_UUID.toString()+"license_"+fileName);
						filePath = saveFile.getPath();
						profile.setLicense_PicPath(filePath);
						
						try {
							mFile.transferTo(saveFile);
						} catch (Exception e) {
							// TODO: handle exception
							System.out.println("사진업로드 Exception " + e);
						}
					}else if(index.equals("photo-gallery")){		// 다중 파일
						
						HttpSession session = request.getSession();
						
						MultipartFile[] filesArr = (MultipartFile[])session.getAttribute("files");
						// 파일 배열 생성 하고 저장
						
						List<MultipartFile> fileList = new ArrayList<MultipartFile>();
						// 파일들을 담을리스트생성
						
						for(int i = 0; i < filesArr.length; i++) {
							fileList.add(filesArr[i]);	// 리스트에 파일들 담기
						}
						int fileindex = 0;
						for(MultipartFile filePart : fileList) {
							
							fileName = filePart.getOriginalFilename();
							saveFile = new File(uploadFolder, gallery_UUID.toString()+"gallery_"+fileName);
							filePath = saveFile.getPath();
							
							try {
								mFile = filesArr[fileindex];
								mFile.transferTo(saveFile);
								fileindex++;
							} catch (Exception e) {
								// TODO: handle exception
								System.out.println("사진업로드 Exception " + e);
							}
						}
						
						//마지막에 세션 제거
						session.removeAttribute("files");
					}				
				}
			}
			System.out.println("-----------------------------------3");

//---------------------------------------------------------------------------

//--------------------------- 휴무일 데이터 처리 -----------------------------

			//json형태의 문자열 가져오기
			String json = profile.getSchedule_Closed();
			
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
				closed[i] = profile.getSchedule_Closed();
			}
			System.out.println("-----------------------------------4");

//---------------------------------------------------------------------------
			
			System.out.println(profile);
			
			if(profile.getLicense_Date() != null && profile.getLicense_Agency() != null && profile.getLicense_Name() != null) {
				service.licenseInsert(profile);
			}
			service.profileInsert(profile);
			
			System.out.println("컨트롤러 끗끝끗");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}

//---------------------------------------------------------------------------
	
		return "/petsitting/p001/profilelist";
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

	//===샘플 시작 ===
	@RequestMapping("/profilelookup")
	@Override
	public void lookup(Model model, PetSitting_P001_VO profile) {
		// TODO Auto-generated method stub		
		model.addAttribute("profile", service.profileLookup(profile));		
		model.addAttribute("closed", service.getClosedList(profile));
		model.addAttribute("license", service.getLicenseList(profile));
	}
	
	@RequestMapping(value="/filessaved", method=RequestMethod.POST)
	@Override
	public void filessaved(HttpServletRequest request, MultipartFile[] files) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		session.setAttribute("files", files);
		
		System.out.println("ajax 세션 "+ session.getAttribute("files"));
		
	}
	
	
}
