package com.spring.biz.google;

import java.util.Date;

public class GoogleVO {
	private double lat, lng;
	private String p_route, m_id, h_maximumguest;
	private Date h_startdate, h_enddate;
	
	private String cont;
	
	private String icon = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
	
	public String getLat() {
		return Double.toString(lat);
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public String getLng() {
		return Double.toString(lng);
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getCont() {
		cont = "<table><tr><td rowspan='3'><img src='" + p_route + "' class='rounded-circle' onerror='this.src=\"../views/img/noImg.png\"'></td>"
				+"<td>" + m_id + "</td>" + "<td>" + h_maximumguest + "</td></tr>";
		return cont;
	}
	public void setP_route(String p_route) {
		this.p_route = p_route;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public void setH_maximumguest(String h_maximumguest) {
		this.h_maximumguest = h_maximumguest;
	}
	public void setH_startdate(Date h_startdate) {
		this.h_startdate = h_startdate;
	}
	public void setH_enddate(Date h_enddate) {
		this.h_enddate = h_enddate;
	}
	
}
