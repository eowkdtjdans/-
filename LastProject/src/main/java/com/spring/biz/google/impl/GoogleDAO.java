package com.spring.biz.google.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.google.HostGoogleVO;

@Repository("googleDAO")
public class GoogleDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<HostGoogleVO> getHostGoogle() {
		return mybatis.selectList("getHostGoogle");
	}

	public List<HostGoogleVO> getEventGoogle() {
		return mybatis.selectList("getEventGoogle");
	}
}
