package com.hys.trazar.service.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hys.trazar.domain.login.SignupDto;
import com.hys.trazar.mapper.login.SignupMapper;

@Service
public class SignupService {

	@Autowired
	private SignupMapper mapper;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	public boolean createMember(SignupDto dto) {

		// 암호화
		String encodedPassword = passwordEncoder.encode(dto.getPassword());
		// 암호화 된 암호를 다시 세팅
		dto.setPassword(encodedPassword);

		// create member
		int cnt1 = mapper.createUser(dto);

		// insert auth (기본 권한)
		int cnt2 = mapper.createAuth(dto.getId(), "ROLE_USER");

		return cnt1 == 1 && cnt2 == 2;
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

	public SignupDto selectMember(String id) {
		return mapper.selectMember(id);
	}

	public List<SignupDto> memberList() {
		return mapper.memberList();
	}

	public boolean modifyMember(SignupDto dto) {

		/// 암호화
		String encodedPassword = passwordEncoder.encode(dto.getPassword());
		// 암호화 된 암호를 다시 세팅
		dto.setPassword(encodedPassword);
		
		return mapper.modifyMember(dto) == 1;
	}

	public boolean nickNameModifyCheck(String nickName) {
		return mapper.nickNameModifyCheck(nickName) > 0;
	}

	public boolean emailModifyCheck(String email) {
		return mapper.emailModifyCheck(email) > 0;
	}

//	public boolean deleteMember(SignupDto dto) {
//	}

}
