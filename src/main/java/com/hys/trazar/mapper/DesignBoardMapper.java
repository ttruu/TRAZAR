package com.hys.trazar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.domain.RequestDto;

public interface DesignBoardMapper {

	DesignBoardDto selectDesignBoardById(int id);

	int insertDesignBoard(DesignBoardDto designBoard);

	List<DesignBoardDto> selectDesignBoardAll();

	int updateDesignBoard(DesignBoardDto dto);

	int deleteDesignBoard(int id);

	void deleteByMemberId(String memberId);
	
	void insertFile(@Param("designBoardId") int designBoardId, @Param("fileName") String fileName);

	List<DesignBoardDto> listByMemberId(String id);
//멤버 아이디로 가져오기 디자이너 정보용 리스트 
	List<DesignBoardDto> myDesignBoard(String memberId);
}
