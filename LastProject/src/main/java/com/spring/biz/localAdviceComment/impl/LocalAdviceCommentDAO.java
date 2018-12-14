package com.spring.biz.localAdviceComment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.localAdviceComment.LocalAdviceCommentVO;

@Repository("localAdviceCommentDAO")
public class LocalAdviceCommentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//댓글게시판 전체조회
	public List<LocalAdviceCommentVO> getLocalAdviceCommentList(int l_idx){		
		return mybatis.selectList("getLocalAdviceCommentList", l_idx);
	}
	
	//댓글입력
	public void insertLocalAdviceComment(LocalAdviceCommentVO vo) {
		mybatis.insert("insertLocalAdviceComment", vo);
	}
	
	//댓글수정
	public void updateLocalAdviceComment(LocalAdviceCommentVO vo) {
		mybatis.update("updateLocalAdviceComment", vo);
	}
}
