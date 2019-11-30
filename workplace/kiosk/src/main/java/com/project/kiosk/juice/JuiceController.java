package com.project.kiosk.juice;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JuiceController {
	
	@RequestMapping(value="/juice", method= RequestMethod.GET)
	public String main(Model model) {
		// TODO Auto-generated method stub
		return "juice/juice";
	}

}
