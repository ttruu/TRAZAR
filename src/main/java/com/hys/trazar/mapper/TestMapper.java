package com.hys.trazar.mapper;

import java.util.List;

import com.hys.trazar.domain.ReviewDto;

public interface TestMapper {
	
	List<ReviewDto> selectTest();

	ReviewDto getTest(int id);

	int updateTest(ReviewDto review);

	int deleteTest(int id);

	int insertTest(ReviewDto review);
}
