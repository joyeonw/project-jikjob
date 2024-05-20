package com.green.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.community.domain.CommunityVo;
import com.green.community.mapper.CommunityMapper;



@RestController
@RequestMapping("/Api")
public class CommentController {
	
	@Autowired
	private CommunityMapper communityMapper;
	
	// RESTful API로 댓글 생성 처리
	// http://localhost:7777/Api/Comment/1/comments
	@PostMapping("/Comment/{ccomu_bno}/commentCreate")
	public List<CommunityVo> commentCreate(
			@PathVariable int ccomu_bno,
				@RequestBody CommunityVo communityVo
			) {
		
		// 댓글 생성
		communityMapper.insertComment(communityVo);
		
	    // 댓글 목록 조회 
		List<CommunityVo> commentList = communityMapper.getCBoardCommentList(communityVo);
		
		return commentList;
	}
	
	@PostMapping("/Comment/{ccomu_bno}/{ccomm_id}/commentLike")
	public ResponseEntity<String> commentLike (
			@PathVariable int ccomm_id,
			@PathVariable int ccomu_bno,
			@RequestBody CommunityVo communityVo)	{
		// 댓글 번호와 게시글 번호 설정
		communityVo.setCcomu_bno(ccomu_bno);
		communityVo.setCcomm_id(ccomm_id);
		// 현재 좋아요 상태 확인
	    int isLiked = communityMapper.isCommentLiked(communityVo);
	    System.out.println("=======================isLiked" + isLiked);

	    if (isLiked != 0) {
	        // 이미 좋아요가 되어 있다면 좋아요 취소
	        communityMapper.removeCommentLike(communityVo);
	        communityMapper.decrementLikeCount(communityVo);
	        return ResponseEntity.ok("좋아요가 취소되었습니다");
	    } else {
	        // 좋아요가 되어 있지 않다면 좋아요 추가
	        communityMapper.addCommentLike(communityVo);
	        communityMapper.incrementLikeCount(communityVo);
	        return ResponseEntity.ok("좋아요가 추가되었습니다");
	    }
	}
}
