package com.spring.biz.com.event;

import java.util.List;
import java.util.Map;

import com.spring.biz.event.EventVO;

public interface EventService {
	List<EventVO> getEventList(Map<String, Object> map);
	public int countEvent(String key);
}
