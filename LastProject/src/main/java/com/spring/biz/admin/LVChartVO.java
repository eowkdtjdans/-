package com.spring.biz.admin;

import java.util.Date;

public class LVChartVO {
	private Date lv_date;
	private int value;
	
	public Date getLv_date() {
		return lv_date;
	}
	public void setLv_date(Date lv_date) {
		this.lv_date = lv_date;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
}
