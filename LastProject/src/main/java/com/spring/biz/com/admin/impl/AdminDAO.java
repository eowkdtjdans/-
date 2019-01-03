package com.spring.biz.com.admin.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.com.admin.UserAdminCommentVO;
import com.spring.biz.com.admin.UserAdminPostVO;
import com.spring.biz.com.admin.UserAdminViewVO;
import com.spring.biz.member.MemberVO;

@Repository("adminDAO")
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void logVisit(Map<String, String> lvMap) {
		mybatis.insert("logVisit", lvMap);
	}
	
	public List<MemberVO> userAdminSelect() {
		return mybatis.selectList("userAdminSelect");
	}
	
	public UserAdminViewVO userAdminViewSelect(String m_id) {
		return mybatis.selectOne("userAdminViewSelect", m_id);
	}

	public void logLogin(Map<String, String> llMap) {
		mybatis.insert("logLogin", llMap);
	}

	public List<UserAdminPostVO> userAdminPostSelect(String m_id) {
		return mybatis.selectList("userAdminPostSelect", m_id);
	}

	public List<UserAdminCommentVO> userAdminCommentSelect(String m_id) {
		return mybatis.selectList("userAdminCommentSelect", m_id);
	}

}
