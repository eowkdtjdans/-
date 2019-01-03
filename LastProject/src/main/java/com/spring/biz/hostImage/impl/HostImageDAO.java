package com.spring.biz.hostImage.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.hostImage.HostImageVO;

@Repository("hostImageDAO")
public class HostImageDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public HostImageVO getHostImage(HostImageVO hostimageVO) {
		return mybatis.selectOne("getHostImage", hostimageVO);
	}
}
