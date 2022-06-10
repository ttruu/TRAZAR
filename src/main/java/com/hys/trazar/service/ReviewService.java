package com.hys.trazar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hys.trazar.domain.ReviewDto;
import com.hys.trazar.mapper.ReviewMapper;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper mapper;

	public boolean insertReview(ReviewDto dto) {
		
		// 댓글 등록
		int cnt = mapper.insertReview(dto);
		
		return cnt == 1; 
	}

}
