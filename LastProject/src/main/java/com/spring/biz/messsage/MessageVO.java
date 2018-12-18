package com.spring.biz.messsage;

public class MessageVO {
	
	private int msg_idx;
	private String msg_sender;
	private String msg_receiver;
	private String msg_title;
	private String msg_content;
	public int getMsg_idx() {
		return msg_idx;
	}
	public void setMsg_idx(int msg_idx) {
		this.msg_idx = msg_idx;
	}
	public String getMsg_sender() {
		return msg_sender;
	}
	public void setMsg_sender(String msg_sender) {
		this.msg_sender = msg_sender;
	}
	public String getMsg_receiver() {
		return msg_receiver;
	}
	public void setMsg_receiver(String msg_receiver) {
		this.msg_receiver = msg_receiver;
	}
	public String getMsg_title() {
		return msg_title;
	}
	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	@Override
	public String toString() {
		return "MessageVO [msg_idx=" + msg_idx + ", msg_sender=" + msg_sender + ", msg_receiver=" + msg_receiver
				+ ", msg_title=" + msg_title + ", msg_content=" + msg_content + "]";
	}
	
	
	
	
	
}
