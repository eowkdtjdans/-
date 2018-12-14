package com.spring.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.host.HostService;
import com.spring.biz.host.HostVO;
import com.spring.pagination.PagingVO;

@Controller
@SessionAttributes({"key", "cPage"})
public class HostController {
	@Autowired
	private HostService hostService;
	
	public HostController() {
		System.out.println("HostController 실행");
	}
	
	@RequestMapping(value="/getHostList.do", method=RequestMethod.POST)
	public String getTravelersList(Model model, @ModelAttribute("key") String key, @RequestParam("cPage") String cPage) {
		System.out.println(">> 글목록 조회 처리(getHostList) - POST");
		System.out.println("key: " + key);
		
		PagingVO p = new PagingVO();
		p.setNumPerPage(10);
		p.setPagePerBlock(3);
		int countHost = hostService.countHost(key);
		p.setTotalRecord(countHost);
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
		
		List<HostVO> hostList = hostService.getHostList(key);
		System.out.println("hostList: " + hostList);
		
		model.addAttribute("hostList", hostList);
		model.addAttribute("countHost", countHost);
		model.addAttribute("pvo", p);
		
		model.addAttribute("cPage", cPage);
		
		return "views/host/Host.jsp";
	}
	
	@RequestMapping(value="/getHostList.do", method=RequestMethod.GET)
	public String getTravelersList2(Model model, @ModelAttribute("key") String key, @RequestParam("cPage") String cPage) {
		System.out.println(">> 글목록 조회 처리(getHostList) - POST");
		
		PagingVO p = new PagingVO();
		p.setNumPerPage(10);
		p.setPagePerBlock(3);
		int countHost = hostService.countHost(key);
		p.setTotalRecord(countHost);
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
		
		List<HostVO> hostList = hostService.getHostList(key);
		System.out.println("hostList: " + hostList);
		
		model.addAttribute("hostList", hostList);
		model.addAttribute("countHost", countHost);
		model.addAttribute("pvo", p);
		
		model.addAttribute("cPage", cPage);
		
		return "views/host/Host.jsp";
	}
}
