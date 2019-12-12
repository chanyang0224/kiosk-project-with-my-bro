package com.project.kiosk.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.kiosk.service.KioskService;
import com.project.kiosk.vo.KioskVO;

@Controller
public class MainController {
	
	@Autowired
	KioskService service;
	
	@RequestMapping(value="/main", method= RequestMethod.GET)
	public String main(Model model) {
		List<KioskVO> coffee = service.coffee();
		model.addAttribute("coffee", coffee);
		
		return "main/main";
	}

}
