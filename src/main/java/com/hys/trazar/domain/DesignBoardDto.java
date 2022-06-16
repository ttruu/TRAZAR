package com.hys.trazar.domain;

import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;

@Data
public class DesignBoardDto {
	private int id;
	private String memberId;
	private String title;
	private String body;
	private String price;
	private LocalDateTime inserted;
	private String writerNickName;
	private List<String> fileName;
	private String imgthumbnail;
	
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
	
	public String getImgthumbnails(){
		// 썸네일  
		if(imgthumbnail!=null){
			if(imgthumbnail.startsWith("http")){
				return imgthumbnail;
			}else{
				return "/static/images/thumbnails/"+imgthumbnail;
			}
		}
		return "/static/images/";
	}
}
