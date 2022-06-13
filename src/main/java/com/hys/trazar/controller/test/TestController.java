package com.hys.trazar.controller.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hys.trazar.domain.ReviewDto;
import com.hys.trazar.service.TestService;

@Controller
@RequestMapping("test")
public class TestController {

	@Autowired
	private TestService service;
	
	@GetMapping("list")
	public void listTest(Model model) {
		List<ReviewDto> list = service.listTest();
		
		model.addAttribute("testList", list);
		
	}
	
	@GetMapping("{id}") 
	public String getTest(@PathVariable("id") int id, Model model) {
		System.out.println(id);
		
		ReviewDto dto = service.getTest(id);
		
		model.addAttribute("test", dto);
	
		
		return "/test/get";
	}
	
	@PostMapping("modify")
	public String modifyTest(ReviewDto review) {
		boolean success = service.updateTest(review);
		
		if (success) {
			
		} else {
			
		}
		
		return "redirect:/test/" + review.getId();
	}
	
	@PostMapping("remove")
	public String removeTest(int id) {
		boolean success = service.removeTestById(id);
		
		if (success) {
			
		} else {
			
		}
		
		return "redirect:/test/list";
	}
	
	@GetMapping("insert")
	public void writeTest() {
		
	}
	
	@PostMapping("insert")
	public String writeTestProcess(ReviewDto review) {
		boolean success = service.addTest(review);
		
		if (success) {
			
		} else {
			
		}
		
		return "redirect:/test/" + review.getId();
	}
}
