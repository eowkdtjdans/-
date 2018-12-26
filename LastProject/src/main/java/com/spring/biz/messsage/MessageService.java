package com.spring.biz.messsage;

import java.util.List;

public interface MessageService {

	void insertMessage(MessageVO vo);


	List<MessageSendVO> getSendMessageList(MessageSendVO vo);

	List<MessageRecieveVO> getReceiveMessageList(MessageRecieveVO vo);
	
	List<MessageVO> getAllMessageList(MessageVO vo);
	
	MessageVO getMessage(MessageVO vo);


	


	MessageSendVO getSendMessage(MessageSendVO vo);

	MessageRecieveVO getReceiveMessage(MessageRecieveVO vo);

	void deleteMessege(MessageVO vo);
	
	void deleteSendMessage(MessageSendVO sendvo);

	void deleteReceiveMessage(MessageRecieveVO receivevo);


	void updateRead(MessageVO vo);



	
}
