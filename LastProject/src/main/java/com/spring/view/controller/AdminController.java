package com.spring.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.admin.AdminCntVO;
import com.spring.biz.admin.AdminService;
import com.spring.biz.admin.UserAdminCommentVO;
import com.spring.biz.admin.UserAdminPostVO;
import com.spring.biz.admin.UserAdminViewVO;
import com.spring.biz.event.EventVO;
import com.spring.biz.member.MemberVO;
import com.spring.biz.profileImage.ProfileImageVO;

@Controller
@SessionAttributes({"userAdminList", "userAdminViewVO", "userAdminPostList", "userAdminCommentList", "userAdminImageSelect", "adminCnt"})
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	public AdminController() {
		System.out.println("AdminController로 옴");
	}
	
	@RequestMapping(value="/Admin.do")
	public String AdminMain(HttpServletRequest request, Model model) {
		System.out.println("AdminController의 사이트 조회수 누적 메소드");
		
		AdminCntVO adminCnt = adminService.adminCnt();
		
		model.addAttribute("adminCnt", adminCnt);
		
		return "redirect:/views/admin/testAdmin.jsp";
	}
	
	@RequestMapping(value="/logVisit.do", method=RequestMethod.GET)
	public String LogVisit(HttpServletRequest request) {
		System.out.println("AdminController의 사이트 조회수 누적 메소드");
		
		String lv_ip = request.getParameter("lv_ip");
		String lv_country = request.getParameter("lv_country");
		String lv_browser = request.getParameter("lv_browser");
		
		Map<String, String> lvMap = new HashMap<String, String>();
		lvMap.put("lv_ip", lv_ip);
		lvMap.put("lv_country", lv_country);
		lvMap.put("lv_browser", lv_browser);
		
		System.out.println("ip: " + lv_ip);
		System.out.println("country: " + lv_country);
		System.out.println("browser: " + lv_browser);
		
		adminService.logVisit(lvMap);
		
		return "redirect:/views/test.jsp";
	}
	
	@RequestMapping(value="/logLogin.do", method=RequestMethod.GET)
	public String LogLogin(HttpServletRequest request) {
		System.out.println("AdminController의 로그인 로그 메소드");
		
		String ll_id = request.getParameter("ll_id");
		String ll_ip = request.getParameter("ll_ip");
		String ll_country = request.getParameter("ll_country");
		String ll_device = request.getParameter("ll_device");
		String ll_result = request.getParameter("ll_result");
		
		Map<String, String> llMap = new HashMap<String, String>();
		llMap.put("ll_id", ll_id);
		llMap.put("ll_ip", ll_ip);
		llMap.put("ll_country", ll_country);
		llMap.put("ll_device", ll_device);
		llMap.put("ll_result", ll_result);
		
		
		adminService.logLogin(llMap);
		
		return "redirect:/loginMember.do";
	}
	
	@RequestMapping(value="/userAdmin.do")
	public String userAdminList(Model model) {
		List<MemberVO> list = null;
		
		list = adminService.userAdminList();
		
		model.addAttribute("userAdminList", list);
		return "redirect:/views/admin/pages/tables/userAdmin.jsp";
	}
	@RequestMapping(value="/userAdminView.do")
	public String userAdminView(Model model, HttpServletRequest request) {
		UserAdminViewVO uvo = null;
		
		List<UserAdminPostVO> uplist = null;
		List<UserAdminCommentVO> upclist = null;
		List<ProfileImageVO> upilist = null;
		
		String m_id = request.getParameter("m_id");
		
		uvo = adminService.userAdminView(m_id);
		uplist = adminService.userAdminPostList(m_id);
		upclist = adminService.userAdminCommentList(m_id);
		
		model.addAttribute("userAdminViewVO", uvo);
		model.addAttribute("userAdminPostList", uplist);
		model.addAttribute("userAdminCommentList", upclist);
		
		return "redirect:/views/admin/pages/examples/userAdminView.jsp";
	}
	
	@RequestMapping(value="/eventAdmin.do")
	public String eventAdminList(Model model) {
		List<EventVO> list = null;
		
		list = adminService.eventAdminList();
		
		model.addAttribute("userAdminList", list);
		return "redirect:/views/admin/pages/tables/userAdmin.jsp";
	}
}
