package com.spring.biz.com.event.impl;

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

}
