package com.dingpet.facilitymap.p001.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dingpet.facilitymap.p001.dto.FileAttachDTO;
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

	// 다중 파일첨부 AJAX 뷰  
	@RequestMapping(value="/display", method = {RequestMethod.GET})
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {

		log.info("fileName: " + fileName);

		File file = new File(fileName);

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
	
	
	// 이미지 타입 체크
	private boolean checkImageType(File file) {

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	// 폴더 경로 get
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	// AJAX 다중 업로드 Action
	@RequestMapping(value="/uploadAjaxAction", method = {RequestMethod.POST})
	public ResponseEntity<List<FileAttachDTO>> uploadFormPost(MultipartFile[] uploadFile) {
		//String uploadFolder = "C:\\upload";
		String uploadFolder = "/var/lib/tomcat8/webapps/siteimg";
		String uploadFolderPath = getFolder();
		List<FileAttachDTO> nameList = new ArrayList<>();

		for (MultipartFile multipartFile : uploadFile) {
			
			FileAttachDTO attachDTO = new FileAttachDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();

			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("-------------------------------------");
			log.info("upload file name -----" + uploadFileName);
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			String saveFileName = uuid.toString()+"_"+ multipartFile.getOriginalFilename();
			attachDTO.setFileName(uploadFileName);
			
			try {
				File saveFile = new File(uploadFolder, saveFileName);
				multipartFile.transferTo(saveFile);

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolder);

				// check image type file
				if (checkImageType(saveFile)) {

					attachDTO.setImage(true);

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, "s_" + saveFileName));

					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					thumbnail.close();
				}

				// add to List
				nameList.add(attachDTO);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}//end for
		
		return new ResponseEntity<>(nameList, HttpStatus.OK);
	}
	
	// AJAX 업로드 Delete
	@RequestMapping(value="/deleteFile", method = {RequestMethod.POST})
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {

		log.info("deleteFile: " + fileName);

		File file;

		try {
			//file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file = new File("/var/lib/tomcat8/webapps/siteimg" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();

			if (type.equals("image")) {

				String largeFileName = file.getAbsolutePath().replace("s_", "");

				log.info("largeFileName: " + largeFileName);

				file = new File(largeFileName);

				file.delete();
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}
	
}
