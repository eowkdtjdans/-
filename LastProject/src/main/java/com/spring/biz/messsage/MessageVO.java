package com.spring.biz.messsage;

import java.util.Date;

public class MessageVO {
	
	private int msg_idx;
	private String msg_sender;
	private String msg_receiver;
	private String msg_title;
	private String msg_content;
	private Date msg_regdate;
	
	
	
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
	public Date getMsg_regdate() {
		return msg_regdate;
	}
	public void setMsg_regdate(Date msg_regdate) {
		this.msg_regdate = msg_regdate;
	}
	
	@Override
	public String toString() {
		return "MessageVO [msg_idx=" + msg_idx + ", msg_sender=" + msg_sender + ", msg_receiver=" + msg_receiver
				+ ", msg_title=" + msg_title + ", msg_content=" + msg_content + ", msg_regdate=" + msg_regdate + "]";
	}
	
	
	
	
}
