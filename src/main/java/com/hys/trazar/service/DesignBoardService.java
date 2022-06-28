package com.hys.trazar.service;

import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.mapper.DesignBoardMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class DesignBoardService {

	@Autowired
	private DesignBoardMapper mapper;

	
	// get service
	public DesignBoardDto getDesignBoardById(int id) {
		DesignBoardDto designBoard = mapper.selectDesignBoardById(id);

		return designBoard;
	}

	
	// insert service
	@Transactional
	public boolean insertDesignBoard(DesignBoardDto designBoard) {
		// 게시물 등록
		int cnt = mapper.insertDesignBoard(designBoard);

		//addFiles(designBoard.getId(), files);

		return cnt == 1;
	}
	
		
	// list service	
	public List<DesignBoardDto> listDesignBoard() {
		return mapper.selectDesignBoardAll();
	}
	
	//search service
	public List<DesignBoardDto> searchListDesignBoard(String type, String keyword) {
		return mapper.selectDesignBoardAll(type, "%" + keyword + "%");
	}
	
	// modify service
	public boolean updateDesignBoard(DesignBoardDto dto) {
		int cnt = mapper.updateDesignBoard(dto);
		return cnt == 1;
	}

	// remove service
	public boolean deleteDesignBoard(int id) {
		return mapper.deleteDesignBoard(id) == 1;
	}
	
	// clicked service
	public boolean increamentClicked(DesignBoardDto dto) {
		int cnt = mapper.increamentClicked(dto);
		return cnt == 1;
	}
	
	// category service
	public List<DesignBoardDto> listDesignBoard(String categoryName) {
		
		return mapper.selectDesignBoardCategory(categoryName);
	}

	// hotlist service
	public List<DesignBoardDto> hotList() {
		return mapper.hotList();
		
	}

}
