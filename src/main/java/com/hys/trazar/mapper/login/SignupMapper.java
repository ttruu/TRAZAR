package com.hys.trazar.mapper.login;

import org.apache.ibatis.annotations.Param;

import com.hys.trazar.domain.login.SignupDto;

public interface SignupMapper {

	int createUser(SignupDto dto);

	int MemberIdCheck(String id);

	int MemberNickNameCheck(String nickName);

	int MemberEmailCheck(String email);

	int createAuth(@Param("id")String id, @Param("auth")String auth);

	SignupDto memberModify(String id);

}
