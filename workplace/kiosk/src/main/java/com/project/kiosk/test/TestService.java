package com.project.kiosk.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {
	
	@Autowired
	private TestMapper mapper;
	
	public String selectNow() {
		// TODO Auto-generated method stub
		return mapper.selectNow();
	}

}
