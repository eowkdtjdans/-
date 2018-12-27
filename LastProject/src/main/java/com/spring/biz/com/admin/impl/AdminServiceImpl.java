package com.spring.biz.com.admin.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.com.admin.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public void LogVisit(Map<String, String> lvMap) {
		adminDAO.LogVisit(lvMap);
	}
}
