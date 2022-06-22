package com.hys.trazar.service;

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
import com.hys.trazar.domain.RequestDto;
import com.hys.trazar.mapper.DesignBoardMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class DesignBoardService {

	@Autowired
	private DesignBoardMapper mapper;

	//private S3Client s3;

	/*
	@Value("${aws.s3.bucketName}")
	private String bucketName;
	*/
	
	// get service
	public DesignBoardDto getDesignBoardById(int id) {
		DesignBoardDto designBoard = mapper.selectDesignBoardById(id);

		return designBoard;
	}

	/*
	// 객체가 생성되자마자 실행되는 메소드
	@PostConstruct
	public void init() {
		Region region = Region.AP_NORTHEAST_2;
		this.s3 = S3Client.builder().region(region).build();
	}

	@PreDestroy
	public void destroy() {
		this.s3.close();
	}
	*/
	
	
	// insert service
	@Transactional
	public boolean insertDesignBoard(DesignBoardDto designBoard) {
		// 게시물 등록
		int cnt = mapper.insertDesignBoard(designBoard);

		//addFiles(designBoard.getId(), files);

		return cnt == 1;
	}
	
	/*
	private void addFiles(int id, MultipartFile[] files) {
		// 파일 등록
		if (files != null) {
			for (MultipartFile file : files) {

				if (file.getSize() > 0) {
					mapper.insertFile(id, file.getOriginalFilename()); // db에 쓰는 일
					// saveFile(board.getId(), file); // 파일시스템에 저장
					// save 두개를 다 할순없음
					saveFileAwsS3(id, file); // aws s3에 업로드 하는 일을 해줌
				}
			}
		}
	}

	private void saveFileAwsS3(int id, MultipartFile file) {

		String key = "designBoard/" + id + "/" + file.getOriginalFilename();

		PutObjectRequest putObjectRequest = PutObjectRequest.builder().acl(ObjectCannedACL.PUBLIC_READ)
				.bucket(bucketName).key(key).build();

		RequestBody requestBody;
		try {
			requestBody = RequestBody.fromInputStream(file.getInputStream(), file.getSize());
			s3.putObject(putObjectRequest, requestBody);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	 */
	
	// list service	
	public List<DesignBoardDto> listDesignBoard() {
		return mapper.selectDesignBoardAll();
	}
	
	// modify service
	public boolean updateDesignBoard(DesignBoardDto dto) {
		int cnt = mapper.updateDesignBoard(dto);
		return cnt == 1;
	}

	// remove service
	public boolean deleteDesignBoard(int id) {
		return mapper.deleteDesignBoard(id) == 1;
	}
	//멤버 아이디로 가져오기 디자이너 정보용 리스트 
	public List<DesignBoardDto> myDesignBoard(String memberId) {
		return mapper.myDesignBoard(memberId);
	}
}
