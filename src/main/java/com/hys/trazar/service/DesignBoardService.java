package com.hys.trazar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.mapper.DesignBoardMapper;

@Service
public class DesignBoardService {

	@Autowired
	private DesignBoardMapper mapper;
	
	public DesignBoardDto getDesignBoardById(int id) {
		DesignBoardDto designBoard = mapper.selectDesignBoardById(id);
		
		return designBoard;
	}

	public boolean insertDesignBoard(DesignBoardDto designBoard) {
		// 게시물 등록
		int cnt = mapper.insertDesignBoard(designBoard);
		
		return cnt == 1;
	}

	public List<DesignBoardDto> listDesignBoard() {
		return mapper.selectDesignBoardAll();
	}

	public boolean updateDesignBoard(DesignBoardDto dto) {
		int cnt = mapper.updateDesignBoard(dto);
		return cnt == 1;
	}

	public boolean deleteDesignBoard(int id) {
		return mapper.deleteDesignBoard(id) == 1;
	}

}
