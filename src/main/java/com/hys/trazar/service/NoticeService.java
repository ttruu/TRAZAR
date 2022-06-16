package com.hys.trazar.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.hys.trazar.domain.DesignBoardDto;
import com.hys.trazar.domain.NoticeDto;
import com.hys.trazar.mapper.NoticeMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class NoticeService {
	@Autowired
	private NoticeMapper mapper;
	
	public NoticeDto getNoticeById(int id) {
		NoticeDto notice = mapper.selectNoticeById(id);
		
		return notice;
	}

	
	
	public List<NoticeDto> listNotice(String type, String keyword) {
		return mapper.selectNoticeAll(type, "%" + keyword + "%");
	}

	public NoticeDto getNotice(int id) {
		return mapper.getNotice(id);
	}

	public boolean updateNotice(NoticeDto notice) {
		int cnt = mapper.updateNotice(notice);
		
		return cnt == 1;
	}

	@Transactional
	public boolean removeNoticeById(int id) {


	
		int cnt = mapper.deleteNotice(id);
		
		return cnt == 1;
	}

	public boolean addNotice(NoticeDto notice) {
		
		
		int cnt = mapper.insertNotice(notice);
		
		return cnt == 1;
	}
	
}




