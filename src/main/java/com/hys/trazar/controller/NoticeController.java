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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hys.trazar.domain.NoticeDto;
import com.hys.trazar.domain.PageInfoDto;
import com.hys.trazar.service.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {
	private static final String FILE2 = "file";
	private static final Logger LOGGER = LoggerFactory.getLogger(NoticeController.class);
	private static final String UPLOADIMG = "/static/uploadimg/";

	@Autowired
	ServletContext servletContext;

	@Autowired
	private NoticeService service;

	@GetMapping("insert")
	public void insert() {

	}

	@PostMapping("insert")
	public String insert(NoticeDto notice, Principal principal, RedirectAttributes rttr) {

		notice.setMemberId(principal.getName());

		boolean success = service.insertNotice(notice);

		if (success) {
			rttr.addFlashAttribute("message", "새 글이 등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 글이 등록되지 않았습니다.");
		}

		return "redirect:/notice/list";
	}

	@RequestMapping("list")
	public void list(@RequestParam(name = "page", defaultValue = "1") int page, Model model) {
		int rowPerPage = 10;
		
		/* List<NoticeDto> list = service.listNotice(); */
		List<NoticeDto> list = service.listNoticePage(page, rowPerPage);
		
		int totalRecords = service.countNotice();
		System.out.println(totalRecords);
		int end = (totalRecords - 1) / rowPerPage + 1;

		PageInfoDto pageInfo = new PageInfoDto();

		pageInfo.setCurrent(page);
		pageInfo.setEnd(end);

		model.addAttribute("noticeList", list);
		model.addAttribute("pageInfo", pageInfo);
	}

	@GetMapping("get")
	public void get(int id, Model model) {
		NoticeDto dto = service.getNoticeById(id);

		model.addAttribute("notice", dto);
	}

	@PostMapping("modify")
	public String modify(NoticeDto dto, Principal principal, RedirectAttributes rttr) {

		NoticeDto oldBoard = service.getNoticeById(dto.getId());

		if (oldBoard.getMemberId().equals(principal.getName())) {
			boolean success = service.updateNotice(dto);

			if (success) {
				rttr.addFlashAttribute("message", "글이 수정되었습니다");
			} else {
				rttr.addFlashAttribute("message", "글이 수정되지 않았습니다");
			}
		} else {
			rttr.addFlashAttribute("message", "권한이 없습니다");
		}

		rttr.addAttribute("id", dto.getId());
		rttr.addAttribute("memberId", principal.getName());

		return "redirect:/notice/get";
	}

	@PostMapping("remove")
	public String remove(NoticeDto dto, Principal principal, RedirectAttributes rttr) {
		// 게시물 정보 얻고
		NoticeDto oldBoard = service.getNoticeById(dto.getId());

		if (oldBoard.getMemberId().equals(principal.getName())) {
			boolean success = service.deleteNotice(dto.getId());

			if (success) {
				rttr.addFlashAttribute("message", "글이 삭제 되었습니다.");

			} else {
				rttr.addFlashAttribute("message", "글이 삭제 되지않았습니다.");
			}
		} else {
			rttr.addFlashAttribute("message", "권한이 없습니다");
			rttr.addAttribute("id", dto.getId());
			return "redirect:/notice/get";
		}

		return "redirect:/notice/list";
	}

	// 썸머노트 에디터에서 받는 이미지 업로드 처리
	@RequestMapping(value = "/imageupload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String imageUpload(MultipartHttpServletRequest request) throws IOException {

		// 01. 리퀘스트에서 멀티파트파일을 받기
		MultiValueMap<String, MultipartFile> multiFileMap = request.getMultiFileMap();
		List<MultipartFile> list = multiFileMap.get(FILE2);
		MultipartFile multipartFile = list.get(0);
		LOGGER.debug(multipartFile.getOriginalFilename());

		// 02. 파일을 전송
		String webappRoot = servletContext.getRealPath("/");
		String filename = UPLOADIMG + multipartFile.getOriginalFilename();
		File file = new File(webappRoot + filename);
		multipartFile.transferTo(file);

		// 03. 마지막에 최종 주소를 반환
		// requet.getServername 을 하니, ajax에서 보내는 값이 리퀘스트 정보에 안떠서 InetAddress로
		// 받음
		String localIP = InetAddress.getLocalHost().getHostAddress();
		// http://를 붙여 에디터 창에서 불러옴
		return "http://" + localIP + ":" + request.getServerPort() + filename;

	}

}
