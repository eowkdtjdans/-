package com.spring.view.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.localAdvice.LocalAdviceService;
import com.spring.biz.localAdvice.LocalAdviceVO;
import com.spring.biz.profileImage.ProfileImageVO;
import com.spring.pagination.PagingVO;

@Controller
@SessionAttributes("key")
public class LocalAdviceController {
	HttpSession session;
	@Autowired
	private LocalAdviceService localAdviceService;
	
	//키값을 받아 localAdvice게시판 전체조회
	@RequestMapping(value="/getLocalAdviceList.do" , method=RequestMethod.POST)
	public String getLocalAdviceList(Model model, @ModelAttribute("key") String key, @RequestParam("cPage") String cPage, HttpSession session) {
		System.out.println("getLocalAdviceList.do로 왔습니다.");
		PagingVO p = new PagingVO();
		p.setNumPerPage(10);
		p.setPagePerBlock(10);
		int countLocalAdvice = localAdviceService.countLocalAdvice(key);
		p.setTotalRecord(countLocalAdvice);
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
		map.put("key", key);
		
		List<LocalAdviceVO> localAdviceList = localAdviceService.getLocalAdviceList(map);
		
		model.addAttribute("localAdviceList", localAdviceList);
		model.addAttribute("countLocalAdvice", countLocalAdvice);
		model.addAttribute("pvo", p);
		
		return "views/localAdvice/localAdvice.jsp";
	
	}
	
	
	
	
	//localAdvice게시판으로 단순 페이지이동
	@RequestMapping(value="/getLocalAdviceList.do", method=RequestMethod.GET)
	public String getLocalAdviceList() {
		System.out.println("겟로컬어드바이스리스트");
		return "views/localAdvice/localAdvice.jsp";
	}
	
	
	//localAdvice에서 게시글작성 버튼누르면 작성페이지로 이동
	//, method=RequestMethod.GET
	@RequestMapping(value="/writeLocalAdvice.do")
	public String moveWriteLocalAdvice() {
		return "views/localAdvice/insertLocalAdvice.jsp";
	}
	
	
	//여기에는 localAdvice게시글작성하고 저장버튼 눌렀을때
	//@RequestMapping(value="/insertLocalAdvice.do")
	@RequestMapping(value="insertLocalAdvice.do")
	public String moveInsertLocalAdvice(LocalAdviceVO vo, HttpSession session, @RequestParam("l_subject") String l_subject, @RequestParam("l_content") String l_content) {
		System.out.println("게시글 등록");
		
		String m_id = (String)session.getAttribute("m_id");	
		System.out.println(m_id);
		vo.setM_id(m_id);
		vo.setL_subject(l_subject);
		vo.setL_content(l_content);
		localAdviceService.insertLocalAdvice(vo);
		
		session.getAttribute("searchCondition");
		session.getAttribute("searchKeyword");
		return "/sub.do";
	}
	
	//로컬어드바이스 게시판에서 상세화면페이지로 이동
	@RequestMapping(value="/getLocalAdvice.do")
	public String moveGetLocalAdvice(LocalAdviceVO vo, ProfileImageVO pvo, Model model, @RequestParam("l_idx") String l_idx, @RequestParam("m_id") String m_id) {
		System.out.println("l_idx : " + l_idx);
		System.out.println("m_id :" + m_id);
		vo.setL_idx(Integer.parseInt(l_idx));
		LocalAdviceVO getLocalAdvice = localAdviceService.getLocalAdvice(vo);
		
		System.out.println("m_id :" + m_id);
		pvo.setM_id(m_id);
		ProfileImageVO getProfileImage = localAdviceService.getProfileImage(pvo);
		
		model.addAttribute("getLocalAdvice", getLocalAdvice);
		model.addAttribute("getProfileImage", getProfileImage);
		
		return "views/localAdvice/getLocalAdvice.jsp";
	}
	
	//localAdvice게시글 수정페이지로 페이지이동
	@RequestMapping(value="/updateLocalAdvice.do", method=RequestMethod.GET)
	public String updateLocalAdviceList(LocalAdviceVO vo, ProfileImageVO pvo, HttpSession session, Model model, @RequestParam("l_idx") String l_idx) {	
		System.out.println("/updateLocalAdvice.do 겟방식");
		String m_id = (String)session.getAttribute("m_id");
		System.out.println("m_id가무어니?" + m_id);
		System.out.println("l_idx가무어니?" + l_idx);
		vo.setL_idx(Integer.parseInt(l_idx));
		pvo.setM_id(m_id);
		
		LocalAdviceVO getLocalAdvice = localAdviceService.getLocalAdvice(vo);
		ProfileImageVO getProfileImage = localAdviceService.getProfileImage(pvo);
		
		model.addAttribute("getLocalAdvice", getLocalAdvice);
		model.addAttribute("getProfileImage", getProfileImage);
		return "views/localAdvice/updateLocalAdvice.jsp";
	}
	
	//localAdvice게시글 수정
	@RequestMapping(value="/updateLocalAdvice.do", method=RequestMethod.POST)
	public String updateLocalAdviceList(LocalAdviceVO vo, @RequestParam("l_subject") String l_subject,  @RequestParam("l_content") String l_content, @RequestParam("l_idx") String l_idx) {
		System.out.println("/updateLocalAdvice.do 포스트방식");
		System.out.println("옙");
		System.out.println("l_idx가몽미 : " + l_idx);
		
		localAdviceService.updateLocalAdvice(vo);
		
		return "/getLocalAdviceList.do";
	}
}
















