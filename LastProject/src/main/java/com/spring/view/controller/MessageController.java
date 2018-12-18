package com.spring.view.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		
			
		
		
		
		return "";
	}
	
	
	
	
	/*@RequestMapping(value="insertMessageJson.do", method=RequestMethod.GET) 
	public String insertMessageJsonGet(MessageVO vo) {
		System.out.println("인서트 메세지 =========== GET");
		return "views/message/MessageInsert.jsp";
	}
	
	@RequestMapping(value="insertMessageJson.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> insertMessageJson(MessageVO vo) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = messageService.insertMessageJson(vo);
		map.put("cnt", count);
		
		return map;
	}
*/	
	
}
