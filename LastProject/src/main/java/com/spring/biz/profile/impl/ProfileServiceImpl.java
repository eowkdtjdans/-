package com.spring.biz.profile.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.member.MemberVO;
import com.spring.biz.profile.ProfileService;
import com.spring.biz.profile.ProfileVO;
@Service("profileService")
public class ProfileServiceImpl implements ProfileService {
	@Autowired
	private ProfileDAO profileDAO;
	
	
	@Override
	public void ModifyProfile(ProfileVO vo) {
		profileDAO.modifyProfile(vo);	
	}


	@Override
	public void InsertProfile(ProfileVO vo) throws Exception {
		profileDAO.insertProfile(vo);
	}


	@Override
	public int insertProfileJson(ProfileVO vo) {
		return profileDAO.insertProfileJson(vo);
	}

}
