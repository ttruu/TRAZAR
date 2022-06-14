package com.hys.trazar.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class RequestDto {
	private int id;
	private String title;
	private String body;
	private int designBoardId;
	private String managerId;
	private String designerId;
	private String customerId;
	private String price;
	private LocalDateTime inserted;
}
