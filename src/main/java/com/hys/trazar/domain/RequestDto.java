package com.hys.trazar.domain;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RequestDto {
	private int id;
	private String title;
	private String body;
	private String memberId;
	private String price;
	private LocalDateTime inserted;
	private String phoneNum;
	private String term;
	private String state;
	private String imgthumbnail;
	private String getImg;
}
