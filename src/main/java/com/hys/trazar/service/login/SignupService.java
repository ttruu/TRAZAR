package com.hys.trazar.service.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hys.trazar.domain.login.SignupDto;
import com.hys.trazar.mapper.login.SignupMapper;

@Service
public class SignupService {
	
	@Autowired
	private SignupMapper mapper;

	public boolean createMember(SignupDto dto) {
		return mapper.createUser(dto)==1;
	}

	public boolean MemberIdCheck(String id) {
		return mapper.MemberIdCheck(id) > 0;
	}

	public boolean MemberNickNameCheck(String nickName) {
		return mapper.MemberNickNameCheck(nickName) > 0;
	}

	public boolean MemberEmailCheck(String email) {
		return mapper.MemberEmailCheck(email) > 0;
	}

}
