package com.spring.biz.profileImage.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("profileImageDAO")
public class ProfileImageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void ProfileImageInsert(Map<String, String> profileImageMap) {
		System.out.println(profileImageMap);
		mybatis.insert("ProfileImageInsert", profileImageMap);
	}
	
	public int ProfileImageMainCount(String m_id) {
		return mybatis.selectOne("ProfileImageMainCount", m_id);
	}
	
	public void ProfileImageSetMain() {
		
	}

}
