package com.hys.trazar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hys.trazar.domain.ReviewDto;
import com.hys.trazar.mapper.TestMapper;

@Service
public class TestService {

	@Autowired
	private TestMapper mapper;
	
	public List<ReviewDto> listTest() {
		return mapper.selectTest();
	}

	public ReviewDto getTest(int id) {
		return mapper.getTest(id);
	}

	public boolean updateTest(ReviewDto review) {
		int cnt = mapper.updateTest(review);
		
		return cnt == 1;
	}

	@Transactional
	public boolean removeTestById(int id) {

		int cnt = mapper.deleteTest(id);
		
		return cnt == 1;
	}

	public boolean addTest(ReviewDto review) {
		
		int cnt = mapper.insertTest(review);
		
		return cnt == 1;
	}

	
}
