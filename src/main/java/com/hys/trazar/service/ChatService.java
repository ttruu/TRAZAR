package com.hys.trazar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hys.trazar.domain.ChatDto;
import com.hys.trazar.mapper.ChatMapper;

@Service
public class ChatService {
	
	@Autowired
	private ChatMapper mapper;

	public Object getChatInfo(ChatDto dto) {
		return mapper.getChatInfo(dto);
	}
}
