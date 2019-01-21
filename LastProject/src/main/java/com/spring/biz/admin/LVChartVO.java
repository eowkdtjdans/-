package com.spring.biz.admin;


public class LVChartVO {
	private String lv_date, lv_date_mon;
	private int value, mon_value;
	
	public String getLv_date() {
		return lv_date;
	}
	public void setLv_date(String lv_date) {
		this.lv_date = lv_date;
	}
	public String getLv_date_mon() {
		return lv_date_mon;
	}
	public void setLv_date_mon(String lv_date_mon) {
		this.lv_date_mon = lv_date_mon;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public int getMon_value() {
		return mon_value;
	}
	public void setMon_value(int mon_value) {
		this.mon_value = mon_value;
	}
	@Override
	public String toString() {
		return "LVChartVO [lv_date=" + lv_date + ", lv_date_mon=" + lv_date_mon + ", value=" + value + ", mon_value="
				+ mon_value + "]";
	}
	
}
