package com.spring.biz.com.admin;

import java.util.List;
import java.util.Map;

import com.spring.biz.member.MemberVO;

public interface AdminService {
	void logVisit(Map<String, String> lvMap);
	void logLogin(Map<String, String> llMap);
	
	List<MemberVO> userAdminSelect();
	userAdminViewVO userAdminViewSelect(String m_id);
}
