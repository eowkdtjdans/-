package com.spring.biz.host;

import java.util.List;
import java.util.Map;

public interface HostService {
	List<HostVO> getHostList(Map<String, Object> map);
	
	int countHost(String key);
}
