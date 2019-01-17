package com.spring.biz.eventImage;

public class EventImageVO {
	private int e_idx, e_main, e_size;
	private String e_img, e_realpath, e_server;
	
	public int getE_size() {
		return e_size;
	}
	public void setE_size(int e_size) {
		this.e_size = e_size;
	}
	public String getE_realpath() {
		return e_realpath;
	}
	public void setE_realpath(String e_realpath) {
		this.e_realpath = e_realpath;
	}
	public String getE_server() {
		return e_server;
	}
	public void setE_server(String e_server) {
		this.e_server = e_server;
	}
	public int getE_idx() {
		return e_idx;
	}
	public void setE_idx(int e_idx) {
		this.e_idx = e_idx;
	}
	public int getE_main() {
		return e_main;
	}
	public void setE_main(int e_main) {
		this.e_main = e_main;
	}
	public String getE_img() {
		return e_img;
	}
	public void setE_img(String e_img) {
		this.e_img = e_img;
	}
	@Override
	public String toString() {
		return "EventImageVO [e_idx=" + e_idx + ", e_main=" + e_main + ", e_img=" + e_img + "]";
	}

	

	
	
}
