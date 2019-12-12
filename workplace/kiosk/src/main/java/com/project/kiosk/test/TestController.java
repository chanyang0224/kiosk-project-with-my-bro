package com.project.kiosk.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@Autowired
	private TestService service;
	
	@RequestMapping("/selectNow.do")
	public String selectNow(Model model) {
		// TODO Auto-generated method stub
		String result = service.selectNow();
		System.out.println(result);
		
		model.addAttribute("serverTime", result);
		
		return "test";
	}

}
