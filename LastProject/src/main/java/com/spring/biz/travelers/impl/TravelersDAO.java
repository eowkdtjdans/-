package com.spring.biz.travelers.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.travelers.TravelersVO;

@Repository("travelersDAO")
public class TravelersDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//Travelers 조회
	public List<TravelersVO> getTravelersList(Map<String, Object> map) {
		return mybatis.selectList("getTravelersList", map);
	}
	
	public int countTravelers(String key) {
		return mybatis.selectOne("countTravelers", key);
	}
	
	//상세조회
	public TravelersVO getTravelers(String m_id) {
		return mybatis.selectOne("getTravelers", m_id);
	}
}
