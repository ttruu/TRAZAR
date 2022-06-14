package com.hys.trazar.controller.design;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
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
	
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		
		JsonObject jsonObject = new JsonObject();
		
        
		String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 
		
		
		// 내부경로로 저장
		//String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
				
		//String fileRoot = contextRoot + "resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/fileupload/"+ savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	

}
