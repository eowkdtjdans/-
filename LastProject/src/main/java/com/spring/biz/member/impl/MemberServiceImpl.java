package com.spring.biz.member.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;
@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberServiceImpl() {
		System.out.println("MemberServiceImpl 객체 생성 ===");
	}
	
	
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		memberDAO.insertMember(vo);
	}
	

	
	@Override
	public MemberVO loginMember(MemberVO vo, HttpSession session) throws Exception {
	
		session.setAttribute("m_id", vo.getM_id());
		session.setAttribute("m_id", vo.getM_pwd());
		
	return memberDAO.loginMember(vo);
}
	
	@Override
	public void logoutMember(HttpSession session) {
		session.invalidate();
		
	}


	 @Override
	    public MemberVO getPw(Map<String, Object> paramMap) {
	        return memberDAO.getPw(paramMap);
	    }
	 @Override
		public MemberVO getId(Map<String, Object> paramMap) {
			return memberDAO.getId(paramMap);
		}

	/*@Override
	public List<MemberVO> idCheck(String m_id) {
		return memberDAO.idCheck(m_id);
	}*/


	@Override
	public int loginCheck(String m_id, String m_pwd) {
		return memberDAO.loginCheck(m_id, m_pwd);
	}


	@Override
	public int checkMember(String m_id) {
		return memberDAO.checkMember(m_id);
	}


	@Override
	public int findPwdMemberJson(MemberVO vo) {
		return memberDAO.findPwdMemberJson(vo);
	}




	




























	

	




}
