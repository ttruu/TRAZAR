package com.hys.trazar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hys.trazar.domain.ReviewDto;

public interface ReviewMapper {
	
	int insertReview(ReviewDto dto);

	List<ReviewDto> selectAllDesignBoardId(@Param("designBoardId") int designBoardId, @Param("memberId") String memberId);

	int updateReview(ReviewDto dto);

	int deleteReview(int id);

	void deleteByDesignBoardId(int boardId);

	ReviewDto selectReviewById(int id);

	void deleteByMemberId(String memberId);
}
