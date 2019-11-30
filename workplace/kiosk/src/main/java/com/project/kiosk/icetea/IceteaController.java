package com.project.kiosk.icetea;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IceteaController {
	
	@RequestMapping(value="/icetea", method= RequestMethod.GET)
	public String main(Model model) {
		// TODO Auto-generated method stub
		return "icetea/icetea";
	}

}
