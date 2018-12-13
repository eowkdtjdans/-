package com.spring.biz.host.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.host.HostService;
import com.spring.biz.host.HostVO;

@Service("hostService")
public class HouseServiceImpl implements HostService {
	@Autowired
	private HostDAO hostDAO;

	@Override
	public List<HostVO> getHostList(String key) {
		return hostDAO.getHostList(key);
	}

	@Override
	public int countHost(String key) {
		return hostDAO.countHost(key);
	}

}
