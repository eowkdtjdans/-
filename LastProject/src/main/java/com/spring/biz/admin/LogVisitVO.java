package com.spring.biz.admin;

import java.util.Date;

public class LogVisitVO {
	private String lv_ip, lv_country, lv_browser;
	private Date lv_date;
	
	public String getLv_ip() {
		return lv_ip;
	}
	public void setLv_ip(String lv_ip) {
		this.lv_ip = lv_ip;
	}
	public String getLv_country() {
		return lv_country;
	}
	public void setLv_country(String lv_country) {
		this.lv_country = lv_country;
	}
	public String getLv_browser() {
		return lv_browser;
	}
	public void setLv_browser(String lv_browser) {
		this.lv_browser = lv_browser;
	}
	public Date getLv_date() {
		return lv_date;
	}
	public void setLv_date(Date lv_date) {
		this.lv_date = lv_date;
	}
}
