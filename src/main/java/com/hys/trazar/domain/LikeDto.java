package com.hys.trazar.domain;

import java.util.List;

import com.hys.trazar.domain.login.SignupDto;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class LikeDto {
	
	private int id;
	private int designBoardId;
	private String memberId;
	private int likeCheck;
	private int count;
	
	private List<SignupDto> likers;
}
