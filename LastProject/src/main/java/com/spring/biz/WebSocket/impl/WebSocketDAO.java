package com.spring.biz.WebSocket.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("webSocketDAO")
public class WebSocketDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	public Object webSocketDAO;
	
	
	public void insertWebSocketChatting(String message) {
		mybatis.insert(message);
	}
	
	
}
