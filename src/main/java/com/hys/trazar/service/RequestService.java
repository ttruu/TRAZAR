package com.hys.trazar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.domain.NoticeDto;
import com.hys.trazar.domain.RequestDto;
import com.hys.trazar.mapper.RequestMapper;

@Service
public class RequestService {
	
	@Autowired
	private RequestMapper mapper;
	
	
	// 요청 보내기
	public boolean addRequest(RequestDto dto) {
		return mapper.addRequest(dto) == 1;
		
	}
	
	// 요청 list가져오기
	
	public List<RequestDto> listRequest(String type, String keyword) {
		return mapper.listRequest(type, "%" + keyword + "%");
	}
	
	// 요청을 id기준으로 가져오기
	public RequestDto getRequestById(int id) {
		RequestDto Request = mapper.getRequestById(id);
		return Request;
	}
	
	// 요청 수정하기
	public boolean updateRequest(RequestDto dto) {
		int cnt = mapper.updateRequest(dto);
		
		return cnt == 1;
		
	}
	
	// 요청 삭제하기
	public boolean removeRequestById(int id) {
		
		int cnt = mapper.removeRequestById(id);
		
		return cnt == 1;
		
	}
	
	// 내 요청 가져오기
	public List<RequestDto> myListRequest(String memberId, int page, int rowPerPage) {
		int from = (page - 1) * rowPerPage;
		
		return mapper.myListRequest(memberId, from, rowPerPage);
	}

	public List<RequestDto> listRequestByCategory(String categoryName) {
		return mapper.listRequestByCategory(categoryName);
	}

	public int countMyList(String memberId) {
		return mapper.countMyList(memberId);
	}

}
