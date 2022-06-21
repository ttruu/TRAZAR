package com.hys.trazar.domain.alaram;

import com.hys.trazar.domain.login.SignupDto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AlaramDto {
	
	    private SignupDto target;
	    private String message;
	}

