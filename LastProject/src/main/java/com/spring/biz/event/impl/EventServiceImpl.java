package com.spring.biz.event.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.event.EventService;
import com.spring.biz.event.EventVO;

@Service("eventService")
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public List<EventVO> getEventList(Map<String, Object> map) {
		return eventDAO.getEventList(map);
	}

	@Override
	public int countEvent(String key) {
		return eventDAO.countEvent(key);
	}

	@Override
	public EventVO getEvent(int e_idx) {
		return eventDAO.getEvent(e_idx);
	}

	@Override
	public int goodEvent(int e_idx) {
		return eventDAO.goodEvent(e_idx);
	}

	@Override
	public int badEvent(int e_idx) {
		return eventDAO.badEvent(e_idx);
	}

	@Override
	public void updet(int e_idx) {
		eventDAO.updet(e_idx);		
	}

	@Override
	public void downdet(int e_idx) {
		eventDAO.downdet(e_idx);
	}

	@Override
	public void upreviewcount(int e_idx) {		
		eventDAO.upreviewcount(e_idx);
	}

}
