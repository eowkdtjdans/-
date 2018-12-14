package com.spring.biz.host.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.host.HostVO;

@Repository("hostDAO")
public class HostDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<HostVO> getHostList(Map<String, Object> map) {
		return mybatis.selectList("getHostList", map);
	}
	
	public int countHost(String key) {
		return mybatis.selectOne("countHost", key);
	}
	
}
