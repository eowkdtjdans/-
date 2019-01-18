package com.spring.biz.google;

import java.util.Date;

public class EventGoogleVO {
	private double lat, lng;
	private String e_img, e_address, e_name, e_content, e_region, e_tag;
	private Date e_startdate, e_enddate, e_date;
	private int e_idx, e_upvote, e_reviewcount, e_count;
	
	private String cont;
	private String icon = "/views/img/markerImg-event.png";
	
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getE_img() {
		return e_img;
	}
	public void setE_img(String e_img) {
		this.e_img = e_img;
	}
	public String getE_address() {
		return e_address;
	}
	public void setE_address(String e_address) {
		this.e_address = e_address;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public String getE_region() {
		return e_region;
	}
	public void setE_region(String e_region) {
		this.e_region = e_region;
	}
	public String getE_tag() {
		return e_tag;
	}
	public void setE_tag(String e_tag) {
		this.e_tag = e_tag;
	}
	public Date getE_startdate() {
		return e_startdate;
	}
	public void setE_startdate(Date e_startdate) {
		this.e_startdate = e_startdate;
	}
	public Date getE_enddate() {
		return e_enddate;
	}
	public void setE_enddate(Date e_enddate) {
		this.e_enddate = e_enddate;
	}
	public Date getE_date() {
		return e_date;
	}
	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}
	public int getE_idx() {
		return e_idx;
	}
	public void setE_idx(int e_idx) {
		this.e_idx = e_idx;
	}
	public int getE_upvote() {
		return e_upvote;
	}
	public void setE_upvote(int e_upvote) {
		this.e_upvote = e_upvote;
	}
	public int getE_reviewcount() {
		return e_reviewcount;
	}
	public void setE_reviewcount(int e_reviewcount) {
		this.e_reviewcount = e_reviewcount;
	}
	public int getE_count() {
		return e_count;
	}
	public void setE_count(int e_count) {
		this.e_count = e_count;
	}
	public String getCont() {
		cont = "<table><tr><td rowspan='2'><img src='" + e_img + "' class='rounded-circle' onerror='this.src=\"../views/img/noImg.png\"'></td>"+"<td>" + e_name + "</td></tr>";
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
}
