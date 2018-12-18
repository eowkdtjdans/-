package com.spring.biz.profile;

import com.spring.biz.member.MemberVO;

public interface ProfileService {

	  void ModifyProfile(ProfileVO vo) throws Exception;

	void InsertProfile(ProfileVO vo) throws Exception;

	int insertProfileJson(ProfileVO vo);
	

}
