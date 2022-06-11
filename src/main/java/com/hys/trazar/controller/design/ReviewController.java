package com.hys.trazar.controller.design;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hys.trazar.domain.ReviewDto;
import com.hys.trazar.service.ReviewService;

@Controller
@RequestMapping("review")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@GetMapping("insert")
	public void insert() {
		
	}
	
	@PostMapping("insert")
	public void insert(ReviewDto dto, Model model, RedirectAttributes rttr) {
		
		List<ReviewDto> list = service.listReview();
		
		model.addAttribute("reviewList", list);
		
		boolean success = service.insertReview(dto);
		
		if (success) {
			rttr.addFlashAttribute("message", "새 글이 등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 글이 등록되지 않았습니다.");
		}
	}
	
	@PostMapping("insert/modify")
	public String modify(ReviewDto dto, RedirectAttributes rttr) {
	
		boolean success = service.updateReview(dto);
		
		if (success) {
			rttr.addFlashAttribute("message", "글이 수정되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "글이 수정되지 않았습니다.");
		}
		
		return "redirect:/review/insert" + dto.getId();
	}
	
}
