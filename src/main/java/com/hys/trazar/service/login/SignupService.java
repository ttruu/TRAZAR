package com.hys.trazar.service.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.domain.login.SignupDto;
import com.hys.trazar.mapper.DesignBoardMapper;
import com.hys.trazar.mapper.NoticeMapper;
import com.hys.trazar.mapper.RequestMapper;
import com.hys.trazar.mapper.ReviewMapper;
import com.hys.trazar.mapper.login.SignupMapper;

@Service
public class SignupService {

	@Autowired
	private SignupMapper mapper;
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Autowired
	private DesignBoardMapper boardMapper;
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired
	private RequestMapper requestMapper;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	

	public boolean createMember(SignupDto dto) {

		// 암호화 (엔코딩)
		String encodedPassword = passwordEncoder.encode(dto.getPassword());
		// 암호화 된 암호를 다시 세팅
		dto.setPassword(encodedPassword);

		// create member
		int cnt1 = mapper.createUser(dto);

		// 회원가입시 auth (기본 권한)으로 가입
		int cnt2 = mapper.createAuth(dto.getId(), "ROLE_USER");

		return cnt1 == 1 && cnt2 == 2;
	}

	// 중복확인 (id)
	public boolean MemberIdCheck(String id) {
		return mapper.MemberIdCheck(id) > 0;
	}

	// 중복확인 (nickName)
	public boolean MemberNickNameCheck(String nickName) {
		return mapper.MemberNickNameCheck(nickName) > 0;
	}

	// 중복확인 (email)
	public boolean MemberEmailCheck(String email) {
		return mapper.MemberEmailCheck(email) > 0;
	}
	
	// id로 멤버 db에서 불러옴
	public SignupDto selectMember(String id) {
		return mapper.selectMember(id);
	}

	// 회원가입 한 멤버 리스트
	public List<SignupDto> memberList() {
		return mapper.memberList();
	}

	// 정보 수정 할 수 있는 서비스
	public boolean modifyMember(SignupDto dto) {
		return mapper.modifyMember(dto) == 1;
	}

	// 닉네임 중복확인 코드
	public boolean nickNameModifyCheck(String nickName) {
		return mapper.nickNameModifyCheck(nickName) > 0;
	}

	// 이메일 중복확인 코드
	public boolean emailModifyCheck(String email) {
		return mapper.emailModifyCheck(email) > 0;
	}

	// 
	public boolean passwordUpdate(SignupDto dto) {
		
		/// 암호화
		String encodedPassword = passwordEncoder.encode(dto.getPassword());
		// 암호화 된 암호를 다시 세팅
		dto.setPassword(encodedPassword);
				
		return mapper.passwordUpdate(dto)==1;
	}

	@Transactional
	// 한번에 수행 되어야 하는 어노테이션
	public boolean removeMember(SignupDto dto) {
		// 댓글 삭제
		reviewMapper.deleteByMemberId(dto.getId());
		// 멤버가 쓴 게시글에 다른 사람이 단 댓글 삭제
		List<DesignBoardDto> boardList = boardMapper.listByMemberId(dto.getId());
		for (DesignBoardDto board : boardList) {
			reviewMapper.deleteByDesignBoardId(board.getId());
		}
		
		// 멤버가 쓴 게시글 삭제 
		boardMapper.deleteByMemberId(dto.getId());
		// 리퀘스트 게시글 삭제 
		requestMapper.deleteByMemberId(dto.getId());
		// 공지사항 삭제
		noticeMapper.deleteByMemberId(dto.getId());
		// 권한 테이블 삭제 
		mapper.deleteAuth(dto.getId());
		return mapper.deleteMember(dto.getId()) == 1;
	}
}
