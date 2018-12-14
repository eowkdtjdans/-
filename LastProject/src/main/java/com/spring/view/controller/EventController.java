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

import com.spring.biz.event.EventService;
import com.spring.biz.event.EventVO;
import com.spring.pagination.PagingVO;

@Controller
@SessionAttributes({"key", "cPage"})
public class EventController {
	@Autowired
	private EventService eventService;
	
	public EventController() {
		System.out.println("Reach EventController!");
	}
	
	@RequestMapping(value = "/getEventList.do", method=RequestMethod.POST)
	public String getEventList (Model model, @ModelAttribute("key") String key, @RequestParam("cPage") String cPage) {
		System.out.println("getEventList() 실행");
		
		PagingVO p = new PagingVO();
		p.setNumPerPage(10);
		p.setPagePerBlock(3);
		int countEvent = eventService.countEvent(key);
		p.setTotalRecord(countEvent);
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
		System.out.println("EventController Map: " + map);
		
		List<EventVO> eventList = eventService.getEventList(map);
		
		model.addAttribute("eventList", eventList);
		model.addAttribute("countEvent", countEvent);
		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		
		return "/views/event/EventList.jsp";
	}
	
	@RequestMapping(value = "/getEventList.do", method=RequestMethod.GET)
	public String getEventList2 (Model model, @ModelAttribute("key") String key, @RequestParam("cPage") String cPage) {
		System.out.println("getEventList() 실행");
		
		PagingVO p = new PagingVO();
		p.setNumPerPage(10);
		p.setPagePerBlock(3);
		int countEvent = eventService.countEvent(key);
		p.setTotalRecord(countEvent);
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
		
		List<EventVO> eventList = eventService.getEventList(map);
		
		model.addAttribute("eventList", eventList);
		model.addAttribute("countEvent", countEvent);
		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		
		return "/views/event/EventList.jsp";
	}

}
