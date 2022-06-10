package com.hys.trazar.mapper;

import java.util.List;

import com.hys.trazar.domain.ReviewDto;

public interface ReviewMapper {

	int insertReview(ReviewDto dto);

	List<ReviewDto> selectReply();

}
