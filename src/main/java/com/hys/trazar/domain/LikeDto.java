package com.hys.trazar.domain;

import java.util.List;

import com.hys.trazar.domain.login.SignupDto;

import lombok.Data;

@Data
public class LikeDto {
	
	private int likeId;
	private int designBoardId;
	private String memberId;
	private int likeCheck;
	
	private List<SignupDto> likers;
}
