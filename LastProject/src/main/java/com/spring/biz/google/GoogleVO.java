package com.spring.biz.google;

import java.util.Date;

public class GoogleVO {
	private double lat, lng;
	private String m_id, h_maximumguest;
	private Date h_startdate, h_enddate;
	
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
	
}
