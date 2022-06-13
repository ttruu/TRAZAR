package com.hys.trazar.controller.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hys.trazar.domain.login.SignupDto;
import com.hys.trazar.service.login.SignupService;

@RequestMapping("sign")
@Controller
public class SignupController {
	@Autowired
	private SignupService service;
	

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
	
	@GetMapping("modifyMember")
	public void ModifyMember(String id, Model model) {
		SignupDto dto = service.memberModify(id);
		model.addAttribute("member", dto);
	}
	
}
