package com.spring.biz.profile.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.profile.ProfileVO;
@Repository("profileDAO")
public class ProfileDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	public Object profileDAO;
	
	
	public void modifyProfile(ProfileVO vo) {
		
		System.out.println("====== 프로필 수정 ======");
		mybatis.update("modifyProfile", vo);
		
		
	}


	public void insertProfile(ProfileVO vo) {
		mybatis.insert("insertProfile", vo);
	}

}
