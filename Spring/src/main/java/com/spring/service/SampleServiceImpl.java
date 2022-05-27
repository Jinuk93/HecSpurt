package com.spring.service;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor //생성자에 의한 주입
public class SampleServiceImpl implements SampleService {

	@Override
	public Integer doAdd(String str1, String str2) {
		return Integer.parseInt(str1) + Integer.parseInt(str2);
	}
	
	
	

}
