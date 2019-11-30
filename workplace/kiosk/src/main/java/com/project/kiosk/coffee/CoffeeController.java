package com.project.kiosk.coffee;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CoffeeController {
	
	@RequestMapping(value="/coffee", method= RequestMethod.GET)
	public String main(Model model) {
		// TODO Auto-generated method stub
		return "coffee/coffee";
	}

}
