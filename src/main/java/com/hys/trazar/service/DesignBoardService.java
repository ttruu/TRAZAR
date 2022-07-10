package com.hys.trazar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.domain.LikeDto;
import com.hys.trazar.mapper.DesignBoardMapper;
import com.hys.trazar.mapper.LikeMapper;
import com.hys.trazar.mapper.ReviewMapper;

@Service
public class DesignBoardService {

	@Autowired
	private DesignBoardMapper mapper;

	@Autowired
	private LikeMapper likemapper;
	
	@Autowired
	private ReviewMapper reviewMapper;
	
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
	@Transactional
	public boolean deleteDesignBoard(int id) {
		likemapper.deleteLikeByDesignBoardId(id);
		reviewMapper. deleteByDesignBoardId(id);
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

	// 게시물에 대한 좋아요 누른 아이디
	public int likeSelectById(LikeDto likeDto) {
		return mapper.likeSelectById(likeDto);
	}
	

	public void likeInsert(LikeDto likeDto) {
		mapper.likeInsert(likeDto);		
	}


	public int likeGetInfo(LikeDto likeDto) {
		return mapper.likeGetInfo(likeDto);
	}


	public int likeUpdate(LikeDto likeDto) {
		mapper.likeUpdate(likeDto);
		return mapper.selectDesignBoardById(likeDto.getDesignBoardId()).getLikeCount();
	}

	
		

}
