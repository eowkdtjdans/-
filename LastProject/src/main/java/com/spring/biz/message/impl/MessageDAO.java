package com.spring.biz.message.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.messsage.MessageVO;

@Repository("messageDAO")
public class MessageDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	public Object messageDAO;
	public int insertMessageJson(MessageVO vo) {
		return mybatis.selectOne("insertMessageJson", vo);
	}
	public void insertMessage(MessageVO vo) {
		mybatis.insert("insertMessage", vo);
	}
	public List<MessageVO> getMessageList(MessageVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
