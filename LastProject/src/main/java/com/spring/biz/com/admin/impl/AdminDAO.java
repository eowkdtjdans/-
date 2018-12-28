package com.spring.biz.com.admin.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	public void logLogin(Map<String, String> llMap) {
		mybatis.insert("logLogin", llMap);
	}
}
