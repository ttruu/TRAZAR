package com.hys.trazar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.domain.NoticeDto;

public interface NoticeMapper {
	NoticeDto selectNoticeById(int id);

	int insertNotice(NoticeDto notice);

	/* List<NoticeDto> selectNoticeAll(); */

	int updateNotice(NoticeDto dto);

	int deleteNotice(int id);
	
	void insertFile(@Param("noticeId") int noticeId, @Param("fileName") String fileName);
	
	void deleteByMemberId(String id);
	//페이지네이션
	List<NoticeDto> listNoticePage(@Param("from") int from, @Param("row") int row);
	
	int countNotice();


}










