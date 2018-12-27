package com.spring.biz.com.admin.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminDAO")
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void LogVisit(Map<String, String> lvMap) {
		mybatis.insert("LogVisit", lvMap);
	}
}
