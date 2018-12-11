package com.spring.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.member.Email;
import com.spring.biz.member.EmailSender;
import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;

@Controller 
@SessionAttributes("sessionScope")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private Email email;
	@Autowired
	private EmailSender emailSender;
	
	public MemberController() {
		System.out.println("=======멤버 컨트롤러 시작");
	}
	
	
	

	
	
	//======================================================================
	//회원가입
			@RequestMapping(value = "/insertMember.do", method=RequestMethod.GET)
			public String insertMemberGet(MemberVO vo) {
				System.out.println("=======겟방식");
				return "views/member/MemberRegister.jsp";
		}
	//회원가입
	@RequestMapping(value = "/insertMember.do", method=RequestMethod.POST)
	public String insertMemberPost(MemberVO vo) throws Exception {
		System.out.println("=======인서트시작");
		System.out.println("인서트두 컨트롤러 vo: " + vo);
		memberService.insertMember(vo);
		return "/sub2.do";
	}
	
	//======================================================================
	//로그인 체크
//		@RequestMapping(value= "/logincheck.do", method=RequestMethod.POST)
//	    @ResponseBody
//	    public Map<Object, Object> MemberList(@RequestBody String m_id, @RequestBody String m_pwd) {
//			
//			int count = 0;
//			Map<Object, Object> map = new HashMap<Object, Object>();
//			
//			count = memberService.loginCheck(m_id, m_pwd);
//			map.put("cnt", count);
//			
//		 return map;
//	    }
	
	//멤버 체크
	@RequestMapping("/checkMember.do")
    @ResponseBody
    public Map<Object, Object> checkMember(@RequestBody String m_id) {
        
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = memberService.checkMember(m_id);
        map.put("cnt", count);
 
        return map;
    }
		//======================================================================
	@RequestMapping(value="/loginMember.do", method=RequestMethod.GET) 
	public String loginGet(MemberVO vo) {
		System.out.println(">> 겟방식");
			return "views/member/MemberLogin.jsp";
	}		
	//로그인
	@RequestMapping(value="/loginMember.do", method=RequestMethod.POST) //@RequestParam("m_id") String m_id, @RequestParam("m_pwd") String m_pwd,
	public String loginPost(MemberVO vo, HttpSession session) throws Exception {
		System.out.println(">> 포스트방식 로그인처리");
		/*String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");*/
		System.out.println("m_id : " + vo.getM_id());
		System.out.println("m_pwd : " + vo.getM_pwd());
		MemberVO vo2 = memberService.loginMember(vo, session);
		System.out.println("vo2.getM_id : " + vo2.getM_id());
		System.out.println("vo2.getM_pwd : " + vo2.getM_pwd());
		if (vo2.getM_id() != null && vo2.getM_id().equals(vo.getM_id()) && vo2.getM_pwd() != null && vo2.getM_pwd().equals(vo.getM_pwd())) {
			System.out.println("======있는 아이디======");
			session.setAttribute("m_id", vo.getM_id());
			return "/sub2.do";
		} else {
			System.out.println("=====없는 아이디=====");
			return "/loginMember.do";
		}
	}	
	
	
	//======================================================================
	//로그아웃
	@RequestMapping(value="/logoutMember.do")
	public String logoutMember(HttpSession session) throws Exception {
		memberService.logoutMember(session);
		return "/sub2.do";
	}
	//======================================================================
	@RequestMapping(value="/findIdMember.do", method=RequestMethod.GET)
	public String findId(MemberVO vo) {
		System.out.println("findPwd === get ");
		return "views/member/MemberFindId.jsp";
	}
	
	@RequestMapping(value="/findIdMember.do", method=RequestMethod.POST)
    public String sendEmailFindId (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
    	String m_name= (String) paramMap.get("m_name");
    	String m_phone= (String) paramMap.get("m_phone");
    	String m_tempId= (String) paramMap.get("m_tempId");
    	System.out.println("m_name : " + m_name);
    	System.out.println("m_phone : " + m_phone);
    	MemberVO vo= memberService.getId(paramMap);
    	
    	if(vo.getM_id() != null) {
    		email.setSubject(" [국봉월드] " + vo.getM_id()+"님 아이디 찾기 이메일입니다.");
    		email.setReceiver(m_tempId);
    		email.setContent("아이디는 [ "+ vo.getM_id()+ "]입니다.");
    		emailSender.SendEmail(email);
            return "/sub2.do";
    	}else {
    		//model.addAttribute("msg",1);
    		System.out.println("회원정보가 없습니다.");
    		return "/sub2.do";
    	}
        
    }
	
	//======================================================================
	
	
	
	@RequestMapping(value="/findPwdMember.do", method=RequestMethod.GET)
	public String findPwd(MemberVO vo) {
		System.out.println("findPwd === get ");
		return "views/member/MemberFindPwd.jsp";
	}
	@RequestMapping(value="/findPwdMember.do", method=RequestMethod.POST)
    public String sendEmailFindPwd (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
    	String m_id= (String) paramMap.get("m_id");
    	String m_phone= (String) paramMap.get("m_phone");
    	System.out.println("m_id : " + m_id);
    	System.out.println("m_phone : " + m_phone);
    	MemberVO vo= memberService.getPw(paramMap);
    	
    	if(vo.getM_pwd() != null) {
    		email.setSubject(" [국봉월드] " + m_id+"님 비밀번호 찾기 이메일입니다.");
    		email.setReceiver(m_id);
    		email.setContent("비밀번호는 [ "+vo.getM_pwd()+ "]입니다.");
    		emailSender.SendEmail(email);
            return "/sub2.do";
    	}else {
    		//model.addAttribute("msg",1);
    		System.out.println("회원정보가 없습니다.");
    		return "/sub2.do";
    	}
        
    }
    
	
	
	
}
