package com.spring.biz.eventComment.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.event.impl.EventDAO;
import com.spring.biz.eventComment.EventCommentService;

@Service("eventCommentService")
public class EventCommentServiceImpl implements EventCommentService {
	@Autowired
	private EventCommentDAO eventCommentDAO;
	
}
