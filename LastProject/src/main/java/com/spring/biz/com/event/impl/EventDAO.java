package com.spring.biz.com.event.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.event.EventVO;

@Repository("eventDAO")
public class EventDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<EventVO> getEventList(Map<String, Object> map) {
		System.out.println("EventDAO: getEventList(EventVO vo)처리");
		return mybatis.selectList("getEventList", map);
	}

	public int countEvent(String key) {
		return mybatis.selectOne("countEvent", key);
	}
}
