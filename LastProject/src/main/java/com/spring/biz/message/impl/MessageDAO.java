package com.spring.biz.message.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.messsage.MessageRecieveVO;
import com.spring.biz.messsage.MessageSendVO;
import com.spring.biz.messsage.MessageVO;

@Repository("messageDAO")
public class MessageDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	public Object messageDAO;
	
	public void insertMessage(MessageSendVO vo) {
		mybatis.insert("insertMessage", vo);
	}
	public List<MessageSendVO> getSendMessageList(MessageSendVO vo) {
		return mybatis.selectList("getSendMessageList", vo);
	}
	public List<MessageRecieveVO> getReceiveMessageList(MessageRecieveVO vo) {
		return mybatis.selectList("getReceiveMessageList", vo);
	}
	public MessageVO getMessage(MessageVO vo) {
		return mybatis.selectOne("getMessage", vo);
	}
	public Object deleteMessage(MessageVO vo) {
		return mybatis.delete("deleteMessage", vo);
	}
	public MessageSendVO getSendMessage(MessageSendVO vo) {
		return mybatis.selectOne("getSendMessage", vo);
	}
	public MessageRecieveVO getReceiveMessage(MessageRecieveVO vo) {
		return mybatis.selectOne("getReceiveMessage", vo);
	}
	public Object deleteReceiveMessage(MessageRecieveVO vo) {
		return mybatis.delete("deleteReceiveMessage", vo);
	}
	public Object deleteSendMessage(MessageSendVO vo) {
		return mybatis.delete("deleteSendMessage", vo);
	}
	
}
