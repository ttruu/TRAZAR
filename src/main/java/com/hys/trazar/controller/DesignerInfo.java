package com.hys.trazar.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hys.trazar.domain.DesignBoardDto;
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
	public String getInfo(String memberId,Model model) {
		/* 1.DB에서 값가져오기 */
		SignupDto dto = service.selectMember(memberId);
		List<DesignBoardDto> list = service.DesignListRequest(memberId);
		model.addAttribute("designerBoardList", list);
		model.addAttribute("member", dto);

		/* 여기로 보내라 */
		return "/designer/view";
	}

	
	
}
