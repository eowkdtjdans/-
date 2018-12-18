package com.spring.biz.message.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.messsage.MessageService;
import com.spring.biz.messsage.MessageVO;

@Service("messageService")
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO messageDAO;

	@Override
	public int insertMessageJson(MessageVO vo) {
		return messageDAO.insertMessageJson(vo);
	}
	
	
}
