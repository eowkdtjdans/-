package com.spring.biz.message;

import java.util.Date;

public class MessageVO {
	
	private int message_idx;
	private String message_sender;
	private String message_receiver;
	private String message_title;
	private String message_content;
	private String message_read;
	private Date message_regdate;
	private Date message_startdate;
	private Date message_enddate;
	public int getMessage_idx() {
		return message_idx;
	}
	public void setMessage_idx(int message_idx) {
		this.message_idx = message_idx;
	}
	public String getMessage_sender() {
		return message_sender;
	}
	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}
	public String getMessage_receiver() {
		return message_receiver;
	}
	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public String getMessage_read() {
		return message_read;
	}
	public void setMessage_read(String message_read) {
		this.message_read = message_read;
	}
	public Date getMessage_regdate() {
		return message_regdate;
	}
	public void setMessage_regdate(Date message_regdate) {
		this.message_regdate = message_regdate;
	}
	public Date getMessage_startdate() {
		return message_startdate;
	}
	public void setMessage_startdate(Date message_startdate) {
		this.message_startdate = message_startdate;
	}
	public Date getMessage_enddate() {
		return message_enddate;
	}
	public void setMessage_enddate(Date message_enddate) {
		this.message_enddate = message_enddate;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
