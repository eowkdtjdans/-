package com.spring.biz.localAdviceComment;

import java.util.List;

import com.spring.biz.localAdvice.LocalAdviceVO;
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
	
	//ajax deletecomment
	void deleteLocalAdviceComment(LocalAdviceCommentVO vo);
	
	//게시글삭제할때 댓글내용전체삭제
	void deleteLocalAdviceCommentAll(LocalAdviceVO vo);
	
	//댓글페이징 처리를 위한 댓글 수 조회
	int countLocalAdviceComment(int l_idx);
	
	//대댓글을 위한 insert
	void insertdetdetComment(LocalAdviceCommentVO vo);
	
	//대댓글을 위한 select
	List<LocalAdviceCommentVO> selectdetdetComment(LocalAdviceCommentVO vo);
	
}
