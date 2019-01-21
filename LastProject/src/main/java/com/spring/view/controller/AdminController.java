package com.spring.view.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.admin.AdminCntVO;
import com.spring.biz.admin.AdminService;
import com.spring.biz.admin.UserAdminCommentVO;
import com.spring.biz.admin.UserAdminPostVO;
import com.spring.biz.admin.UserAdminViewVO;
import com.spring.biz.event.EventService;
import com.spring.biz.event.EventVO;
import com.spring.biz.eventImage.EventImageService;
import com.spring.biz.eventImage.EventImageVO;
import com.spring.biz.localAdvice.LocalAdviceVO;
import com.spring.biz.member.Email;
import com.spring.biz.member.EmailSender;
import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;
import com.spring.biz.message.MessageRecieveVO;
import com.spring.biz.message.MessageService;
import com.spring.biz.profileImage.FileUploadService;
import com.spring.biz.profileImage.ProfileImageService;
import com.spring.biz.profileImage.ProfileImageVO;

@Controller
@SessionAttributes({"userAdminList", "userAdminViewVO", "userAdminPostList", "userAdminCommentList", "userAdminImageSelect", "eventAdminList", "adminCnt", "userAdminImageSelect", "eventVO", "eventImageList"})
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private FileUploadService fileUploadService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private Email email;
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private ProfileImageService profileImageService;
	@Autowired
	private EventService eventService;
	@Autowired
	private EventImageService eventImageService;
	@Autowired
	private MemberService memberService;
	private static final String PREFIX_URL = "/views/img/upload/";
	private static final String SAVE_PATH = "C:/MyStudy/GIT/gukbong/LastProject/src/main/webapp/views/img/upload/";
	private static final String SERVER_SAVE_PATH = "C:/MyStudy/GIT/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/LastProject/views/img/upload/";
	
	
	@RequestMapping(value="/Admin.do")
	public String AdminMain(HttpServletRequest request, MemberVO vo, Model model, HttpSession session) throws Exception {
		System.out.println("AdminController의 사이트 조회수 누적 메소드");
		MemberVO vo2 = memberService.loginMember(vo, session);
		AdminCntVO adminCnt = adminService.adminCnt();
		
		session.setAttribute("member", vo2);
		model.addAttribute("adminCnt", adminCnt);
		
		return "redirect:/views/admin/testAdmin.jsp";
	}
	
	@RequestMapping(value="/logVisit.do", method=RequestMethod.GET)
	public String LogVisit(HttpServletRequest request) {
		System.out.println("AdminController의 사이트 조회수 누적 메소드");
		
		String lv_ip = request.getParameter("lv_ip");
		String lv_country = request.getParameter("lv_country");
		String lv_browser = request.getParameter("lv_browser");
		
		Map<String, String> lvMap = new HashMap<String, String>();
		lvMap.put("lv_ip", lv_ip);
		lvMap.put("lv_country", lv_country);
		lvMap.put("lv_browser", lv_browser);
		
		System.out.println("ip: " + lv_ip);
		System.out.println("country: " + lv_country);
		System.out.println("browser: " + lv_browser);
		
		adminService.logVisit(lvMap);
		
		return "redirect:/views/test.jsp";
	}
	
	@RequestMapping(value="/logLogin.do", method=RequestMethod.GET)
	public String LogLogin(HttpServletRequest request) {
		System.out.println("AdminController의 로그인 로그 메소드");
		
		String ll_id = request.getParameter("ll_id");
		String ll_ip = request.getParameter("ll_ip");
		String ll_country = request.getParameter("ll_country");
		String ll_device = request.getParameter("ll_device");
		String ll_result = request.getParameter("ll_result");
		
		Map<String, String> llMap = new HashMap<String, String>();
		llMap.put("ll_id", ll_id);
		llMap.put("ll_ip", ll_ip);
		llMap.put("ll_country", ll_country);
		llMap.put("ll_device", ll_device);
		llMap.put("ll_result", ll_result);
		
		
		adminService.logLogin(llMap);
		
		return "redirect:/loginMember.do";
	}
	
	@RequestMapping(value="/userAdmin.do")
	public String userAdminList(Model model) {
		List<MemberVO> list = null;
		
		list = adminService.userAdminList();
		
		model.addAttribute("userAdminList", list);
		return "redirect:/views/admin/pages/tables/userAdmin.jsp";
	}
	
	@RequestMapping(value="/localAdviceAdminList.do")
	public String localAdviceList(HttpSession session) {
		List<LocalAdviceVO> AdminlocalAdviceList = adminService.localAdviceAdminList();
		System.out.println(AdminlocalAdviceList);
		session.setAttribute("AdminlocalAdviceList", AdminlocalAdviceList);
		return "redirect:/views/admin/pages/tables/localAdviceList.jsp";
	}
	
	
	@RequestMapping(value="/adminGetReceiveMessageList.do")
	public String getAdminGetReceiveMessageList(MessageRecieveVO vo, HttpSession session) {
			vo.setReceive_receiver("admin");
			System.out.println("메세지리스트 컨트롤러 옴");
			System.out.println(vo.getReceive_receiver());
			List<MessageRecieveVO> messageList = messageService.getAdminReceiveMessageList(vo);
			session.setAttribute("adminMessageList", messageList);
		return "redirect:/views/admin/pages/tables/messageAdmin.jsp";	
	}
	
	
	@RequestMapping(value="/adminMessageGet.do")
	public String adminMessageGet(MessageRecieveVO vo,  Model model, HttpSession session, @RequestParam("receive_idx") int receive_idx) {
		session.setAttribute("adminMessage", messageService.getReceiveMessage(vo));
		vo.setReceive_idx(receive_idx);
		messageService.readRecieveMessage(vo);
			
		return "redirect:/views/admin/pages/tables/adminMessageGet.jsp";
	}
	
	@RequestMapping(value="/adminSendEmail.do", method=RequestMethod.POST)
    public String sendEmailFindId (@RequestParam("message_receiver") String message_receiver
    		, @RequestParam("message_title") String message_title, 
    		@RequestParam("message_content") String message_content) throws Exception {
    	
    		email.setSubject(message_title);
    		email.setReceiver(message_receiver);
    		email.setContent(message_content);
    		emailSender.SendEmail(email);
            return "redirect:/adminGetReceiveMessageList.do";
    	}
	
	@RequestMapping(value="/userAdminView.do")
	public String userAdminView(Model model, HttpServletRequest request) {
		UserAdminViewVO uvo = null;
		
		List<UserAdminPostVO> uplist = null;
		List<UserAdminCommentVO> upclist = null;
		List<ProfileImageVO> uilist = null;
		
		String m_id = request.getParameter("m_id");
		
		uvo = adminService.userAdminView(m_id);
		uplist = adminService.userAdminPostList(m_id);
		upclist = adminService.userAdminCommentList(m_id);
		uilist = profileImageService.getProfileImageList(m_id);
		
		model.addAttribute("userAdminViewVO", uvo);
		model.addAttribute("userAdminPostList", uplist);
		model.addAttribute("userAdminCommentList", upclist);
		model.addAttribute("userAdminImageSelect", uilist);
		
		return "redirect:/views/admin/pages/examples/userAdminView.jsp";
	}
	
	@RequestMapping(value="/eventAdmin.do")
	public String eventAdminList(Model model) {
		List<EventVO> list = null;
		
		list = adminService.eventAdminList();
		System.out.println(list);
		model.addAttribute("eventAdminList", list);
		return "redirect:/views/admin/pages/tables/eventAdmin.jsp";
	}
	

	
	@RequestMapping(value="/insertEvent.do", method=RequestMethod.GET)
	public String insertEvent(Model model) {
		
		return "redirect:/views/admin/insertEvent.jsp";
	}
	
	@RequestMapping(value="/insertEvent.do", method=RequestMethod.POST)
	public String insertEventPost(Model model,
			@RequestParam("e_name") String e_name,
			@RequestParam("e_content") String e_content,
			@RequestParam("e_startdate") String e_startdate,
			@RequestParam("e_enddate") String e_enddate,
			@RequestParam("e_address") String e_address,
			@RequestParam("lat") String lat,
			@RequestParam("lng") String lng,
			@RequestParam("e_region") String e_region,
			@RequestParam(value="e_tag", required=false) String e_tag,
			@RequestParam(value="e_size1", required=false) String e_size1,
			@RequestParam(value="e_size2", required=false) String e_size2,
			@RequestParam(value="e_size3", required=false) String e_size3,
			@RequestParam(value="e_size4", required=false) String e_size4,
			@RequestParam(value="e_size5", required=false) String e_size5,
			@RequestParam(value="e_size6", required=false) String e_size6,
			@RequestParam(value="e_size7", required=false) String e_size7,
			@RequestParam(value="e_size8", required=false) String e_size8,
			@RequestParam(value="e_size9", required=false) String e_size9,
			@RequestParam(value="e_size10", required=false) String e_size10,
			@RequestParam(value="file1", required=false) MultipartFile e_img1,
			@RequestParam(value="file2", required=false) MultipartFile e_img2,
			@RequestParam(value="file3", required=false) MultipartFile e_img3,
			@RequestParam(value="file4", required=false) MultipartFile e_img4,
			@RequestParam(value="file5", required=false) MultipartFile e_img5,
			@RequestParam(value="file6", required=false) MultipartFile e_img6,
			@RequestParam(value="file7", required=false) MultipartFile e_img7,
			@RequestParam(value="file8", required=false) MultipartFile e_img8,
			@RequestParam(value="file9", required=false) MultipartFile e_img9,
			@RequestParam(value="file10", required=false) MultipartFile e_img10) throws ParseException {
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startdate = transFormat.parse(e_startdate);
		Date enddate = transFormat.parse(e_enddate);
		
		EventVO eventVO = new EventVO();
		eventVO.setE_name(e_name);
		eventVO.setE_content(e_content);
		eventVO.setE_startdate(startdate);
		eventVO.setE_enddate(enddate);
		eventVO.setE_address(e_address);
		eventVO.setLat(Double.parseDouble(lat));
		eventVO.setLng(Double.parseDouble(lng));
		eventVO.setE_region(e_region);
		eventVO.setE_tag(e_tag);
		
		adminService.insertEvent(eventVO);
		
		if(e_img1 != null) {
			String saveName = fileUploadService.fileUpload(e_img1);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "1");
			eventImgMap.put("e_size", e_size1);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img2 != null) {
			String saveName = fileUploadService.fileUpload(e_img2);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "2");
			eventImgMap.put("e_size", e_size2);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img3 != null) {
			String saveName = fileUploadService.fileUpload(e_img3);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "3");
			eventImgMap.put("e_size", e_size3);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img4 != null) {
			String saveName = fileUploadService.fileUpload(e_img4);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "4");
			eventImgMap.put("e_size", e_size4);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img5 != null) {
			String saveName = fileUploadService.fileUpload(e_img5);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "5");
			eventImgMap.put("e_size", e_size5);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img6 != null) {
			String saveName = fileUploadService.fileUpload(e_img6);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "6");
			eventImgMap.put("e_size", e_size6);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img7 != null) {
			String saveName = fileUploadService.fileUpload(e_img7);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "7");
			eventImgMap.put("e_size", e_size7);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img8 != null) {
			String saveName = fileUploadService.fileUpload(e_img8);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "8");
			eventImgMap.put("e_size", e_size8);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img9 != null) {
			String saveName = fileUploadService.fileUpload(e_img9);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "9");
			eventImgMap.put("e_size", e_size9);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertEventImg(eventImgMap);
		}
		if(e_img10 != null) {
			String saveName = fileUploadService.fileUpload(e_img10);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "10");
			eventImgMap.put("e_size", e_size10);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertEventImg(eventImgMap);
		}
		
		return "redirect:/eventAdmin.do";
	}
	
	@RequestMapping(value="/adminDeleteProfileImage.do", method=RequestMethod.GET)
	public String adminDeleteProfileImage(@RequestParam("m_id") String m_id, @RequestParam("p_route") String p_route) {
		Map<String, String> delParam = new HashMap<String, String>();
		delParam.put("m_id", m_id);
		delParam.put("p_route", p_route);
		
		adminService.adminDeleteProfileImage(delParam);
		
		return "redirect:/userAdminView.do?m_id="+m_id;
	}
	
	@RequestMapping(value="/modifyEvent.do", method=RequestMethod.GET)
	public String modifyEvent(Model model, @RequestParam("e_idx") int e_idx) {
		EventVO eventVO = eventService.getEvent(e_idx);
		List<EventImageVO> list = eventImageService.getEventImageList(e_idx);
		
		model.addAttribute("eventVO", eventVO);
		model.addAttribute("eventImageList", list);
		
		return "redirect:/views/admin/modifyEvent.jsp";
	}
	
	@RequestMapping(value = "/deleteEvent.do")
	public String deleteEvent(@RequestParam("e_idx") int e_idx) {
		adminService.deleteEvent(e_idx);
		
		return "redirect:/eventAdmin.do";				
	}
	
	
	@RequestMapping(value="/existFileRemove.do", method=RequestMethod.GET)
	@ResponseBody
	public String existFileRemove(@RequestParam("e_idx") String e_idx, @RequestParam("e_realpath") String e_realpath, @RequestParam("e_server") String e_server, @RequestParam("e_img") String e_img) {
		String msg = "";
		System.out.println(e_idx);
		System.out.println(e_realpath);
		System.out.println(e_server);
		System.out.println(e_img);
		
		File file = new File(e_realpath);
		File file2 = new File(e_server);
		
		Map<String,String> delImgMap = new HashMap<String,String>();
		delImgMap.put("e_idx", e_idx);
		delImgMap.put("e_img", e_img);
		
		if(file.exists()) {
			if(file.delete()) {
				msg = "Remove Success";
			} else {
				msg = "Remove Fail";
			}
		} else {
			msg = "None Exists";
		}
		
		if(file2.exists()) {
			if(file2.delete()) {
				msg = "Server Remove Success";
				System.out.println("delImgMap: " + delImgMap);
				adminService.deleteEventImg(delImgMap);
			} else {
				msg = "Server Remove Fail";
			}
		} else {
			msg = "Server None Exists";
		}
		
		return msg;
	}
	
	@RequestMapping(value="/modifyEvent.do", method=RequestMethod.POST)
	public String modifyEvent(Model model,
			@RequestParam("e_idx") String e_idx,
			@RequestParam("e_name") String e_name,
			@RequestParam("e_content") String e_content,
			@RequestParam("e_startdate") String e_startdate,
			@RequestParam("e_enddate") String e_enddate,
			@RequestParam("e_address") String e_address,
			@RequestParam("lat") String lat,
			@RequestParam("lng") String lng,
			@RequestParam("e_region") String e_region,
			@RequestParam(value="e_tag", required=false) String e_tag,
			@RequestParam(value="e_size1", required=false) String e_size1,
			@RequestParam(value="e_size2", required=false) String e_size2,
			@RequestParam(value="e_size3", required=false) String e_size3,
			@RequestParam(value="e_size4", required=false) String e_size4,
			@RequestParam(value="e_size5", required=false) String e_size5,
			@RequestParam(value="e_size6", required=false) String e_size6,
			@RequestParam(value="e_size7", required=false) String e_size7,
			@RequestParam(value="e_size8", required=false) String e_size8,
			@RequestParam(value="e_size9", required=false) String e_size9,
			@RequestParam(value="e_size10", required=false) String e_size10,
			@RequestParam(value="file1", required=false) MultipartFile e_img1,
			@RequestParam(value="file2", required=false) MultipartFile e_img2,
			@RequestParam(value="file3", required=false) MultipartFile e_img3,
			@RequestParam(value="file4", required=false) MultipartFile e_img4,
			@RequestParam(value="file5", required=false) MultipartFile e_img5,
			@RequestParam(value="file6", required=false) MultipartFile e_img6,
			@RequestParam(value="file7", required=false) MultipartFile e_img7,
			@RequestParam(value="file8", required=false) MultipartFile e_img8,
			@RequestParam(value="file9", required=false) MultipartFile e_img9,
			@RequestParam(value="file10", required=false) MultipartFile e_img10) throws ParseException {
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startdate = transFormat.parse(e_startdate);
		Date enddate = transFormat.parse(e_enddate);
		
		EventVO eventVO = new EventVO();
		eventVO.setE_idx(Integer.parseInt(e_idx));
		eventVO.setE_name(e_name);
		eventVO.setE_content(e_content);
		eventVO.setE_startdate(startdate);
		eventVO.setE_enddate(enddate);
		eventVO.setE_address(e_address);
		eventVO.setLat(Double.parseDouble(lat));
		eventVO.setLng(Double.parseDouble(lng));
		eventVO.setE_region(e_region);
		eventVO.setE_tag(e_tag);
		
		adminService.modifyEvent(eventVO);
		
		if(e_img1 != null) {
			String saveName = fileUploadService.fileUpload(e_img1);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_idx", e_idx);
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "1");
			eventImgMap.put("e_size", e_size1);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertModifyEventImg(eventImgMap);
		}
		if(e_img2 != null) {
			String saveName = fileUploadService.fileUpload(e_img2);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_idx", e_idx);
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "2");
			eventImgMap.put("e_size", e_size2);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertModifyEventImg(eventImgMap);
		}
		if(e_img3 != null) {
			String saveName = fileUploadService.fileUpload(e_img3);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_idx", e_idx);
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "3");
			eventImgMap.put("e_size", e_size3);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertModifyEventImg(eventImgMap);
		}
		if(e_img4 != null) {
			String saveName = fileUploadService.fileUpload(e_img4);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_idx", e_idx);
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "4");
			eventImgMap.put("e_size", e_size4);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertModifyEventImg(eventImgMap);
		}
		if(e_img5 != null) {
			String saveName = fileUploadService.fileUpload(e_img5);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_idx", e_idx);
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "5");
			eventImgMap.put("e_size", e_size5);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertModifyEventImg(eventImgMap);
		}
		if(e_img6 != null) {
			String saveName = fileUploadService.fileUpload(e_img6);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_idx", e_idx);
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "6");
			eventImgMap.put("e_size", e_size6);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertModifyEventImg(eventImgMap);
		}
		if(e_img7 != null) {
			String saveName = fileUploadService.fileUpload(e_img7);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_idx", e_idx);
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "7");
			eventImgMap.put("e_size", e_size7);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertModifyEventImg(eventImgMap);
		}
		if(e_img8 != null) {
			String saveName = fileUploadService.fileUpload(e_img8);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_idx", e_idx);
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "8");
			eventImgMap.put("e_size", e_size8);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertModifyEventImg(eventImgMap);
		}
		if(e_img9 != null) {
			String saveName = fileUploadService.fileUpload(e_img9);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_idx", e_idx);
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "9");
			eventImgMap.put("e_size", e_size9);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertModifyEventImg(eventImgMap);
		}
		if(e_img10 != null) {
			String saveName = fileUploadService.fileUpload(e_img10);
			String url = PREFIX_URL + saveName;
			String realPath = SAVE_PATH + saveName;
			String serverPath = SERVER_SAVE_PATH + saveName;
			
			Map<String, String> eventImgMap = new HashMap<String, String>();
			eventImgMap.put("e_idx", e_idx);
			eventImgMap.put("e_img", url);
			eventImgMap.put("e_main", "10");
			eventImgMap.put("e_size", e_size10);
			eventImgMap.put("e_realpath", realPath);
			eventImgMap.put("e_server", serverPath);
			
			adminService.insertModifyEventImg(eventImgMap);
		}
		
		return "redirect:/eventAdmin.do";
	}
}
