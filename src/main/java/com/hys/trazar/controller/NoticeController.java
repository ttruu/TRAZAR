package com.hys.trazar.controller;


import java.security.Principal;
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
	public void listNotice(@RequestParam(name = "keyword", defaultValue = "") String keyword,
			 @RequestParam(name = "type", defaultValue = "") String type,
	         Model model) {
		List<NoticeDto> list = service.listNotice(type, keyword);
		
		model.addAttribute("noticeList", list);
		
	}
	
	/*
	 * @GetMapping("{id}") public String getNotice(@PathVariable("id") int id, Model
	 * model) {
	 * 
	 * 
	 * 
	 * NoticeDto dto = service.getNotice(id);
	 * 
	 * 
	 * 
	 * model.addAttribute("notice", dto);
	 * 
	 * 
	 * return "/notice/get"; }
	 */
	

	
	@PostMapping("remove")
	public String removeNotice(NoticeDto notice, Principal principal, RedirectAttributes rttr) {
	
		
	
		NoticeDto oldNotice = service.getNoticeById(notice.getId());
		// 게시물 작성자(memberId)와 principal의 name과 비교해서 같을 때만 진행.
		if (oldNotice.getManagerId().equals(principal.getName())) {
			boolean success = service.removeNoticeById(notice.getId());
			
			if (success) {
				rttr.addFlashAttribute("message", "글이 삭제 되었습니다.");
				
			} else {
				rttr.addFlashAttribute("message", "글이 삭제 되지않았습니다.");
			}
			
		} else {
			rttr.addFlashAttribute("message", "권한이 없습니다.");
			rttr.addAttribute("id", notice.getId());
			return "redirect:/notice/get";
		}
		
		return "redirect:/notice/list";
	}
	
	@GetMapping("insert")
	public void writeNotice() {
		
	}
	
	@PostMapping("insert")
	public String writeNoticeProcess(NoticeDto notice,Principal principal,RedirectAttributes rttr) {
		
		notice.setManagerId(principal.getName());
		boolean success = service.addNotice(notice);
		
		if (success) {
			rttr.addFlashAttribute("message", "새 글이 등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 글이 등록되지 않았습니다.");
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
	public String modifyNotice(NoticeDto notice,Principal principal, RedirectAttributes rttr) {
		
	
	NoticeDto oldNotice = service.getNoticeById(notice.getId());
	
	if (oldNotice.getManagerId().equals(principal.getName())) {
		boolean success = service.updateNotice(notice);
		
		if (success) {
			rttr.addFlashAttribute("message", "글이 수정되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "글이 수정되지 않았습니다.");
		}
		
	} else {
		rttr.addFlashAttribute("message", "권한이 없습니다.");
	}
	
	rttr.addAttribute("id", notice.getId());

		return "redirect:/notice/"+ notice.getId();
	}
}










