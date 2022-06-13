package com.hys.trazar.mapper;

import java.util.List;

import com.hys.trazar.domain.NoticeDto;





public interface NoticeMapper {
	List<NoticeDto> selectNotice();

	NoticeDto getNotice(int id);

	int updateNotice(NoticeDto notice);

	int deleteNotice(int id);

	int insertNotice(NoticeDto notice);
}










