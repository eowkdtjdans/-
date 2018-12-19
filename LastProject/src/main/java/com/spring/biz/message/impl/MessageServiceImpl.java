package com.spring.biz.message.impl;

import java.util.List;

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

	@Override
	public void insertMessage(MessageVO vo) {
		messageDAO.insertMessage(vo);
	}

	@Override
	public List<MessageVO> getMessageList(MessageVO vo) {
		return messageDAO.getMessageList(vo);
	}
	
	
}
