package com.hys.trazar.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hys.trazar.domain.RequestDto;
import com.hys.trazar.domain.ReviewDto;
import com.hys.trazar.service.RequestService;

@Controller
@RequestMapping("request")
public class RequestController {
	
	@Autowired
	private RequestService service;
	
	@GetMapping("insert")
	public void requestInsert() {
		
	}
	
	@PostMapping(path = "insert", produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> insert(RequestDto dto, Principal principal) {
		
		if (principal == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		} else {
			String memberId = principal.getName();
			dto.setMemberId(memberId);
			
			boolean success = service.addRequest(dto);
	
		}

	}
}
