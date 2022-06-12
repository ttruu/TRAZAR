package com.hys.trazar.mapper.login;

import com.hys.trazar.domain.login.SignupDto;

public interface SignupMapper {

	int createUser(SignupDto dto);

	int MemberIdCheck(String id);

	int MemberNickNameCheck(String nickName);

	int MemberEmailCheck(String email);

}
