package com.spring.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.profile.ProfileService;
import com.spring.biz.profile.ProfileVO;

@Controller
@SessionAttributes("profile")
public class ProfileController {
		
	@Autowired
	private ProfileService profileService;
	
	public ProfileController() {
		System.out.println("=======프로필 컨트롤러 시작");
	}
	
	//=============================================================
	//프로필 등록
	@RequestMapping(value="insertProfile.do", method=RequestMethod.GET)
		public String insertProfileGet(ProfileVO vo) {
			System.out.println("인서트 프로파일 ===========GET");
			return "views/profile/ProfileInsert.jsp";
	}
	
	@RequestMapping(value="insertProfile.do", method=RequestMethod.POST) 
		public String isnertProfileGet(ProfileVO vo, HttpSession session, @RequestParam("p_hobby") String p_hobby,
				@RequestParam("p_langauge") String p_langauge, @RequestParam("p_job") String p_job,
				@RequestParam("p_aboutme") String p_aboutme, @RequestParam("p_purpose") String p_purpose,
				@RequestParam("p_visitcountry") String p_visitcountry,  @RequestParam("m_id") String m_id) throws Exception {
		System.out.println("인서트 프로파일 ============ POST");
		vo.setM_id(m_id);
		vo.setP_aboutme(p_aboutme);
		vo.setP_hobby(p_hobby);
		vo.setP_job(p_job);
		vo.setP_purpose(p_purpose);
		vo.setP_visitcountry(p_visitcountry);
		vo.setP_language(p_langauge);
		
		
		profileService.InsertProfile(vo);
		
		session.setAttribute("profile", vo);
		
		
		return "redirect:/sub2.do";
	}
	
	
	
	
	//==============================================================
	//==프로필 수정
	@RequestMapping(value = "/modifyProfile.do", method=RequestMethod.GET)
	public String modifyProfileGet(ProfileVO vo, HttpSession session) {
		System.out.println("=======겟방식");
		session.getAttribute("profile");
		return "views/profile/ProfileModify.jsp";
		}	
	//
	@RequestMapping(value = "/modifyProfile.do",  method=RequestMethod.POST) 
	public String modifyProfilePost(ProfileVO vo, HttpSession session, @RequestParam("p_hobby") String p_hobby,
			@RequestParam("p_langauge") String p_langauge, @RequestParam("p_job") String p_job,
			@RequestParam("p_aboutme") String p_aboutme, @RequestParam("p_purpose") String p_purpose,
			@RequestParam("p_visitcountry") String p_visitcountry,  @RequestParam("m_id") String m_id) throws Exception {
		System.out.println("프로필 수정 시작");
		vo.setM_id(m_id);
		vo.setP_aboutme(p_aboutme);
		vo.setP_hobby(p_hobby);
		vo.setP_job(p_job);
		vo.setP_purpose(p_purpose);
		vo.setP_visitcountry(p_visitcountry);
		vo.setP_language(p_langauge);
		
		profileService.ModifyProfile(vo);
		//session.setAttribute("profile", vo);
		
		
		return "redirect:/sub2.do";
		
		
		
	}
		
		
		
}
