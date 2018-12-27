package com.spring.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.biz.com.admin.AdminService;
import com.spring.biz.com.admin.LogVisitVO;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	public AdminController() {
		System.out.println("AdminController로 옴");
	}
	
	@RequestMapping(value="/LogVisit.do", method=RequestMethod.GET)
	public String LogVisit(HttpServletRequest request) {
		System.out.println("AdminController의 사이트 조회수 누적 메소드");
		
		String lv_ip = request.getParameter("lv_ip");
		String lv_country = request.getParameter("lv_country");
		
		Map<String, String> lvMap = new HashMap<String, String>();
		lvMap.put("lv_ip", lv_ip);
		lvMap.put("lv_country", lv_country);
		
		System.out.println("ip: " + lv_ip);
		System.out.println("country: " + lv_country);
		
		adminService.LogVisit(lvMap);
		
		return "redirect:/views/test.jsp";
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/weekVisit", method=RequestMethod.POST)
	public List<LogVisitVO> WeekVisit() {
		List<LogVisitVO> list = null;
		
		return list;
	}
}
