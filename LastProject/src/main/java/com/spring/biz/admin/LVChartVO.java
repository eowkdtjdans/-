package com.spring.biz.admin;


public class LVChartVO {
	private String lv_date, lv_date_mon, lv_date_year;
	private int value, mon_value, year_value;
	
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
	public String getLv_date_year() {
		return lv_date_year;
	}
	public void setLv_date_year(String lv_date_year) {
		this.lv_date_year = lv_date_year;
	}
	public int getYear_value() {
		return year_value;
	}
	public void setYear_value(int year_value) {
		this.year_value = year_value;
	}
	
}
