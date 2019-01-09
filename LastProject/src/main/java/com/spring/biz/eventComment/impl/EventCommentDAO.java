package com.spring.biz.eventComment.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("eventCommentDAO")
public class EventCommentDAO {
	@Autowired   
	private SqlSessionTemplate mybatis;
	
}
