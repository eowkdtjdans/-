package com.spring.biz.host;

import java.util.List;

public interface HostService {
	List<HostVO> getHostList(String key);
	
	int countHost(String key);
}
