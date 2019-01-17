package com.spring.biz.profile;

import java.util.Date;

public class ProfileCommentVO {
	private String c_idx, idx, m_id, c_content,p_route, c_type;
	private Date c_date;
	public String getC_idx() {
		return c_idx;
	}
	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getP_route() {
		return p_route;
	}
	public void setP_route(String p_route) {
		this.p_route = p_route;
	}
	public String getC_type() {
		return c_type;
	}
	public void setC_type(String c_type) {
		this.c_type = c_type;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	@Override
	public String toString() {
		return "ProfileCommentVO [c_idx=" + c_idx + ", idx=" + idx + ", m_id=" + m_id + ", c_content=" + c_content
				+ ", p_route=" + p_route + ", c_type=" + c_type + ", c_date=" + c_date + "]";
	}
	
	
	
	
	
	
	
	
}
