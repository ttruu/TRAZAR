package com.hys.trazar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hys.trazar.domain.DesignBoardDto;

public interface DesignBoardMapper {

	DesignBoardDto selectDesignBoardById(int id);

	int insertDesignBoard(DesignBoardDto designBoard);

	List<DesignBoardDto> selectDesignBoardAll(@Param("type") String type, @Param("keyword") String keyword);//검색용 맴퍼 값 타입 키워드 추가
	
	List<DesignBoardDto> selectDesignBoardAll();
	int updateDesignBoard(DesignBoardDto dto);

	int deleteDesignBoard(int id);

	void deleteByMemberId(String memberId);
	
	void insertFile(@Param("designBoardId") int designBoardId, @Param("fileName") String fileName);

	List<DesignBoardDto> listByMemberId(String id);

	int increamentClicked(DesignBoardDto dto);


	
}
