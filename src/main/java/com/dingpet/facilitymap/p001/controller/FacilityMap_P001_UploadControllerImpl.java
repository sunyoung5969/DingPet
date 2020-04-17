package com.dingpet.facilitymap.p001.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dingpet.facilitymap.p001.service.FacilityMap_P001_Service;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@RequestMapping("/facilitymap/p001/upload/*")
@AllArgsConstructor
@Log4j
@Controller
public class FacilityMap_P001_UploadControllerImpl implements FacilityMap_P001_UploadController{
	
	@Autowired
	private FacilityMap_P001_Service service;
	
//	private String uploadFolder = "C:\\upload";
	
	@RequestMapping("/display")	
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fname) {

		log.info("fileName: " + fname);

		File file = new File("c:\\upload\\" + fname);

		log.info("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value="/uploadAjaxAction", method = {RequestMethod.POST})
	public ResponseEntity<List<String>> uploadFormPost(MultipartFile[] uploadFile) {
		String uploadFolder = "C:\\upload";
		List<String> nameList = new ArrayList<>();

		for (MultipartFile multipartFile : uploadFile) {
			
			UUID uuid = UUID.randomUUID();

			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			
			String saveFileName = uuid.toString()+"_"+ multipartFile.getOriginalFilename();
			
			File saveFile = new File(uploadFolder,saveFileName );
		      
		      try {
		    	
		    	  nameList.add("s_"+ saveFileName);
		    	  
		        multipartFile.transferTo(saveFile);
		        		        
	            FileOutputStream thumbnail = 
	                      new FileOutputStream(new File(uploadFolder, "s_" + saveFileName));
	            
	            Thumbnailator.createThumbnail(
	            		multipartFile.getInputStream(), 
	            		thumbnail, 100, 100);
	            
	            thumbnail.close();

		        
		      } catch (Exception e) {
		        log.error(e.getMessage());
		      }//end catch
		}//end for
		
		return new ResponseEntity<>(nameList, HttpStatus.OK);
	}
	
}
