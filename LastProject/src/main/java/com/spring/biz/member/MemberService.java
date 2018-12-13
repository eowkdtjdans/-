package com.spring.biz.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.aop.ThrowsAdvice;


public interface MemberService {
	
	//회원가입
	 void insertMember(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO loginMember(MemberVO vo, HttpSession session) throws Exception;
	
	//비밀번호 수정
	void ModifyPwd(MemberVO vo) throws Exception;
	
	//로그아웃
	public void logoutMember(HttpSession session) throws Exception;


	//public int idCheck(String m_id) throws Exception;
	
	
	//아이디 찾기
	public MemberVO getId(Map<String, Object> paramMap);
	//비밀번호 찾기
	public MemberVO getPw(Map<String, Object> paramMap);

	 
	//List<MemberVO> idcheck(String m_id);
	
	 //로그인 체크
	public int loginCheck(String m_id, String m_pwd);

	//비밀번호 찾기 JSON
	int findPwdMemberJson(MemberVO vo);
	
	//로그인 JSON
	int loginMemberJson(MemberVO vo);

	int findIdMemberJson(MemberVO vo);

	int checkPhoneJson(String m_phone);

	 //아이디 중복체크
	int checkMemberJson(String m_id);
	
	//비밀번호 수정 
	int ModifyMemberPwdJson(MemberVO vo);



	

	

		


	


}
