package com.hys.trazar.controller.design;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hys.trazar.domain.ReviewDto;
import com.hys.trazar.service.ReviewService;

@Controller
@RequestMapping("")
public class BoardController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("get")
	public void get(int id, Model model) {
		BoardDto dto = service.getBoardById(id);
		List<ReviewDto> reviewList = reviewService.getReviewByBoardId(id);
		model.addAttribute("board", dto);
	}
	
}
