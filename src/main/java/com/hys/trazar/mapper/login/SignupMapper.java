package com.hys.trazar.mapper.login;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.domain.login.SignupDto;

public interface SignupMapper {

	int createUser(SignupDto dto);

	int MemberIdCheck(String id);

	int MemberNickNameCheck(String nickName);

	int MemberEmailCheck(String email);
	
	int MemberPhoneNumCheck(String phoneNum);

	int createAuth(@Param("id")String id, @Param("auth")String auth);

	SignupDto selectMember(String id);

	List<SignupDto> memberList();

	int modifyMember(SignupDto dto);

	int nickNameModifyCheck(String nickName);

	int emailModifyCheck(String email);

	int passwordUpdate(SignupDto dto);

	int deleteMember(String id);

	void deleteAuth(String id);

	void findPassword(@Param("id")String id, @Param("pw")String pw);
	
	List<DesignBoardDto> DesignerlistByMemberId(String id);

	SignupDto findId(String email);

	SignupDto selectMember1(String email);

}
