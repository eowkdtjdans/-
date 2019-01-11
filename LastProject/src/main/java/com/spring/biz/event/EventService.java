package com.spring.biz.event;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.biz.localAdvice.LocalAdviceVO;


public interface EventService {
	
	List<EventVO> getEventList(Map<String, Object> map);

	int countEvent(String key);
	
	EventVO getEvent(int e_idx);
	
	int goodEvent(int e_idx);
	
	int badEvent(int e_idx);
	
	void updet(int e_idx);
	
	void downdet(int e_idx);
	
	void upreviewcount(int e_idx);
}
