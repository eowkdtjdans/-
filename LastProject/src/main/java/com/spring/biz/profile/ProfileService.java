package com.spring.biz.profile;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.biz.member.MemberVO;

public interface ProfileService {

	  void ModifyProfile(ProfileVO vo) throws Exception;

	void InsertProfile(ProfileVO vo) throws Exception;

	int insertProfileJson(ProfileVO vo);

	List<ProfileVO> getProfile(ProfileVO vo);

	ProfileVO getProfile(ProfileVO vo, HttpSession session);

	ProfileVO getProfile2(ProfileVO profileVO, HttpSession session);
	

}
