package com.hys.trazar.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hys.trazar.domain.RequestDto;
import com.hys.trazar.domain.login.SignupDto;
import com.hys.trazar.mapper.login.SignupMapper;
import com.hys.trazar.service.login.SignupService;

@Controller("designerInfo")
public class DesignerInfo {
	@Autowired
	private SignupService service;

	@Autowired
	private SignupMapper mapper;
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void Infoget(String id, Model model) throws Exception {
		SignupDto dto = service.selectMember(id);
		model.addAttribute("model", id);
	
	}
	
}
