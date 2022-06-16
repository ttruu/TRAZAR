package com.hys.trazar.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hys.trazar.domain.RequestDto;
import com.hys.trazar.mapper.RequestMapper;

@Service
public class RequestService {
	
	@Autowired
	private RequestMapper mapper;

	public boolean addRequest(RequestDto dto) {
		return mapper.addRequest(dto) == 1;
		
	}

	public List<RequestDto> listBoard() {
		return mapper.listBoard();
	}

	public RequestDto getRequestById(int id) {
		RequestDto Request = mapper.getRequestById(id);
		return Request;
	}

	public boolean updateRequest(RequestDto dto) {
		int cnt = mapper.updateRequest(dto);
		
		return cnt == 1;
		
	}

	public boolean removeRequestById(int id) {
		
		int cnt = mapper.removeRequestById(id);
		
		return cnt == 1;
		
	}

}