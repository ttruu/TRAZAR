package com.hys.trazar.controller.login;

import java.security.Principal;
import java.util.List;

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

	@PostMapping("signup")
	public String createUser(SignupDto dto) {
		boolean success = service.createMember(dto);

		if (success) {
			return "redirect:/sign/signup/";
		} else {
			return "redirect:/sign/signupSuccess/";
		}
	}

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

	@GetMapping("selectMember1")
	public void selectMember(String id, Model model) {
		SignupDto dto = service.selectMember(id);
		model.addAttribute("member", dto);
	}

	@PostMapping("modify")
	public String modifyMember(SignupDto dto) {
		boolean success = service.modifyMember(dto);
		if (success) {
			return "redirect:/designBoard/list";
		} else {
			return "redirect:/sign/login";

		}
	}

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
	
//	@PostMapping
//	public String removeMember(SignupDto dto) {
//		boolean success = service.deleteMember(dto);
//		if (success) {
//			return "redirect:sign/login";
//		} else {
//			return "redirect:sign/selectMember";
//		}
//	}
	

}