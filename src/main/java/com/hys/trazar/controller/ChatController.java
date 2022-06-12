package com.hys.trazar.controller;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {

	@GetMapping("/chat")
	public void chat(Model model, Principal principal, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + userDetails.getUsername());
		
		model.addAttribute("userid", userDetails.getUsername());
	}
}