package com.hys.trazar.mapper;

import java.util.List;

import com.hys.trazar.domain.DesignBoardDto;

public interface DesignBoardMapper {

	DesignBoardDto selectDesignBoardById(int id);

	int insertDesignBoard(DesignBoardDto designBoard);

	List<DesignBoardDto> selectDesignBoardAll();

	int updateDesignBoard(DesignBoardDto dto);

	int deleteDesignBoard(int id);

}
