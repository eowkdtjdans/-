package com.spring.biz.com.admin;

import java.util.List;
import java.util.Map;

import com.spring.biz.member.MemberVO;
import com.spring.biz.profileImage.ProfileImageVO;

public interface AdminService {
	void logVisit(Map<String, String> lvMap);
	void logLogin(Map<String, String> llMap);
	
	List<MemberVO> userAdminSelect();
	UserAdminViewVO userAdminViewSelect(String m_id);
	List<UserAdminPostVO> userAdminPostSelect(String m_id);
	List<UserAdminCommentVO> userAdminCommentSelect(String m_id);
	List<ProfileImageVO> userAdminImageSelect(String m_id);
}
