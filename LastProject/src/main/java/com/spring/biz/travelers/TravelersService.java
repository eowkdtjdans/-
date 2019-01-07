package com.spring.biz.travelers;

import java.util.List;
import java.util.Map;

public interface TravelersService {

	List<TravelersVO> getTravelersList(Map<String, Object> map);
	
	int countTravelers (String key);
	
	TravelersVO getTravelers(String m_id);
}
