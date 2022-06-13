package com.hys.trazar.domain;

import java.time.LocalDateTime;
import java.util.List;



import lombok.Data;

@Data
public class NoticeDto {
	private int id;
	private String title;
	private String body;
	private LocalDateTime inserted;
	

}
