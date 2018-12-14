package com.spring.biz.localAdviceComment;

import java.util.List;


public interface LocalAdviceCommentService {
	//댓글 목록 전체 조회
	List<LocalAdviceCommentVO> getLocalAdviceCommentList(int l_idx);
	
	//댓글 입력
	void insertLocalAdviceComment(LocalAdviceCommentVO vo);
	
	//댓글 수정
	void updateLocalAdviceComment(LocalAdviceCommentVO vo);
	
}
