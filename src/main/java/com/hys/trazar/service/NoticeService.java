package com.hys.trazar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hys.trazar.domain.NoticeDto;
import com.hys.trazar.mapper.NoticeMapper;

@Service
public class NoticeService {
	@Autowired
	private NoticeMapper mapper;


	public NoticeDto getNoticeById(int id) {
		NoticeDto notice = mapper.selectNoticeById(id);

		return notice;
	}

	

	@Transactional
	public boolean insertNotice(NoticeDto notice) {
		// 게시물 등록
		int cnt = mapper.insertNotice(notice);


		return cnt == 1;
	}
	

	/*
	 * public List<NoticeDto> listNotice() { return mapper.selectNoticeAll(); }
	 */

	public boolean updateNotice(NoticeDto dto) {
		int cnt = mapper.updateNotice(dto);
		return cnt == 1;
	}

	public boolean deleteNotice(int id) {
		return mapper.deleteNotice(id) == 1;
	}
	
	//페이지네이션
public List<NoticeDto> listNoticePage(int page, int rowPerPage) {
		
		int from = (page-1) * rowPerPage;
		
		return mapper.listNoticePage(from, rowPerPage);
	}
public int countNotice() {
	return mapper.countNotice();
}
}
	





