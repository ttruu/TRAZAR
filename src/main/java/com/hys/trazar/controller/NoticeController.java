package com.hys.trazar.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.domain.NoticeDto;
import com.hys.trazar.service.NoticeService;



@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired
	private NoticeService service;
	

	
	@GetMapping("get")
	public void get(int id, Model model) {
		NoticeDto dto = service.getNoticeById(id);
		
		model.addAttribute("notice", dto);
	}
	

	@GetMapping("list")
	public void listNotice(Model model) {
		List<NoticeDto> list = service.listNotice();
		
		model.addAttribute("noticeList", list);
		
	}
	
	@GetMapping("{id}") 
	public String getNotice(@PathVariable("id") int id, Model model) {
		
		
		
		NoticeDto dto = service.getNotice(id);
		

		
		model.addAttribute("notice", dto);
	
		
		return "/notice/get";
	}
	

	
	@PostMapping("remove")
	public String removeNotice(int id) {
		boolean success = service.removeNoticeById(id);
		
		if (success) {
			
		} else {
			
		}
		
		return "redirect:/notice/list";
	}
	
	@GetMapping("insert")
	public void writeNotice() {
		
	}
	
	@PostMapping("insert")
	public String writeNoticeProcess(NoticeDto notice) {
		boolean success = service.addNotice(notice);
		
		if (success) {
			
		} else {
			
		}
		
		return "redirect:/notice/" + notice.getId();
	}
	
	@GetMapping("modify")
	public String getUpdateNotice(int id,Model model) {
		NoticeDto dto = service.getNoticeById(id);
		
		model.addAttribute("notice", dto);
		return "/notice/modify";
	}
	
	@PostMapping("modify")
	public String modifyNotice(NoticeDto notice) {
		boolean success = service.updateNotice(notice);
		
		if (success) {
			
		} else {
			
		}
		
		return "redirect:/notice/list";
	}
}










