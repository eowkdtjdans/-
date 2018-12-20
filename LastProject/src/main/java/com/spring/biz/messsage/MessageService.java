package com.spring.biz.messsage;

import java.util.List;

public interface MessageService {

	void insertMessage(MessageSendVO vo);


	List<MessageSendVO> getSendMessageList(MessageSendVO vo);

	List<MessageRecieveVO> getReceiveMessageList(MessageRecieveVO vo);

	MessageVO getMessage(MessageVO vo);


	void deleteMessege(MessageVO vo);


	MessageSendVO getSendMessage(MessageSendVO vo);

	MessageRecieveVO getReceiveMessage(MessageRecieveVO vo);


	void deleteSendMessage(MessageSendVO vo);

	void deleteReceiveMessage(MessageRecieveVO vo);
	
}
