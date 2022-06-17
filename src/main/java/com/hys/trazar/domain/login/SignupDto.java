package com.hys.trazar.domain.login;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class SignupDto {
	private String id;
	private String password;
	private String email;
	private String nickName;
	private String phoneNum;
	private String introduce;
	private String name;
	private String question;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime inserted;
}
