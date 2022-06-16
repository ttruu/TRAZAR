package com.hys.trazar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hys.trazar.domain.login.SignupDto;
import com.hys.trazar.mapper.login.SignupMapper;
import com.hys.trazar.service.login.SignupService;

@Controller
@RequestMapping("designer")
public class DesignerInfo {
	@Autowired
	private SignupService service;

	@Autowired
	private SignupMapper mapper;

	
	@GetMapping("view")
	public String getInfo(String id, Model model) {
		/* 1.DB에서 값가져오기 */
		SignupDto dto = service.selectMember(id);
		/* 2.jsp 지정한 변수로 값 넣기 */
	model.addAttribute("member", dto);
	
	/* 여기로 보내라 */
	return "/designer/view";
}
	
}
