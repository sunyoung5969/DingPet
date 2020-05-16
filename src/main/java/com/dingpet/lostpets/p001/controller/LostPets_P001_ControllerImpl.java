package com.dingpet.lostpets.p001.controller;

import java.io.File;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.lostpets.p001.service.LostPets_P001_Service;
import com.dingpet.lostpets.p001.vo.Criteria;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;
import com.dingpet.lostpets.p001.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/lostpets/p001/*")
@AllArgsConstructor
@Controller
public class LostPets_P001_ControllerImpl implements LostPets_P001_Controller {

	@Autowired
	private LostPets_P001_Service service;
	
	/*목록 조회
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.list(cri));
		
		int total = service.getTotalAmount(cri);
		model.addAttribute("pagination", new PageDTO(cri, total));
	}*/
	
	//메인 페이지 최신 목록 조회
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("recentCompleted", service.recentCompleted());
		model.addAttribute("recentLost", service.recentLost());
		model.addAttribute("recentFind", service.recentFind());
	}
	
	
	//주인 찾기 전체 목록
	@GetMapping("/lostList")
	public void getLost(Criteria cri, Model model) {

		model.addAttribute("lostList", service.getLost(cri));
		
		int total = service.getLostAmount(cri);
		model.addAttribute("lost_pagination", new PageDTO(cri, total));
	}
	
	//반려견 찾기 전체 목록
	@GetMapping("/findList")
	public void getFind(Criteria cri, Model model) {
		model.addAttribute("findList", service.getFind(cri));
		
		int total = service.getFindAmount(cri);
		log.info("실종견 토털 " + total);
		model.addAttribute("find_pagination", new PageDTO(cri, total));
	}
	
	//완료 전체 목록
	@GetMapping("/completedList")
	public void getCompleted(Criteria cri, Model model) {

		model.addAttribute("completedList", service.getCompleted(cri));
		
		int total = service.getCompletedAmount(cri);
		model.addAttribute("completed_pagination", new PageDTO(cri, total));
	}

	// 글 등록 폼으로 이동
	@GetMapping("/write")
	public void write() {
		
	}
	
	// 글 등록
	@Override
	@PostMapping("/write")
	public String write(@RequestParam Map<String, Object> writeMap, 
			MultipartHttpServletRequest uploadFile, RedirectAttributes rttr) throws Exception {
		
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
				saveFile = new File(uploadFolder, fileName);
				filePath = saveFile.getPath();
				writeMap.put("front_name", savedFileName);
				writeMap.put("front_path", filePath);
					
				try {
					mFile.transferTo(saveFile);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("사진업로드 Exception " + e);
				}
				/*
				// Instantiates a client
			    try (ImageAnnotatorClient vision = ImageAnnotatorClient.create()) {
			
			      // The path to the image file to annotate
			      String file = "/resources/images/blue.jpg";
			      System.out.println(file);
			      // Reads the image file into memory
			      Path path = Paths.get(file);
			      System.out.println(path);
			      System.out.println(path.toAbsolutePath());
			      byte[] data = Files.readAllBytes(path);
			      ByteString imgBytes = ByteString.copyFrom(data);
			
			      // Builds the image annotation request
			      List<AnnotateImageRequest> requests = new ArrayList<>();
			      Image img = Image.newBuilder().setContent(imgBytes).build();
			      Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
			      AnnotateImageRequest request =
			          AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
			      requests.add(request);
			
			      // Performs label detection on the image file
			      BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
			      List<AnnotateImageResponse> responses = response.getResponsesList();
			
			      for (AnnotateImageResponse res : responses) {
				        if (res.hasError()) {
				          System.out.printf("Error: %s\n", res.getError().getMessage());
				          break;
				        }
				
				        for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
				          annotation
				              .getAllFields()
				              .forEach((k, v) -> System.out.printf("%s : %s\n", k, v.toString()));
				        }
			      }
			      
			      String theData = com.google.protobuf.util.JsonFormat.printer().print(response);
			      System.out.println(theData);
			      
			    } catch (IOException e) {
					e.printStackTrace();
					System.out.println("비전 에러");
				}*/
				//end of image upload
				
			}
		}
		
		service.write(writeMap);
		
		if(files != null) {
			service.upload(writeMap);
		}
		rttr.addFlashAttribute("result", writeMap.get("board_id"));
		
		return "redirect:/lostpets/p001/list";
	}
	
	// 글 조회
	@GetMapping({"/view", "/modify"})
	public void view(@RequestParam("board_id") String board_id, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("board", service.view(board_id));
	}
	
	// 글 조회
	@GetMapping("/completedView")
	public void completedView(@RequestParam("match_id") String match_id, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("completed", service.completedView(match_id));
	}

	// 글 수정
	@Override
	@PostMapping("/modify")
	public String modify( LostPets_P001_VO lostVO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if (service.modify(lostVO)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		log.info("modify");
		return "redirect:/lostpets/p001/list";
	}

	// 글 삭제
	@Override
	@PostMapping("/delete")
	public String delete(@RequestParam("board_id") String board_id, @RequestParam("dog_id") String dog_id, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if (service.delete(board_id, dog_id)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		log.info("delete");
		return "redirect:/lostpets/p001/list";
	}
	
	@GetMapping("/lost_found_map")
	public void readMap() {
		
	}
	
	
	

	
	

}
