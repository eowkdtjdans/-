package com.spring.biz.admin.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.admin.AdminCntVO;
import com.spring.biz.admin.UserAdminCommentVO;
import com.spring.biz.admin.UserAdminPostVO;
import com.spring.biz.admin.UserAdminViewVO;
import com.spring.biz.admin.logLoginVO;
import com.spring.biz.event.EventVO;
import com.spring.biz.member.MemberVO;

@Repository("adminDAO")
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void logVisit(Map<String, String> lvMap) {
		mybatis.insert("logVisit", lvMap);
	}
	
	public List<MemberVO> userAdminList() {
		return mybatis.selectList("userAdminList");
	}
	
	public UserAdminViewVO userAdminView(String m_id) {
		return mybatis.selectOne("userAdminView", m_id);
	}

	public void logLogin(Map<String, String> llMap) {
		mybatis.insert("logLogin", llMap);
	}

	public List<UserAdminPostVO> userAdminPostList(String m_id) {
		return mybatis.selectList("userAdminPostList", m_id);
	}

	public List<UserAdminCommentVO> userAdminCommentList(String m_id) {
		return mybatis.selectList("userAdminCommentList", m_id);
	}

	public AdminCntVO adminCnt() {
		return mybatis.selectOne("adminCnt");
	}

	public List<EventVO> eventAdminList() {
		return mybatis.selectList("eventAdminList");
	}

	public void insertEvent(EventVO eventVO) {
		mybatis.insert("insertEvent", eventVO);
	}

	public void insertEventImg(Map<String, String> eventImgMap) {
		mybatis.insert("insertEventImg", eventImgMap);
	}

	public void adminDeleteProfileImage(Map<String, String> delParam) {
		mybatis.delete("adminDeleteProfileImage", delParam);
	}
	
	public List<logLoginVO> getLoginRecord(logLoginVO vo) {
		return mybatis.selectList("getLoginRecord", vo);
	}

	public int countLog(String ll_id) {
		return mybatis.selectOne("countLog", ll_id);
	}

	public List<logLoginVO> getLogLoginList(Map<String, Object> map) {
		return mybatis.selectList("getLogLoginList", map);
	}

	public int countPost(String m_id) {
		return mybatis.selectOne("countPost", m_id);
	}

	public List<logLoginVO> getMyPostList(Map<String, Object> map) {
		return mybatis.selectList("getMyPostList", map);
	}

	public int countComment(String m_id) {
		return mybatis.selectOne("countComment", m_id);
	}

	public List<logLoginVO> getmyCommentList(Map<String, Object> map) {
		return mybatis.selectList("getMyCommentList", map);
	}

	public int countComment2(String m_id) {
		return mybatis.selectOne("countComment2", m_id);
	}


}
