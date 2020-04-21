package com.dingpet.lostpets.p001.service;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dingpet.lostpets.p001.mapper.LostPets_P001_Mapper;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LostPets_P001_ServiceImpl implements LostPets_P001_Service{

	private LostPets_P001_Mapper mapper;

	//목록
	public List<Map<String,String>> list() {
		log.info("list**********");
		return mapper.list();
	}

	//등록
	public void write(Map<String, Object> writeMap) throws Exception{
		mapper.writeLost(writeMap);
		mapper.writeDog(writeMap);
		log.info("write");
	}
	
	//조회
	public LostPets_P001_VO view(String board_id) {
		log.info("view===========" + board_id);
		return mapper.view(board_id);
	}

	//삭제
	public boolean delete(String board_id, String dog_id) {
		log.info("delete==========" + board_id);
		
		boolean result = false;
		if(mapper.deleteDog(dog_id) == 1 && mapper.deleteLost(board_id) == 1) {
			result = true;
		}
		return result;
	}

	//수정
	public boolean modify(LostPets_P001_VO lostVO) {
		log.info("modify==========" + lostVO);
		return mapper.modify(lostVO) == 1;
	}
	
	//image to byte array
	public static byte[] imageToByteArray(String filePath) throws Exception{
		byte[] imageInByte = null;
		ByteArrayOutputStream baos = null;
		FileInputStream fis = null;
		
		try {
			baos = new ByteArrayOutputStream();
			fis = new FileInputStream(filePath);
			
			byte[] buffer = new byte[1024 * 8];
			int read = 0;
			
			while((read = fis.read(buffer, 0, buffer.length)) != -1) {
				baos.write(buffer, 0, read);
			}
			
			imageInByte = baos.toByteArray();
		
		}catch(Exception e) {
			e.printStackTrace();
		
		}finally {
			if(baos != null) {
				baos.close();
			}
			if(fis != null) {
				fis.close();
			}
		}
		
		return imageInByte;
	}

	
}
