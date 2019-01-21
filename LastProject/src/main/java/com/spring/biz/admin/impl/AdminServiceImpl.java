package com.spring.biz.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.admin.AdminCntVO;
import com.spring.biz.admin.AdminService;
import com.spring.biz.admin.LVChartVO;
import com.spring.biz.admin.UserAdminCommentVO;
import com.spring.biz.admin.UserAdminPostVO;
import com.spring.biz.admin.UserAdminViewVO;
import com.spring.biz.admin.logLoginVO;
import com.spring.biz.event.EventVO;
import com.spring.biz.member.MemberVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public void logVisit(Map<String, String> lvMap) {
		adminDAO.logVisit(lvMap);
	}

	@Override
	public List<MemberVO> userAdminList() {
		return adminDAO.userAdminList();
	}
	
	@Override
	public UserAdminViewVO userAdminView(String m_id) {
		return adminDAO.userAdminView(m_id);
	}

	@Override
	public void logLogin(Map<String, String> llMap) {
		adminDAO.logLogin(llMap);
	}

	@Override
	public List<UserAdminPostVO> userAdminPostList(String m_id) {
		return adminDAO.userAdminPostList(m_id);
	}

	@Override
	public List<UserAdminCommentVO> userAdminCommentList(String m_id) {
		return adminDAO.userAdminCommentList(m_id);
	}

	@Override
	public AdminCntVO adminCnt() {
		return adminDAO.adminCnt();
	}

	@Override
	public List<EventVO> eventAdminList() {
		return adminDAO.eventAdminList();
	}

	@Override
	public void insertEvent(EventVO eventVO) {
		adminDAO.insertEvent(eventVO);
	}

	@Override
	public void insertEventImg(Map<String, String> eventImgMap) {
		adminDAO.insertEventImg(eventImgMap);
	}

	@Override
	public void adminDeleteProfileImage(Map<String, String> delParam) {
		adminDAO.adminDeleteProfileImage(delParam);
	}
	
	@Override
	public List<logLoginVO> getLoginRecord(logLoginVO vo) {
	
		return adminDAO.getLoginRecord(vo);
	}

	@Override
	public void deleteEvent(int e_idx) {
		adminDAO.deleteEvent(e_idx);
	}

	@Override
	public void deleteEventImg(Map<String, String> delImgMap) {
		adminDAO.deleteEventImg(delImgMap);
	}

	@Override
	public void modifyEvent(EventVO eventVO) {
		adminDAO.modifyEvent(eventVO);
	}

	@Override
	public void insertModifyEventImg(Map<String, String> eventImgMap) {
		adminDAO.insertModifyEventImg(eventImgMap);
	}

	@Override
	public int countLog(String ll_id) {
		return adminDAO.countLog(ll_id);
	}

	@Override
	public List<logLoginVO> getLogLoginList(Map<String, Object> map) {
		return adminDAO.getLogLoginList(map);
	}

	@Override
	public int countPost(String m_id) {
		return adminDAO.countPost(m_id);
	}

	@Override
	public List<logLoginVO> getmyPostList(Map<String, Object> map) {
		return adminDAO.getMyPostList(map);
	}

	@Override
	public int countComment(String m_id) {
		return adminDAO.countComment(m_id);
	}

	@Override
	public List<logLoginVO> getmyCommentList(Map<String, Object> map) {
		return adminDAO.getmyCommentList(map);
	}

	@Override
	public List<LVChartVO> logVisitChart() {
		return adminDAO.logVisitChart();
	}

}
