package com.spring.biz.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.admin.AdminService;
import com.spring.biz.admin.UserAdminCommentVO;
import com.spring.biz.admin.UserAdminPostVO;
import com.spring.biz.admin.UserAdminViewVO;
import com.spring.biz.member.MemberVO;
import com.spring.biz.profileImage.ProfileImageVO;

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
	public UserAdminViewVO userAdminViewSelect(String m_id) {
		return adminDAO.userAdminViewSelect(m_id);
	}

	@Override
	public void logLogin(Map<String, String> llMap) {
		adminDAO.logLogin(llMap);
	}

	@Override
	public List<UserAdminPostVO> userAdminPostSelect(String m_id) {
		return adminDAO.userAdminPostSelect(m_id);
	}

	@Override
	public List<UserAdminCommentVO> userAdminCommentSelect(String m_id) {
		return adminDAO.userAdminCommentSelect(m_id);
	}

	@Override
	public List<ProfileImageVO> userAdminImageSelect(String m_id) {
		return adminDAO.userAdminImageSelect(m_id);
	}

}
