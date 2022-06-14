package com.hys.trazar.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hys.trazar.domain.RequestDto;
import com.hys.trazar.service.RequestService;

@Controller
@RequestMapping("request")
public class RequestController {
	
	@Autowired
	private RequestService service;
	
	@GetMapping("insert")
	public void requestInsert() {
		
	}
	
	@PostMapping("insert")
	public void insertRequest(RequestDto dto, Principal principal, RedirectAttributes rttr) {
		
		dto.setMemberId(principal.getName());
		boolean success = service.addRequest(dto);
		
		if (success) {
			rttr.addFlashAttribute("message", "새 글이 등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 글이 등록되지 않았습니다.");
		}

	}
	
	@RequestMapping("list")
	public void list(Model model) {
		List<RequestDto> list = service.listBoard();
		model.addAttribute("requestList", list);
	}
	
}
