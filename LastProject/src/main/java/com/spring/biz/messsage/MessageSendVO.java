package com.spring.biz.messsage;

import java.util.Date;

public class MessageSendVO {
	private int send_idx;
	private String send_sender,
	send_receiver,
	send_title,
	send_content;
	private Date send_regdate;

	
	
	
	
	
	

	public int getSend_idx() {
		return send_idx;
	}

	public void setSend_idx(int send_idx) {
		this.send_idx = send_idx;
	}

	public String getSend_sender() {
		return send_sender;
	}

	public void setSend_sender(String send_sender) {
		this.send_sender = send_sender;
	}

	public String getSend_receiver() {
		return send_receiver;
	}

	public void setSend_receiver(String send_receiver) {
		this.send_receiver = send_receiver;
	}

	public String getSend_title() {
		return send_title;
	}

	public void setSend_title(String send_title) {
		this.send_title = send_title;
	}

	public String getSend_content() {
		return send_content;
	}

	public void setSend_content(String send_content) {
		this.send_content = send_content;
	}

	public Date getSend_regdate() {
		return send_regdate;
	}

	public void setSend_regdate(Date send_regdate) {
		this.send_regdate = send_regdate;
	}

	@Override
	public String toString() {
		return "MessageSendVO [send_idx=" + send_idx + ", send_sender=" + send_sender + ", send_receiver="
				+ send_receiver + ", send_title=" + send_title + ", send_content=" + send_content + ", send_regdate="
				+ send_regdate + "]";
	}
	
	
	
}
