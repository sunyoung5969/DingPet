package com.dingpet.petsitting.p003.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dingpet.petsitting.p003.service.PetSitting_P003_Service;
import com.dingpet.petsitting.p003.vo.LocationVO;
import com.dingpet.petsitting.p003.vo.PetSitting_P003_VO;

import lombok.AllArgsConstructor;

@RequestMapping("/petsitting/p003/*")
@AllArgsConstructor
@Controller
public class PetSitting_P003_ControllerImpl implements PetSitting_P003_Controller{
	
	private HttpServletRequest request;
	private PetSitting_P003_Service service;
	
	// 일지 등록 폼	
	@RequestMapping("/logregister")
	@Override
	public void logregister(Model model) {
		// TODO Auto-generated method stub
		
		model.addAttribute("reservation_ID", request.getParameter("reservation_ID"));
	}
	
	// 산책 등록 폼	
	@RequestMapping("/walkregister")
	@Override
	public void walkregister(Model model) {
		// TODO Auto-generated method stub
		model.addAttribute("reservation_ID", request.getParameter("reservation_ID"));
	}
	
	// 산책 데이터 처리	
	@RequestMapping("/loglocationdata")
	@Override
	public void loglocationdata(Model model, PetSitting_P003_VO logVO) {
		// TODO Auto-generated method stub
		
	//---------------------------------- 일지 산책데이터 -----------------------------------
		
		LocationVO locatioinVO = new LocationVO();
		
		//json형태의 문자열 가져오기
		String json = logVO.getLocationJSON();
		String json2 = "";
		
		try {
			
			//문자열을 json형태로 변환
			JSONParser jsonparser = new JSONParser();
			JSONObject jsonOb = (JSONObject) jsonparser.parse(json);
			JSONObject jsonOb2 = new JSONObject();
			
			int count = Integer.parseInt(String.valueOf(jsonOb.get("count")));

			//json에 있는 객체를 가져오기
			for(int i=0; i< count; i++) {
				
				json2 = jsonOb.get("location_"+i).toString();
				// 객체안에 있는 개체 문자열 가져오기
				
				jsonOb2 = (JSONObject) jsonparser.parse(json2);
				// json데이터로 파싱
				
				locatioinVO.setLat(String.valueOf(jsonOb2.get("lat")));
				locatioinVO.setLit(String.valueOf(jsonOb2.get("lit")));
				logVO.setLocationVO(locatioinVO);
				service.locationData(logVO);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
	//----------------------------------------------------------------------------------
		
		model.addAttribute("location", logVO);
		
	}
	
	// 일지(산책) 등록 폼	
	@RequestMapping("/walklogregister")
	@Override
	public void walklogregister(Model model, PetSitting_P003_VO logVO) {
		// TODO Auto-generated method stub
	
		model.addAttribute("walk", logVO);	
		
	}	
	
	// 일지 데이터 처리	
	@RequestMapping("/logregisterdata")
	@Override
	public String logregisterdata(Model model, PetSitting_P003_VO logVO, MultipartHttpServletRequest uploadFile, HttpServletRequest request){
		// TODO Auto-generated method stub
		
	//------------------------------- 일지 시간 ---------------------------
		Date logDate = new Date();
		
		SimpleDateFormat formDate = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		SimpleDateFormat formTime = new SimpleDateFormat("HH:mm");
		
		logVO.setLog_Date(formDate.format(logDate));
	//-------------------------------------------------------------------
		
	//------------------------------ 일지 번호 생성 -------------------------
		
		String zero = "0";
		String logID = logVO.getReservation_ID();
		String count = "";
		
		count += (service.logCount(logVO)+1);
		
		if(count.length() < 3) {
			for(int i = 0; i < 3-count.length(); i++) {
				logID += zero;
			}
		}
		
		logID += (service.logCount(logVO)+1);
		
		logVO.setLog_ID(logID);
		
	//-------------------------------------------------------------------
		
	//------------------------------- 사진 업로드---------------------------
		
		String uploadFolder = "/var/lib/tomcat8/webapps/img";
		//String uploadFolder = "C:\\test\\pic";
		
		String fileName = "";
		
		Iterator<String> files = uploadFile.getFileNames();		// 
		
		while(files.hasNext()) { // 다음 파일이 있는지 여부
			File saveFile;
			String filePath;
			String index = files.next();
			UUID log_UUID = UUID.randomUUID();

			MultipartFile mFile = uploadFile.getFile(index);
			fileName = mFile.getOriginalFilename();
			
			if(!fileName.equals("")) {
	
				saveFile = new File(uploadFolder, log_UUID.toString()+"log_"+fileName);
				filePath = saveFile.getPath();
				logVO.setLog_Photo(log_UUID.toString()+"log_"+fileName);
				
				try {
					mFile.transferTo(saveFile);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("사진업로드 Exception " + e);
				}
			}else {
				System.out.println("사진이 없습니다");
			}
		}
	//----------------------------------------------------------------------------------
	//---------------------------------- 산책 경로 저장 -------------------------------------
		
		if(logVO.getLog_Type().equals("walk")) {
			LocationVO locatioinVO = new LocationVO();
			
			//json형태의 문자열 가져오기
			String json = logVO.getLocationJSON();
			String json2 = "";
			
			try {
				
				//문자열을 json형태로 변환
				JSONParser jsonparser = new JSONParser();
				JSONObject jsonOb = (JSONObject) jsonparser.parse(json);
				JSONObject jsonOb2 = new JSONObject();
				
				int pathCount = Integer.parseInt(String.valueOf(jsonOb.get("count")));

				//json에 있는 객체를 가져오기
				for(int i=0; i< pathCount; i++) {
					
					json2 = jsonOb.get("location_"+i).toString();
					// 객체안에 있는 개체 문자열 가져오기
					
					jsonOb2 = (JSONObject) jsonparser.parse(json2);
					// json데이터로 파싱
					
					locatioinVO.setLat(String.valueOf(jsonOb2.get("lat")));
					locatioinVO.setLit(String.valueOf(jsonOb2.get("lit")));
					logVO.setLocationVO(locatioinVO);
					service.locationData(logVO);
				}
				
			}catch (Exception e) {
				// TODO: handle exception
			}		
			
		}		
	//----------------------------------------------------------------------------------
		
	//--------------------------------------- DB 삽입 -----------------------------------
		System.out.println("logVO = ? " +logVO );
		service.logInsert(logVO);
	//----------------------------------------------------------------------------------
		
		model.addAttribute("receive_ID", service.getmemberID(logVO));
		model.addAttribute("logdata", logVO);
		request.setAttribute("regitser", "Y");
		request.setAttribute("logVO", logVO);
		
		return "forward:loglookup";
	}

	@RequestMapping("/walkpathtest")
	@Override
	public void walkpathtest(Model model, PetSitting_P003_VO logVO) {
		// TODO Auto-generated method stub
	//----------------------------산책 경로 데이터 처리----------------------------------------
		HttpSession session = request.getSession();
		
		List<LocationVO> list = service.getLocation(logVO);
		
		String strJSON = "{ ";
		int count = 0;
		
		for(int i=0; i<list.size(); i++) {

			strJSON += "\"location_"+i+"\" : "
					+ "{\"lat\":"+ list.get(i).getLat()+", \"lit\":"+list.get(i).getLit()+"}, ";
			
			count++;
		}
		
		strJSON += "\"count\" : "+count+"}"; 
				
		logVO.setLocationJSON(strJSON);
		
		model.addAttribute("vo", logVO);
	//----------------------------------------------------------------------------------------
	}

	@RequestMapping("/loglookup")
	@Override
	public void loglookup(Model model, PetSitting_P003_VO logVO, HttpServletRequest request) {
		// TODO Auto-generated method stub
		if(request.getAttribute("logVO") != null) {
			logVO = (PetSitting_P003_VO)request.getAttribute("logVO");
			request.removeAttribute("logVO");
		}
		
		if(request.getParameter("reservation_ID") != null) {
			logVO.setReservation_ID(request.getParameter("reservation_ID"));
		}
		
		model.addAttribute("reservation_ID", logVO.getReservation_ID());
		model.addAttribute("list", service.getLog(logVO));
		model.addAttribute("count", service.getwalk(logVO));
		System.out.println(logVO);
	}

}
