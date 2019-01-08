package com.spring.biz.event.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.biz.event.EventService;
import com.spring.biz.event.EventVO;

@Service("eventService")
public class EventServiceImpl implements EventService {

	@Override
	public List<EventVO> getEventList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countEvent(String key) {
		// TODO Auto-generated method stub
		return 0;
	}

}
