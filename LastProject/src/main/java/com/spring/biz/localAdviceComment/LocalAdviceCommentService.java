package com.spring.biz.localAdviceComment;

import java.util.List;

import com.spring.biz.member.MemberVO;


public interface LocalAdviceCommentService {
	//댓글 목록 전체 조회
	List<LocalAdviceCommentVO> getLocalAdviceCommentList(int l_idx);
	
	//댓글 입력
	void insertLocalAdviceComment(LocalAdviceCommentVO vo);
	
	//댓글 수정
	void updateLocalAdviceComment(LocalAdviceCommentVO vo);
	
	//ajax selectone카운트주기
	int updateLocalAdviceCommentJson(LocalAdviceCommentVO vo);
	
}
