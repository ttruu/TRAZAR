package com.hys.trazar.controller.design;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.domain.ReviewDto;
import com.hys.trazar.service.DesignBoardService;
import com.hys.trazar.service.ReviewService;


@Controller
@RequestMapping("designBoard")
public class DesignBoardController {
	
	@Autowired
	private DesignBoardService service;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("list")
	public void list(Model model) {
		List<DesignBoardDto> list = service.listDesignBoard();
		
		model.addAttribute("designBoardList", list);
	}

	@GetMapping("insert")
	public void insert() {
		
	}
	
	@PostMapping("insert")
	public String insert(DesignBoardDto designBoard, RedirectAttributes rttr) {
		boolean success = service.insertDesignBoard(designBoard);
		
		if(success) {
			rttr.addFlashAttribute("message", "새 글이 등록되었습니다");
		} else {
			rttr.addFlashAttribute("message", "새글이 등록되지 않았습니다");
		}
		
		return "redirect:/designBoard/list";
	}
	
	
	@GetMapping("get")
	public void get(int id, Model model) {
		DesignBoardDto dto = service.getDesignBoardById(id);
		
		List<ReviewDto> reviewList = reviewService.getReviewByDesignBoardId(id);
		
		model.addAttribute("designBoard", dto);
	}
	
	@PostMapping("modify")
	public String modify(DesignBoardDto dto, RedirectAttributes rttr) {
		boolean success = service.updateDesignBoard(dto);
		
		if(success) {
			rttr.addFlashAttribute("message", "글이 수정되었습니다");
		} else {
			rttr.addFlashAttribute("message", "글이 수정되지 않았습니다");
		}
		
		rttr.addAttribute("id", dto.getId());
		
		return "redirect:/designBoard/get";
	}
	
	
	@PostMapping("remove")
	public String remove(int id, RedirectAttributes rttr) {
		
		boolean success = service.deleteDesignBoard(id);
		
		if (success) {
			rttr.addFlashAttribute("message", "글이 삭제 되었습니다.");
			
		} else {
			rttr.addFlashAttribute("message", "글이 삭제 되지않았습니다.");
		}
		return "redirect:/designBoard/list";
	}
	
	

}
