package com.hys.trazar.domain;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class DesignBoardDto {
	private int clicked;
	private int id;
	private String memberId;
	private String title;
	private String body;
	private String price;
	private LocalDateTime inserted;
	private String writerNickName;
	private List<MultipartFile> fileName;
	//private List<String> uploadfiles;
	private String imgthumbnail;
	private String categoryName;
	
	public String getPrettyInserted() {
		// 24시간 이내면 시간만
		// 이전이면 년-월-일
		LocalDateTime now = LocalDateTime.now();
		if (now.minusHours(24).isBefore(inserted)) {
			return inserted.toLocalTime().toString();
		} else {
			return inserted.toLocalDate().toString();
		}
	}
	

}
