package com.spring.biz.message.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.messsage.MessageRecieveVO;
import com.spring.biz.messsage.MessageSendVO;
import com.spring.biz.messsage.MessageService;
import com.spring.biz.messsage.MessageVO;

@Service("messageService")
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO messageDAO;

	@Override
	public void insertMessage(MessageSendVO vo) {
		messageDAO.insertMessage(vo);
	}

	@Override
	public List<MessageSendVO> getSendMessageList(MessageSendVO vo) {
		return messageDAO.getSendMessageList(vo);
	}


	@Override
	public List<MessageRecieveVO> getReceiveMessageList(MessageRecieveVO vo) {
		return messageDAO.getReceiveMessageList(vo);
	}

	@Override
	public MessageVO getMessage(MessageVO vo) {
		return messageDAO.getMessage(vo);
	}

	@Override
	public void deleteMessege(MessageVO vo) {
		messageDAO.deleteMessage(vo);
	}

	@Override
	public MessageSendVO getSendMessage(MessageSendVO vo) {
		return messageDAO.getSendMessage(vo);
	}

	@Override
	public MessageRecieveVO getReceiveMessage(MessageRecieveVO vo) {
		return messageDAO.getReceiveMessage(vo);
	}

	@Override
	public void deleteSendMessage(MessageSendVO vo) {
		messageDAO.deleteSendMessage(vo);
	}

	@Override
	public void deleteReceiveMessage(MessageRecieveVO vo) {
		messageDAO.deleteReceiveMessage(vo);
	}
	
	
}
