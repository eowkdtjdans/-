package com.spring.biz.profileImage;

import java.util.Map;

public interface ProfileImageService {
	void ProfileImageInsert(Map<String, String> profileImageMap);
	int ProfileImageMainCount(String m_id);
	void ProfileImageSetMain();
	int HostImageMainCount(String m_id);
	void HostImageInsert(Map<String, String> hostImageMap);
}
