package com.spring.biz.profileImage.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.profileImage.ProfileImageService;

@Service("profileImageService")
public class ProfileImageServiceImpl implements ProfileImageService{
	@Autowired
	private ProfileImageDAO profileImageDAO;

	@Override
	public void ProfileImageInsert(Map<String, String> profileImageMap) {
		profileImageDAO.ProfileImageInsert(profileImageMap);
	}

	@Override
	public void ProfileImageSetMain() {
		
	}

	@Override
	public int ProfileImageMainCount(String m_id) {
		return profileImageDAO.ProfileImageMainCount(m_id);
	}

}
