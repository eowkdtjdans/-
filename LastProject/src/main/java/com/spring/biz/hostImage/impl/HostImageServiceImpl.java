package com.spring.biz.hostImage.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.hostImage.HostImageService;
import com.spring.biz.hostImage.HostImageVO;

@Service("hostImageService")
public class HostImageServiceImpl implements HostImageService{
@Autowired
private HostImageDAO hostImageDAO;

@Override
public HostImageVO getHostImage(HostImageVO hostimageVO) {
	return hostImageDAO.getHostImage(hostimageVO);
}


}
