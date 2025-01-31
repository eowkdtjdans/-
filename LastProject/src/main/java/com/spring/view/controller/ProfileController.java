package com.spring.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.admin.AdminService;
import com.spring.biz.admin.UserAdminCommentVO;
import com.spring.biz.admin.UserAdminPostVO;
import com.spring.biz.admin.logLoginVO;
import com.spring.biz.host.HostVO;
import com.spring.biz.member.MemberVO;
import com.spring.biz.profile.ProfileService;
import com.spring.biz.profile.ProfileVO;
import com.spring.pagination.PagingVO;

@Controller
public class ProfileController {
		
	@Autowired
	private ProfileService profileService;
	
	@Autowired
	private AdminService adminService;
	
	public ProfileController() {
		System.out.println("=======프로필 컨트롤러 시작");
	}
	//=======================================
	//마이 프로필
	@RequestMapping(value="myProfile.do", method=RequestMethod.GET)
		public String myProfile(ProfileVO vo, HttpSession session) {		
		session.getAttribute("profile");
		return "views/profile/getProfile.jsp";
	}
	//내글===================================
	@RequestMapping(value="/myPost.do", method=RequestMethod.GET)
		public String myPost(Model model, HttpSession session, @RequestParam("cPage") String cPage,
				@RequestParam("m_id") String m_id) {
		int countPost = adminService.countPost(m_id);
		PagingVO p = new PagingVO();
		p.setNumPerPage(5);
		p.setPagePerBlock(5);
		p.setTotalRecord(countPost);
		p.setTotalPage();
		
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
				
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		map.put("m_id", m_id);
		
		List<logLoginVO> myPostList = adminService.getmyPostList(map);
		
		
		
		session.setAttribute("myPostList", myPostList);
		model.addAttribute("countPost", countPost);
		model.addAttribute("pvo", p);
		
		session.setAttribute("cPage", cPage);
		return "views/profile/ProfileMyPost.jsp";
	}
	//내글===================================
	@RequestMapping(value="/myPost2.do", method=RequestMethod.GET)
		public String myPost2(Model model, HttpSession session, @RequestParam("cPage") String cPage,
				@RequestParam("m_id") String m_id) {
		int countPost = adminService.countComment(m_id);
		PagingVO p = new PagingVO();
		p.setNumPerPage(5);
		p.setPagePerBlock(5);
		p.setTotalRecord(countPost);
		p.setTotalPage();
		System.out.println("아이디 : " + m_id);
		System.out.println("넘버퍼페이지 " + p.getNumPerPage());
		System.out.println(" 페이지퍼블록 " + p.getPagePerBlock());
		System.out.println("토탈레코드 " + p.getTotalRecord());
		System.out.println(" 토탈페이지 " + p.getTotalPage());
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
				System.out.println(" 엔드" + p.getEnd());
				System.out.println(" 비긴" + p.getBegin());
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
			System.out.println(" 비긴페이지" + p.getBeginPage());
			System.out.println(" 엔드페이지" + p.getEndPage());
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
			System.out.println(" 엔드페이지" + p.getEndPage());
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		map.put("m_id", m_id);
		List<logLoginVO> myPostList = adminService.getmyCommentList(map);
		
		
		
		System.out.println("============================");
		System.out.println(myPostList);
		System.out.println("============================");
		session.setAttribute("myPostList2", myPostList);
		model.addAttribute("countPost", countPost);
		session.setAttribute("pvo", p);
		
		session.setAttribute("cPage", cPage);
		return "views/profile/ProfileMyComment.jsp";
	}
	
	
	//=============================================================
	//프로필 등록
	
