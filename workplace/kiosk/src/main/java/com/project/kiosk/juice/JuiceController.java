package com.project.kiosk.juice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.kiosk.service.KioskService;
import com.project.kiosk.vo.KioskVO;

@Controller
public class JuiceController {
	
	@Autowired
	KioskService service;
	
	@RequestMapping(value="/juice", method= RequestMethod.GET)
	public String main(Model model) {
		List<KioskVO> juice = service.juice();
		model.addAttribute("juice", juice);
		
		return "juice/juice";
	}

}
;