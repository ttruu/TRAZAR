package com.hys.trazar.mapper;

import java.util.List;

import com.hys.trazar.domain.LikeDto;

public interface LikeMapper {
	
	// 좋아요 수 설정 - setLikeCount
	public int setLikeCount(int designBoardId);

	// 좋아요 수 얻어오기 - getLikeCount
	public int getLikeCount(int designBoardId);
	
	// 좋아요 사용자 목록 레코드 만들기 - insertLikers
	public void insertLikers(int designBoardId, int memberId);
	
	// 사용자가 좋아한 게시물 레코드 불러오기 - getLikersPicked
	List<LikeDto> getLikersPicked(int designBoardId);





}
