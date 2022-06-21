package com.hys.trazar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.domain.RequestDto;

public interface RequestMapper {
	
	DesignBoardDto getDesignBoardId();
	
	int addRequest(RequestDto dto);

	List<RequestDto> listRequest();

	RequestDto getRequestById(int id);

	int updateRequest(RequestDto dto);

	int removeRequestById(int id);
	
	void deleteByMemberId(String memberId);

	List<RequestDto> myListRequest(String memberId);
	

}
