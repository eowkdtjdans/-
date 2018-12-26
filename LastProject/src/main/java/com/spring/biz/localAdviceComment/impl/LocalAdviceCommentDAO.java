package com.spring.biz.localAdviceComment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.localAdvice.LocalAdviceVO;
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

	public int updateLocalAdivceCommentJson(LocalAdviceCommentVO vo) {
		return mybatis.selectOne("updateLocalAdviceCommentJson", vo);
	}
	
	//댓글삭제 json
	public void deleteLocalAdviceComment(LocalAdviceCommentVO vo) {
		mybatis.delete("deleteLocalAdviceComment", vo);
	}
	
	//게시글삭제할시 먼저 댓글전체삭제
	public void deleteLocalAdviceCommentAll(LocalAdviceVO vo) {
		mybatis.delete("deleteLocalAdviceCommentAll", vo);
	}
	
	//댓글페이징 처리를 위한 댓글 수 조회
	public int countLocalAdviceComment(int l_idx) {
		return mybatis.selectOne("countLocalAdviceComment", l_idx);
	}
	
	//대댓글을 위한 insert
	public void insertdetdetComment(LocalAdviceCommentVO vo) {
		mybatis.insert("insertdetdetComment", vo);
	}
	
	//대댓글을 위한 select
	public List<LocalAdviceCommentVO> selectdetdetComment(LocalAdviceCommentVO vo) {
		return mybatis.selectList("selectdetdetComment", vo);
	}
	
}








