package com.spring.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.member.MemberVO;
import com.spring.biz.messsage.MessageRecieveVO;
import com.spring.biz.messsage.MessageSendVO;
import com.spring.biz.messsage.MessageService;
@Controller
@SessionAttributes("message")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	public MessageController() {
		System.out.println("===== 메세지 컨트롤러 시작");
	}
	
	@RequestMapping(value="insertMessage.do", method=RequestMethod.GET) 
	public String insertMessageGet(MessageSendVO vo) {
		System.out.println("인서트 메세지 =========== GET");
		return "views/message/MessageInsert.jsp";
	}
	
	@RequestMapping(value="insertMessage.do", method=RequestMethod.POST)
	public String insertMessagePost(MessageSendVO vo, 
			@RequestParam("send_sender") String send_sender,
			@RequestParam("send_receiver") String send_receiver,
			@RequestParam("send_title") String send_title, 
			@RequestParam("send_content") String send_content, HttpSession session) {
			
		System.out.println("인서트 메세지 =========== POST");
		vo.setSend_sender(send_sender);
		vo.setSend_receiver(send_receiver);
		vo.setSend_title(send_title);
		vo.setSend_content(send_content);
		
		messageService.insertMessage(vo);
		session.setAttribute("message", vo);
		return "redirect:/sub2.do";
	}
	
	
	
	@RequestMapping(value="/getSendMessageList.do", method=RequestMethod.GET)
	public String getSendMessageList(MessageSendVO vo, Model model, HttpSession session) {
		System.out.println("getMessageList.do ===== GET ");
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setSend_sender(member.getM_id());
		List<MessageSendVO> messageList = messageService.getSendMessageList(vo);
		model.addAttribute("messageList", messageList);
		return "views/message/MessageGetSendList.jsp";
	}
	
	
	@RequestMapping(value="/getReceiveMessageList.do", method=RequestMethod.GET)
	public String getReceiveMessageList(MessageRecieveVO vo, Model model, HttpSession session) {
		System.out.println("getReceiveMessageList.do ===== GET ");
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setReceive_receiver(member.getM_id());
		List<MessageRecieveVO> messageList = messageService.getReceiveMessageList(vo);
		model.addAttribute("messageList", messageList);
		return "views/message/MessageGetReceiveList.jsp";
	}
	
	
	@RequestMapping(value="/getSendMessage.do", method=RequestMethod.GET)
	public String getSendMessage(MessageSendVO vo, Model model) {
		model.addAttribute("message",messageService.getSendMessage(vo));
		return "views/message/MessageGetSend.jsp";
	}

	@RequestMapping(value="/getReceiveMessage.do", method=RequestMethod.GET)
	public String getReceiveMessage(MessageRecieveVO vo, Model model) {
		model.addAttribute("message",messageService.getReceiveMessage(vo));
		return "views/message/MessaGetReceive.jsp";
	}
	
	/*@RequestMapping(value="/deleteMessage.do", method=RequestMethod.GET)
	public String deleteMessage(MessageVO vo, Model model) {
		messageService.deleteMessege(vo);
		return "redirect:/getReceiveMessageList.do";
	}*/
	
	@RequestMapping(value="/deleteReceiveMessage.do", method=RequestMethod.GET)
	public String deleteMessage(MessageRecieveVO vo, Model model) {
		messageService.deleteReceiveMessage(vo);
		return "redirect:/getReceiveMessageList.do";
	}
	
	@RequestMapping(value="/deleteSendMessage.do", method=RequestMethod.GET)
	public String deleteMessage(MessageSendVO vo, Model model) {
		messageService.deleteSendMessage(vo);
		return "redirect:/getSendMessageList.do";
	}
	
	
	
}
