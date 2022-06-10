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
import com.hys.trazar.service.DesignBoardService;

@Controller
@RequestMapping("designBoard")
public class DesignBoardController {
	
	@Autowired
	private DesignBoardService service;
	
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
		
		model.addAttribute("designBoard", dto);
	}
}
