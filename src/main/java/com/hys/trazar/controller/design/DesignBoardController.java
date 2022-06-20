package com.hys.trazar.controller.design;



import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
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
import com.hys.trazar.domain.ReviewDto;
import com.hys.trazar.mapper.DesignBoardMapper;
import com.hys.trazar.service.DesignBoardService;
import com.hys.trazar.service.ReviewService;

@Controller
@RequestMapping("designBoard")
public class DesignBoardController {

	private static final String FILE2 = "file";
	private static final Logger LOGGER = LoggerFactory.getLogger(DesignBoardController.class);
	private static final String UPLOADIMG = "/static/uploadimg/";
	

	@Autowired
	ServletContext servletContext;

	@Autowired
	private DesignBoardService service;

	@Autowired
	private ReviewService reviewService;

	@RequestMapping("list")
	public void list(Model model) {
		List<DesignBoardDto> list = service.listDesignBoard();

		processThumbNailImage(list);
		model.addAttribute("designBoardList", list);
	}
	
	@RequestMapping("mainex")
	public void list1(Model model) {
		List<DesignBoardDto> list = service.listDesignBoard();

		model.addAttribute("designBoardList", list);
	}

	// 썸네일에 이미지 출력
	private void processThumbNailImage(List<DesignBoardDto> list) {
		
		for (DesignBoardDto dto : list) {
			String thumbNail = "";

			String source = dto.getBody();
			Document doc = Jsoup.parse(source);
			Elements elements = doc.select("img");

			if (elements.size() > 0) {
				thumbNail = elements.get(0).attr("src").toString();
			}

			dto.setImgthumbnail(thumbNail);
		}
	}

	
	@GetMapping("insert")
	public void insert() {

	}

	@PostMapping("insert")
	public String insert(DesignBoardDto designBoard,
			Principal principal,
			RedirectAttributes rttr) {

		designBoard.setMemberId(principal.getName());

		boolean success = service.insertDesignBoard(designBoard);

		if (success) {
			rttr.addFlashAttribute("message", "새 글이 등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 글이 등록되지 않았습니다.");
		}

		return "redirect:/designBoard/list";
	}

	@GetMapping("get")
	public void get(int id, Model model) {
		DesignBoardDto dto = service.getDesignBoardById(id);

		// designBoard 내에서 review 목록을 보기 위해 추가
		List<ReviewDto> reviewList = reviewService.getReviewByDesignBoardId(id);

		model.addAttribute("designBoard", dto);
	}

	@PostMapping("modify")
	public String modify(DesignBoardDto dto, Principal principal, RedirectAttributes rttr) {

		DesignBoardDto oldBoard = service.getDesignBoardById(dto.getId());

		if (oldBoard.getMemberId().equals(principal.getName())) {
			boolean success = service.updateDesignBoard(dto);

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

		return "redirect:/designBoard/get";
	}

	@PostMapping("remove")
	public String remove(DesignBoardDto dto, Principal principal, RedirectAttributes rttr) {
		// 게시물 정보 얻고
		DesignBoardDto oldBoard = service.getDesignBoardById(dto.getId());

		if (oldBoard.getMemberId().equals(principal.getName())) {
			boolean success = service.deleteDesignBoard(dto.getId());

			if (success) {
				rttr.addFlashAttribute("message", "글이 삭제 되었습니다.");

			} else {
				rttr.addFlashAttribute("message", "글이 삭제 되지않았습니다.");
			}
		} else {
			rttr.addFlashAttribute("message", "권한이 없습니다");
			rttr.addAttribute("id", dto.getId());
			return "redirect:/designBoard/get";
		}

		return "redirect:/designBoard/list";
	}


	// 썸머노트 에디터에서 받는 이미지 업로드 처리
	@RequestMapping(value = "/imageupload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
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
		// requet.getServername 을 하니, ajax에서 보내는 값이 리퀘스트 정보에 안떠서 InetAddress로 받는다 
		String localIP = InetAddress.getLocalHost().getHostAddress();
		// http://를 붙여줘야 에디터 창에서 불러올 수가 있다. 
		return "http://" + localIP + ":" + request.getServerPort() + filename;

	}
}
