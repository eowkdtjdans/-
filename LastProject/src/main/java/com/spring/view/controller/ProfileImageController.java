package com.spring.view.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.profileImage.FileUploadService;
import com.spring.biz.profileImage.ProfileImageService;

@Controller
public class ProfileImageController {
	@Autowired
	private ProfileImageService profileImageService;
	@Autowired
	private FileUploadService fileUploadService;
	
	public ProfileImageController () {
		System.out.println("ProfileImageController 컨트롤러");
	}
	
	@RequestMapping(value="profileImageInsert.do", method=RequestMethod.GET)
	public String ProfileImageInsert() {
		System.out.println("프로필이미지인서트");
		return "/views/profile/ProfileImageInsert.jsp";
	}
	
	@RequestMapping(value="uploadProfileImg.do", method=RequestMethod.POST)
	public String uploadProfileImg(@RequestParam("profileImg") MultipartFile profileImg, @RequestParam("m_id") String m_id) {
		
		String url = fileUploadService.fileUpload(profileImg);
		
		int profileMainCnt = ProfileImageMainCount(m_id);
		String p_main = "0";
		
		Map<String, String> profileImageMap = new HashMap<String, String>();
		profileImageMap.put("m_id", m_id);
		profileImageMap.put("p_route", url);
		
		if(profileMainCnt > 0) {
			profileImageMap.put("p_main", p_main);
			profileImageService.ProfileImageInsert(profileImageMap);
		} else {
			p_main = "1";
			profileImageMap.put("p_main", p_main);
			profileImageService.ProfileImageInsert(profileImageMap);
		}
		
		return "redirect:/sub2.do";
	}
	
	
	private int ProfileImageMainCount(String m_id) {
		int result = 0;
		
		result = profileImageService.ProfileImageMainCount(m_id);
		
		return result;
	}
	
	/* ========================================================================================================== */
	
	@RequestMapping(value="uploadHostImg.do", method=RequestMethod.POST)
	public String uploadHostImg(@RequestParam("hostImg") MultipartFile hostImg, @RequestParam("m_id") String m_id) {
		
		String url = fileUploadService.fileUpload(hostImg);
		
		int hostMainCnt = hostMainCnt(m_id);
		String h_main = "0";
		
		Map<String, String> hostImageMap = new HashMap<String, String>();
		hostImageMap.put("h_route", url);
		hostImageMap.put("m_id", m_id);
		
		if(hostMainCnt > 0) {
			hostImageMap.put("h_main", h_main);
			profileImageService.HostImageInsert(hostImageMap);
		} else {
			h_main = "1";
			hostImageMap.put("h_main", h_main);
			profileImageService.HostImageInsert(hostImageMap);
		}
		
		return "redirect:/sub2.do";
	}
	
	private int hostMainCnt(String m_id) {
		int result = 0;
		
		result = profileImageService.HostImageMainCount(m_id);
		
		return result;
	}
}
