package com.spring.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({"key", "searchCondition", "firstLat", "firstLng"})
public class SubController {
	
	HttpSession session;
	
	@RequestMapping("/sub.do")
	public String moveController(@RequestParam("searchCondition") String searchCondition, @RequestParam("searchKeyword") String searchKeyword, @RequestParam("lat") String lat, @RequestParam("lng") String lng, Model model) {
		System.out.println("searchCondition : " + searchCondition);
		System.out.println("searchKeyword : " + searchKeyword);
		String path = null;
		
		if(searchCondition.equals("find_travler")) {
			path = "/getTravelersList.do?cPage=1";
		} else if(searchCondition.equals("find_host")) {
			System.out.println("host");
			path = "/getHostList.do?cPage=1";
		} else if(searchCondition.equals("find_event")) {
			path = "/getEventList.do?cPage=1";
		} else if(searchCondition.equals("find_advice")) {
			System.out.println("/getLocalAdviceList.do?cPage=1");
			path = "/getLocalAdviceList.do?cPage=1";	
		}
		
		model.addAttribute("firstLat", lat);
		model.addAttribute("firstLng", lng);
		model.addAttribute("key", searchKeyword);
		model.addAttribute("searchCondition", searchCondition);
		return path;
	}
	

	
	
	@RequestMapping(value="/sub2.do", method=RequestMethod.GET)
	public String moveController() {
		System.out.println("sub2.do === get방식");
		return "views/sub.jsp";
	}
	
	@RequestMapping(value="/sub2.do", method=RequestMethod.POST)
	public String moveController2() {
		System.out.println("sub.do 포스트방식");
		return "views/sub.jsp";
	}
	
	
}