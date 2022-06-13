package com.hys.trazar.mapper;

import java.util.List;

import com.hys.trazar.domain.ReviewDto;

public interface ReviewMapper {

	int insertReview(ReviewDto dto);

	List<ReviewDto> selectReview();

	int updateReview(ReviewDto dto);

	int removeReview(ReviewDto dto);

}