	@RequestMapping(value="/loginRecordList.do", method=RequestMethod.GET)
		public String loginRecord(Model model, logLoginVO vo,
				HttpSession session, @RequestParam("cPage") String cPage
				,@RequestParam("ll_id") String ll_id) {
		
		PagingVO p = new PagingVO();
		p.setNumPerPage(7);
		p.setPagePerBlock(5);
		int countLog = adminService.countLog(vo.getLl_id());
		System.out.println("countHost : " + countLog);
		p.setTotalRecord(countLog);
		p.setTotalPage();
		
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
				
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		map.put("ll_id", ll_id);
		List<logLoginVO> logLoginList = adminService.getLogLoginList(map);
		
		System.out.println("logLoginList: " + logLoginList);
		
		
		
		session.setAttribute("logLoginList", logLoginList);
		model.addAttribute("countLog", countLog);
		model.addAttribute("pvo", p);
		
		session.setAttribute("cPage", cPage);
		
		return "views/profile/loginRecordList.jsp";
	}
	
	
	@RequestMapping(value="insertProfile.do", method=RequestMethod.GET)
		public String insertProfileGet(ProfileVO vo, HttpSession session) {
			System.out.println("인서트 프로파일 ===========GET");
			session.getAttribute("profile");
			return "views/profile/ProfileInsert.jsp";
	}
	
	
	@RequestMapping(value="insertProfile.do", method=RequestMethod.POST) 
		public String isnertProfileGet(ProfileVO vo, Model model, @RequestParam("p_hobby") String p_hobby,
				@RequestParam("p_language") String p_language, @RequestParam("p_job") String p_job,
				@RequestParam("p_aboutme") String p_aboutme, @RequestParam("p_purpose") String p_purpose,
				@RequestParam("p_visitcountry") String p_visitcountry,  @RequestParam("m_id") String m_id, @RequestParam("p_route") String p_route, HttpSession session) throws Exception {
		System.out.println("인서트 프로파일 ============ POST");
		vo.setM_id(m_id);
		vo.setP_aboutme(p_aboutme);
		vo.setP_hobby(p_hobby);
		vo.setP_job(p_job);
		vo.setP_purpose(p_purpose);
		vo.setP_visitcountry(p_visitcountry);
		vo.setP_language(p_language);
		vo.setP_route(p_route);
		profileService.InsertProfile(vo);
		session.setAttribute("profile", vo);
		
		
		return "redirect:/myProfile.do";
	}
	
	
	
	
	//==============================================================
	//==프로필 수정
	@RequestMapping(value = "/modifyProfile.do", method=RequestMethod.GET)
	public String modifyProfileGet(ProfileVO vo, HttpSession session) {
		System.out.println("=======겟방식");
		session.getAttribute("profile");
		return "redirect:/myProfile.do";
		}	
	//
	@RequestMapping(value = "/modifyProfile.do",  method=RequestMethod.POST) 
	public String modifyProfilePost(ProfileVO vo, HttpSession session, @RequestParam("p_hobby") String p_hobby,
			@RequestParam("p_language") String p_language, @RequestParam("p_job") String p_job,
			@RequestParam("p_aboutme") String p_aboutme, @RequestParam("p_purpose") String p_purpose,
			@RequestParam("p_visitcountry") String p_visitcountry,  @RequestParam("m_id") String m_id, Model model, @RequestParam("p_route") String p_route) throws Exception {
		System.out.println("프로필 수정 시작");
		vo.setM_id(m_id);
		vo.setP_aboutme(p_aboutme);
		vo.setP_hobby(p_hobby);
		vo.setP_job(p_job);
		vo.setP_purpose(p_purpose);
		vo.setP_visitcountry(p_visitcountry);
		vo.setP_language(p_language);
		vo.setP_route(p_route);
		profileService.ModifyProfile(vo);
		profileService.getProfile2(vo, session);
		session.setAttribute("profile", vo);
		
		
		return "redirect:/myProfile.do";
	}
	
	@RequestMapping(value="/insetProfileJson.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> insertMessageJson(ProfileVO vo) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = profileService.insertProfileJson(vo);
		map.put("cnt", count);
		
		return map;
	}  

	
	
	
}
