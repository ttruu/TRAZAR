package com.hys.trazar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hys.trazar.domain.RequestDto;
import com.hys.trazar.service.RequestService;

@Controller
@RequestMapping("request")
public class RequestController {
	
	@Autowired
	private RequestService service;
	
	@GetMapping("requestInsert")
	public void requestInsert() {
		
	}
	
	@PostMapping("requestInsert")
	public void requestInsertProcess(RequestDto dto) {
		service.addRequest(dto);
	}
}
