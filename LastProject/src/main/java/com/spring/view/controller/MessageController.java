package com.spring.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.messsage.MessageService;
import com.spring.biz.messsage.MessageVO;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	public MessageController() {
		System.out.println("===== 메세지 컨트롤러 시작");
	}
	
	@RequestMapping(value="insertMessage.do", method=RequestMethod.GET) 
	public String insertMessageGet(MessageVO vo) {
		System.out.println("인서트 메세지 =========== GET");
		return "views/message/MessageInsert.jsp";
	}
	
	@RequestMapping(value="insertMessage.do", method=RequestMethod.POST)
	public String insertMessagePost(MessageVO vo, @RequestParam("msg_sender") String msg_sender,
			@RequestParam("msg_title") String msg_title, @RequestParam("msg_receiver") String msg_receiver,
			@RequestParam("msg_content") String msg_content) {
			
		System.out.println("인서트 메세지 =========== POST");
		vo.setMsg_sender(msg_sender);
		vo.setMsg_receiver(msg_receiver);
		vo.setMsg_title(msg_title);
		vo.setMsg_content(msg_content);
		messageService.insertMessage(vo);
		
		
		return "redirect:/sub2.do";
	}
	
	@RequestMapping("/getMessageList.do")
	public String getMessageList(MessageVO vo, Model model) {
		List<MessageVO> messageList = messageService.getMessageList(vo);
		model.addAttribute("messageList", messageList);
		return "messageGetList.jsp";
	}
	
	
	
}
