package com.spring.biz.profile;

import java.util.List;

public interface ProfileService {

	  void ModifyProfile(ProfileVO vo) throws Exception;

	void InsertProfile(ProfileVO vo) throws Exception;

	int insertProfileJson(ProfileVO vo);

	List<ProfileVO> getProfile(ProfileVO vo);
	

}
