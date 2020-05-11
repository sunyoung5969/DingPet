package com.dingpet.common.notice.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import com.dingpet.common.notice.vo.Notice_VO;

public interface Notice_Controller {
	
	public Map getNoticeCount(HttpServletRequest request, Notice_VO noticeNO);

	public Map getNotice(HttpServletRequest request, Model model, Notice_VO noticeVO);
	
	public Map setNotice(HttpServletRequest request, Model model, Notice_VO noticeVO);
	
	public String mappingURL(HttpServletRequest request, Notice_VO noticeNO);

}
