package com.hys.trazar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.domain.NoticeDto;





public interface NoticeMapper {
	
	List<NoticeDto> selectNoticeAll(@Param("type") String type, @Param("keyword") String keyword);
	NoticeDto selectNoticeById(int id);
		
	NoticeDto getNotice(int id);

	int updateNotice(NoticeDto notice);

	int deleteNotice(int id);

	int insertNotice(NoticeDto notice);
}










