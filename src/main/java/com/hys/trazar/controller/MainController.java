package com.hys.trazar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("test")
public class MainController {
	
	@GetMapping("grid")
	public void method01() {
		
	}
	
}
