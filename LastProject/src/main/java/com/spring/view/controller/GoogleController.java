package com.spring.view.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.google.GoogleService;
import com.spring.biz.google.HostGoogleVO;

@Controller
public class GoogleController {
	@Autowired
	private GoogleService googleService;
	
	public GoogleController() {
		System.out.println("GoogleController 실행");
	}
	
	@RequestMapping("/getHostGoogle.do")
	@ResponseBody
	public List<HostGoogleVO> getHostGoogle() {
		List<HostGoogleVO> list = googleService.getHostGoogle();
		return list;
	}
	
	@RequestMapping("/getEventGoogle.do")
	@ResponseBody
	public List<HostGoogleVO> getEventGoogle() {
		List<HostGoogleVO> list = googleService.getEventGoogle();
		return list;
	}
	
}