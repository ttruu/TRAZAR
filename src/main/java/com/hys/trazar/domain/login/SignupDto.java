package com.hys.trazar.domain.login;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class SignupDto {
	private String id;
	private String password;
	private String email;
	private String nickName;
	private String phoneNum;
	private String introduce;
	private LocalDateTime inserted;
	private String name;
}
