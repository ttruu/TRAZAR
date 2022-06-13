package com.hys.trazar.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hys.trazar.domain.ReviewDto;
import com.hys.trazar.mapper.ReviewMapper;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper mapper;
	
	public List<ReviewDto> getReviewByBoardId(int boardId) {
		
		return mapper.selectAllBoardId(boardId, null);
	}

	public boolean insertReview(ReviewDto dto) {

		return mapper.insertReview(dto) == 1;
	}
	
	public boolean updateReview(ReviewDto dto, Principal principal) {
		ReviewDto old = mapper.selectReviewById(dto.getId());
		
		if (old.getMemberId().equals(principal.getName())) {
			// 댓글 작성자와 로그인한 유저가 같을 때만 수정
			return mapper.updateReview(dto) == 1;
			
		} else {
			// 그렇지 않으면 return false;
			return false;
		}
		
	}

	public boolean deleteReview(int id, Principal principal) {
		
		ReviewDto old = mapper.selectReviewById(id);
		
		if (old.getMemberId().equals(principal.getName())) {
			// 댓글 작성자와 로그인한 유저가 같을 때만 수정
			return mapper.deleteReview(id) == 1;
			
		} else {
			// 그렇지 않으면 return false;
			return false;
		}
	}

	public List<ReviewDto> getReviewWithOwnByBoardId(int boardId, String memberId) {
		return mapper.selectAllBoardId(boardId, memberId);
	}


}
