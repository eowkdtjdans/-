package com.spring.biz.admin;

import java.sql.Date;

public class logLoginVO {

	private String ll_id,
	ll_ip,
	ll_device,
	ll_result,
	ll_country;
	
	private Date ll_date;

	public String getLl_id() {
		return ll_id;
	}

	public void setLl_id(String ll_id) {
		this.ll_id = ll_id;
	}

	public String getLl_ip() {
		return ll_ip;
	}

	public void setLl_ip(String ll_ip) {
		this.ll_ip = ll_ip;
	}

	public String getLl_device() {
		return ll_device;
	}

	public void setLl_device(String ll_device) {
		this.ll_device = ll_device;
	}

	public String getLl_result() {
		return ll_result;
	}

	public void setLl_result(String ll_result) {
		this.ll_result = ll_result;
	}

	public String getLl_country() {
		return ll_country;
	}

	public void setLl_country(String ll_country) {
		this.ll_country = ll_country;
	}

	public Date getLl_date() {
		return ll_date;
	}

	public void setLl_date(Date ll_date) {
		this.ll_date = ll_date;
	}

	@Override
	public String toString() {
		return "logLoginVO [ll_id=" + ll_id + ", ll_ip=" + ll_ip + ", ll_device=" + ll_device + ", ll_result="
				+ ll_result + ", ll_country=" + ll_country + ", ll_date=" + ll_date + "]";
	}




	
	
	
	
	
}
