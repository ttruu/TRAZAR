package com.hys.trazar.controller;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.domain.RequestDto;
import com.hys.trazar.domain.login.SignupDto;
import com.hys.trazar.service.RequestService;

@Controller
@RequestMapping("request")
public class RequestController {
	
	private static final String FILE2 = "file";
	private static final Logger LOGGER = LoggerFactory.getLogger(NoticeController.class);
	private static final String UPLOADIMG = "/static/uploadimg/";
	
	@Autowired
	 ServletContext servletContext;
	
	@Autowired
	private RequestService service;
	
	@GetMapping("insert")
	public void requestInsert() {
		
	}
	
	@PostMapping("insert")
	public String insertRequest(RequestDto dto, Principal principal,DesignBoardDto designBoard, RedirectAttributes rttr) {
		
		dto.setMemberId(principal.getName());
		boolean success = service.addRequest(dto);
		
		if (success) {
			rttr.addFlashAttribute("message", "새 글이 등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 글이 등록되지 않았습니다.");
		}
		
		
		return "redirect:/request/list";
		
	}
	
	@RequestMapping("list")
	public void list(Model model) {
		List<RequestDto> list = service.listRequest();
		model.addAttribute("requestList", list);
	}
	
	@GetMapping("get")
	public void get(int id, Model model) {
		RequestDto dto = service.getRequestById(id);
		model.addAttribute("request", dto);
	}
	
	@PostMapping("modify")
	public String modifyRequest(RequestDto dto, RedirectAttributes rttr, Principal principal) {
		service.updateRequest(dto);
		rttr.addAttribute("id", dto.getId());
		return "redirect:/request/get";
	}
	
	@PostMapping("remove")
	public String removeRequest(int id) {
		
		service.removeRequestById(id);
		return "redirect:/request/list";
	}
	
	// 썸머노트 에디터에서 받는 이미지 업로드 처리
	@RequestMapping(value = "/requestImageupload", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String imageUpload(MultipartHttpServletRequest request) throws IOException {
		
		// 01. 리퀘스트에서 멀티파트파일을 받아서
		MultiValueMap<String, MultipartFile> multiFileMap = request.getMultiFileMap();
		List<MultipartFile> list = multiFileMap.get(FILE2);
		MultipartFile multipartFile = list.get(0);
		LOGGER.debug(multipartFile.getOriginalFilename());
	

		// 02. 파일을 전송하고
		String webappRoot = servletContext.getRealPath("/"); 
		String filename = UPLOADIMG + multipartFile.getOriginalFilename();
		File file = new File(webappRoot + filename);
		multipartFile.transferTo(file);

		// 03. 마지막에 최종 주소를 반환한다.
		// requet.getServername 을 하니, ajax에서 보내는 값이 리퀘스트 정보에 안떠서 InetAddress로
		// 받았다.
		String localIP = InetAddress.getLocalHost().getHostAddress();
		// http://를 붙여줘야 에디터 창에서 불러올 수가 있다. 음.. 자바스크립트내에서 붙일까? 일단 그냥 적자.
		return "http://" + localIP + ":" + request.getServerPort() + filename;
		
	}
	
	@RequestMapping("myList")
	public void myList(RequestDto dto, Principal principal, Model model, String memberId) {
		dto.setMemberId(principal.getName());
		List<RequestDto> list = service.myListRequest(memberId);
		model.addAttribute("requestMyList", list);
	}
	
}
