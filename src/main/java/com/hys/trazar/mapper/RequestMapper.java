package com.hys.trazar.mapper;

import java.util.List;

import com.hys.trazar.domain.RequestDto;

public interface RequestMapper {

	int addRequest(RequestDto dto);

	List<RequestDto> listBoard();

	RequestDto getRequestById(int id);

	int updateRequest(RequestDto dto);

}
