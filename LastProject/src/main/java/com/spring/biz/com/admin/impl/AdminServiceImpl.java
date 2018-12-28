package com.spring.biz.com.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.com.admin.AdminService;
import com.spring.biz.member.MemberVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public void logVisit(Map<String, String> lvMap) {
		adminDAO.logVisit(lvMap);
	}

	@Override
	public List<MemberVO> userAdminSelect() {
		return adminDAO.userAdminSelect();
	}

	@Override
	public void logLogin(Map<String, String> llMap) {
		adminDAO.logLogin(llMap);
	}
	
}
