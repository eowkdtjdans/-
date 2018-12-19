package com.spring.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.biz.profileImage.ProfileImageService;

@Controller
public class ProfileImageController {
	@Autowired
	private ProfileImageService profileImageService;
	
	public ProfileImageController () {
		System.out.println("ProfileImageController 컨트롤러");
	}
	
	@RequestMapping(value="profileImageInsert.do", method=RequestMethod.GET)
	public String ProfileImageInsert() {
		System.out.println("프로필이미지인서트");
		return "/views/profile/ProfileImageInsert.jsp";
	}
	
	@RequestMapping(value="profileImageInsert.do", method=RequestMethod.POST)
	public String ProfileImageInsert2() {
		System.out.println("프로필이미지인서트");
		return "/views/profile/ProfileImageInsert.jsp";
	}
	
	public void ProfileImageMainCount() {
		
	}
}
