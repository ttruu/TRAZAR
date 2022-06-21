package com.hys.trazar.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class RequestDto {
	private int id;
	private String title;
	private String body;
	private int designBoardId;
	private String memberId;
	private String price;
	private LocalDateTime inserted;
	private String phoneNum;
	private String term;
	private String state;
	private String m_id;
}
