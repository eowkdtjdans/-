package com.spring.biz.member.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.member.MemberVO;

@Repository("memberDAO")
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//회원가입
	public void insertMember(MemberVO vo) throws Exception {
		
		System.out.println("======== insertMember() =========");
		mybatis.insert("insertMember", vo);
	}
	
	//로그인
	public MemberVO loginMember(MemberVO vo) throws Exception {
		
		System.out.println("======== loginMember() =========");
		return (MemberVO) mybatis.selectOne("loginMember", vo);
	}
	
	//로그아웃
	public void logout(HttpSession session) throws Exception {
		System.out.println("======== logoutMember() =========");
	}

	//아이디 중복확인
	public List<MemberVO> idCheck(String m_id) {
		return mybatis.selectOne("idCheck", m_id);
	}
	
	//비밀번호 찾기
	public MemberVO getPw(Map<String, Object> paramMap) {
		return mybatis.selectOne("getPw", paramMap);
	}

	public MemberVO getId(Map<String, Object> paramMap) {
		return mybatis.selectOne("getId", paramMap);
	}
	//로그인 체크
	public int loginCheck(String m_id, String m_pwd) {
		return  mybatis.selectOne("loginCheck", m_id);
	}
	
	//아이디 체크
	public int checkMemberJson(String m_id) {
		return mybatis.selectOne("checkMemberJson", m_id);
	}
	
	

	public int loginMemberJson(MemberVO vo) {
		return mybatis.selectOne("loginMemberJson", vo);
	}
	
	//아이디찾기 JSON
	public int findIdMemberJson(MemberVO vo) {
		return mybatis.selectOne("findIdMemberJson", vo);
	}
	//비밀번호찾기 JSON
	public int findPwdMemberJson(MemberVO vo) {
		return mybatis.selectOne("findPwdMemberJson", vo);
	}
	
	//비밀번호 중복확인
	public int checkPhoneJson(String m_phone) {
		return mybatis.selectOne("checkPhoneJson", m_phone);
	}


	
}
