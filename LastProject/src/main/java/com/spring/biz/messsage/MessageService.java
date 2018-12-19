package com.spring.biz.messsage;

import java.util.List;

public interface MessageService {

	int insertMessageJson(MessageVO vo);

	void insertMessage(MessageVO vo);

	List<MessageVO> getMessageList(MessageVO vo);
	
}
