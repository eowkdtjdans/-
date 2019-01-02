package com.spring.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.member.MemberVO;
import com.spring.biz.profile.ProfileService;
import com.spring.biz.profile.ProfileVO;
import com.spring.biz.profileImage.FileUploadService;
import com.spring.biz.profileImage.ProfileImageService;
import com.spring.biz.profileImage.ProfileImageVO;

@Controller
public class ProfileImageController {
	@Autowired
	private ProfileImageService profileImageService;
	@Autowired
	private FileUploadService fileUploadService;
	@Autowired
	private ProfileService profileService;
	public ProfileImageController () {
		System.out.println("ProfileImageController 컨트롤러");
	}
	@RequestMapping(value="profileImageList.do", method=RequestMethod.POST )
	public String profileImageListPost(ProfileImageVO vo, HttpSession session, @RequestParam("m_id") String m_id) {
		vo.setM_id(m_id);
		System.out.println("m_id = " + m_id);
		System.out.println("vo : " + vo);
		List<ProfileImageVO> profileImageList = profileImageService.getProfileImageList(m_id);
		System.out.println("list : " + profileImageList);
		session.setAttribute("profileImageList", profileImageList);
		return "/views/profile/ProfileImageList.jsp";
	}
	@RequestMapping(value="profileImageList.do", method=RequestMethod.GET )
	public String profileImageListGet(ProfileImageVO vo, HttpSession session, @RequestParam("m_id") String m_id) {
		vo.setM_id(m_id);
		System.out.println("m_id = " + m_id);
		System.out.println("vo : " + vo);
		List<ProfileImageVO> profileImageList = profileImageService.getProfileImageList(m_id);
		System.out.println("list : " + profileImageList);
		session.setAttribute("profileImageList", profileImageList);
		return "/views/profile/ProfileImageList.jsp";
	}
	
	@RequestMapping(value="deleteProfileImage.do", method=RequestMethod.POST) 
	public String deleteProfileImage(ProfileImageVO vo, HttpSession session, @RequestParam("m_id") String m_id, @RequestParam("p_route") String p_route) {
		vo.setM_id(m_id);
		vo.setP_route(p_route);
		profileImageService.deleteProfileImage(vo);
		
		System.out.println("컨트롤러 옴");
		return "profileImageList.do";
	}
	@RequestMapping(value="updateMainProfileImage.do", method=RequestMethod.POST)
	public String updateMainProfileImage(ProfileImageVO vo, HttpSession session, @RequestParam("m_id") String m_id, @RequestParam("p_route") String p_route) {
		/*profileImageService.updateMainProfileImage(vo);
		session.setAttribute("profile", vo);*/
		vo.setM_id(m_id);
		vo.setP_route(p_route);
		profileImageService.mainProfileImageInit(m_id);
		return "profileImageList.do";
	}
	
	@RequestMapping(value="profileImageInsert.do", method=RequestMethod.GET)
	public String ProfileImageInsert() {
		System.out.println("프로필이미지인서트");
		return "/views/profile/ProfileImageInsert.jsp";
	}
	
	@RequestMapping(value="uploadProfileImg.do", method=RequestMethod.POST)
	public String uploadProfileImg(MemberVO vo,HttpSession session, ProfileVO profilevo, @RequestParam("profileImg") MultipartFile profileImg, @RequestParam("m_id") String m_id) {
		
		String url = fileUploadService.fileUpload(profileImg);
		String path = session.getServletContext().getRealPath("/");
		System.out.println(path);
		
		int profileMainCnt = ProfileImageMainCount(m_id);
		String p_main = "0";
		
		Map<String, String> profileImageMap = new HashMap<String, String>();
		profileImageMap.put("m_id", m_id);
		profileImageMap.put("p_route", url);
		
		if(profileMainCnt > 0) {
			profileImageMap.put("p_main", p_main);
			profileImageService.ProfileImageInsert(profileImageMap);
			ProfileVO profileVO2 = profileService.getProfile2(profilevo, session);
			profilevo.setM_id(vo.getM_id());
			session.setAttribute("profile", profileVO2);
		} else {
			p_main = "1";
			profileImageMap.put("p_main", p_main);
			profileImageService.ProfileImageInsert(profileImageMap);
			ProfileVO profileVO2 = profileService.getProfile2(profilevo, session);
			profilevo.setM_id(vo.getM_id());
			session.setAttribute("profile", profileVO2);
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
