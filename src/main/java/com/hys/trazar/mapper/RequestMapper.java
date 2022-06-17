package com.hys.trazar.mapper;

import java.util.List;

import com.hys.trazar.domain.RequestDto;

public interface RequestMapper {
	
	int getDesignBoardId();
	
	int addRequest(RequestDto dto);

	List<RequestDto> listRequest();

	RequestDto getRequestById(int id);

	int updateRequest(RequestDto dto);

	int removeRequestById(int id);
	
	void deleteByMemberId(String memberId);

}
