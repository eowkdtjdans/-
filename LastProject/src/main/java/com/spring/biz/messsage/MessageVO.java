package com.spring.biz.messsage;

public class MessageVO {
	
	private int MSG_IDX;
	private String MSG_SENDER;
	private String MSG_RECEIVER;
	private String MSG_TITLE;
	private String MSG_CONTENT;
	
	
	public int getMSG_IDX() {
		return MSG_IDX;
	}
	public void setMSG_IDX(int mSG_IDX) {
		MSG_IDX = mSG_IDX;
	}
	public String getMSG_SENDER() {
		return MSG_SENDER;
	}
	public void setMSG_SENDER(String mSG_SENDER) {
		MSG_SENDER = mSG_SENDER;
	}
	public String getMSG_RECEIVER() {
		return MSG_RECEIVER;
	}
	public void setMSG_RECEIVER(String mSG_RECEIVER) {
		MSG_RECEIVER = mSG_RECEIVER;
	}
	public String getMSG_TITLE() {
		return MSG_TITLE;
	}
	public void setMSG_TITLE(String mSG_TITLE) {
		MSG_TITLE = mSG_TITLE;
	}
	public String getMSG_CONTENT() {
		return MSG_CONTENT;
	}
	public void setMSG_CONTENT(String mSG_CONTENT) {
		MSG_CONTENT = mSG_CONTENT;
	}
	@Override
	public String toString() {
		return "MessageVO [MSG_IDX=" + MSG_IDX + ", MSG_SENDER=" + MSG_SENDER + ", MSG_RECEIVER=" + MSG_RECEIVER
				+ ", MSG_TITLE=" + MSG_TITLE + ", MSG_CONTENT=" + MSG_CONTENT + "]";
	}
	
	
	
}
