package com.hys.trazar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hys.trazar.mapper.ChatMapper;

@Service
public class ChatService {
	
	@Autowired
	private ChatMapper mapper;

	public Object getChatInfo(String message) {
		return mapper.getChatInfo(message);
	}
}
