package com.spring.biz.localAdviceComment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.localAdvice.LocalAdviceVO;
import com.spring.biz.localAdviceComment.LocalAdviceCommentService;
import com.spring.biz.localAdviceComment.LocalAdviceCommentVO;

@Service("localAdviceCommentService")
public class LocalAdviceCommentServiceImpl implements LocalAdviceCommentService {
	@Autowired
	private LocalAdviceCommentDAO localAdviceCommentDAO;
	
	public LocalAdviceCommentServiceImpl() {
		System.out.println("LocalAdviceCommentServiceImpl 객체 생성");
	}
	
	@Override
	public List<LocalAdviceCommentVO> getLocalAdviceCommentList(int l_idx) {
		return localAdviceCommentDAO.getLocalAdviceCommentList(l_idx);
	}

	@Override
	public void insertLocalAdviceComment(LocalAdviceCommentVO vo) {
		localAdviceCommentDAO.insertLocalAdviceComment(vo); 		
	}

	@Override
	public void updateLocalAdviceComment(LocalAdviceCommentVO vo) {
		localAdviceCommentDAO.updateLocalAdviceComment(vo);		
	}

	@Override
	public int updateLocalAdviceCommentJson(LocalAdviceCommentVO vo) {
		return localAdviceCommentDAO.updateLocalAdivceCommentJson(vo);
		
	}

	@Override
	public void deleteLocalAdviceComment(LocalAdviceCommentVO vo) {
		localAdviceCommentDAO.deleteLocalAdviceComment(vo);
		
	}

	@Override
	public void deleteLocalAdviceCommentAll(LocalAdviceVO vo) {
		localAdviceCommentDAO.deleteLocalAdviceCommentAll(vo);
		
	}

}
