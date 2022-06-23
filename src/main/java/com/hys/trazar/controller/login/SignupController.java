package com.hys.trazar.controller.login;

import java.security.Principal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hys.trazar.domain.login.SignupDto;
import com.hys.trazar.mapper.login.SignupMapper;
import com.hys.trazar.service.login.SignupService;

@RequestMapping("sign")
@Controller
public class SignupController {

	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	private SignupService service;

	@Autowired
	private SignupMapper mapper;

	@GetMapping("signup")
	public void createUserForm() {

	}

	@GetMapping("signupSuccess")
	public void SuccessCreate() {

	}

	@GetMapping("loginSuccess")
	public void successLogin() {

	}

	@GetMapping("login")
	public void login() {

	}
	
	@GetMapping("findPassword")
	public void find() {
		
	}
	
	@GetMapping("findPasswordSuccess")
	public void findSuccess() {
		
	}

	// 회원가입 컨트롤러
	@PostMapping("signup")
	public String createUser(SignupDto dto) {
		boolean success = service.createMember(dto);

		if (success) {
			return "redirect:/sign/signup/";
		} else {
			return "redirect:/sign/signupSuccess/";
		}
	}

	// 중복확인 컨트롤러
	@GetMapping(path = "check", params = "id")
	@ResponseBody
	public String idCheck(String id) {
		boolean success = service.MemberIdCheck(id);

		if (success) {
			return "notok";
		} else {
			return "ok";
		}
	}

	// 중복확인 컨트롤러
	@GetMapping(path = "check", params = "nickName")
	@ResponseBody
	public String nickNameCheck(String nickName) {
		boolean success = service.MemberNickNameCheck(nickName);

		if (success) {
			return "notok";
		} else {
			return "ok";
		}
	}

	// 중복확인 컨트롤러
	@GetMapping(path = "check", params = "email")
	@ResponseBody
	public String emailCheck(String email) {
		boolean success = service.MemberEmailCheck(email);

		if (success) {
			return "notok";
		} else {
			return "ok";
		}
	}
	
	// 중복확인 컨트롤러
	@GetMapping(path = "check", params = "phoneNum")
	@ResponseBody
	public String phoneNumCheck(String phoneNum) {
		boolean success = service.MemberPhoneNumCheck(phoneNum);

		if (success) {
			return "notok";
		} else {
			return "ok";
		}
	}


	// 회원정보 수정 컨트롤러
	@PostMapping("modify")
	public String modifyMember(SignupDto dto) {
		boolean success = service.modifyMember(dto);
		if (success) {
			return "redirect:/designBoard/list";
		} else {
			return "redirect:/sign/login";

		}
	}

	// 모달 회원 패스워드 일치 시 회원정보 페이지 가능하게 하는 컨트롤러
	@PostMapping("selectMember")
	public String modifyMemberLogin(SignupDto dto, String oldPassword, RedirectAttributes rttr, String id, Model model,
			Principal principal) {

		// db에서 member 읽어서
		SignupDto oldMember = mapper.selectMember(dto.getId());
		// 기존 password가 일치할때만 계속 진행
		String encodedPw = oldMember.getPassword();

		SignupDto dto1 = service.selectMember(id);
		model.addAttribute("member", dto1);

		if (encoder.matches(oldPassword, encodedPw)) {
			return null;
		} else {
			rttr.addAttribute("msg", "비밀번호를 다시 입력해주세요.");
			return "redirect:/designBoard/list";
		}
	}

	@GetMapping("selectMember")
	public void modifyMemberLogin1() {
		
	}


	@GetMapping(path = "modify", params = "nickName")
	@ResponseBody
	public String nickNameModifyCheck(String nickName) {
		boolean success = service.nickNameModifyCheck(nickName);
		if (success) {
			return "notok";
		} else {
			return "ok";
		}

	}

	@GetMapping(path = "modify", params = "email")
	@ResponseBody
	public String emailModifyCheck(String email) {
		boolean success = service.emailModifyCheck(email);
		if (success) {
			return "notok";
		} else {
			return "ok";
		}

	}
	
	
	// 모달 회원 패스워드 일치 시 패스워드 변경 창으로 이동 하는 컨트롤러
		@PostMapping("passwordModify")
		public String passwordModify(SignupDto dto, String oldPassword, RedirectAttributes rttr, String id, Model model,
				Principal principal) {

			// db에서 member 읽어서
			SignupDto oldMember = mapper.selectMember(dto.getId());
			// 기존 password가 일치할때만 계속 진행
			String encodedPw = oldMember.getPassword();

			SignupDto dto1 = service.selectMember(id);
			model.addAttribute("member", dto1);

			if (encoder.matches(oldPassword, encodedPw)) {
				return null;
			} else {
				rttr.addAttribute("msg","error");
				return "redirect:/designBoard/list";
			}
		}
		
		@GetMapping("passwordModify")
		public void passwordModify1() {
			
		}
		
		// 비밀번호 변경 코드
		@PostMapping("passwordUpdate")
		public String passwordUpdate(SignupDto dto) {
			boolean success = service.passwordUpdate(dto);
			if(success) {
				return "redirect:/designBoard/list";
			} else {
				return "redirect:/designBoard/list";
			}
		}
		
		// 아이디 탈퇴 코드
		@PostMapping("removeMember")
		public String removeMember(SignupDto dto, HttpServletRequest req) throws ServletException {
			boolean success = service.removeMember(dto);
			if(success) {
				req.logout();
				return "redirect:/sign/login";
			} else {
				return "redirect:/designBoard/list";
			}
		}
		
		// 비밀번호 초기화 코드
		@PostMapping("findPassword")
		public String findPassword(SignupDto dto, String id, Model model, RedirectAttributes rttr) {
			// selectMember id로 멤버 찾는 mapper
			SignupDto findId = mapper.selectMember(dto.getId());
			// id가 null이 아니고 id의 question이랑 dto의 question이랑 같을 때 서비스 실행
			if(findId != null && findId.getQuestion().equals(dto.getQuestion()) && findId.getAnswer().equals(dto.getAnswer())) {
				service.findPassword(id);
				rttr.addAttribute("success","good");
				return "redirect:/sign/findPasswordSuccess";
			} else {
				rttr.addAttribute("msg","error");
				return "redirect:/sign/findPassword";
			}
		}
		
		// 아이디 찾기 코드
		@PostMapping("findId")
		public String findId(SignupDto dto, String name, RedirectAttributes rttr) {
			SignupDto findName = mapper.selectMember(dto.getName());
			if(findName != null && findName.getPhoneNum().equals(dto.getPhoneNum()) && findName.getEmail().equals(dto.getEmail())) {
				boolean success = service.findName(name);
				if(success) {
					
					rttr.addAttribute("success" , "good");
					return "redirect:/sign/findIdSuccess";
				} else {
					
					rttr.addAttribute("msg","error");
					return "redirect:/sign/login";
				}
			}
		}
		
		@GetMapping("findId")
		public void findId1() {
			
		}
	

}