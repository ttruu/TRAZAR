package com.hys.trazar.service;

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

}
