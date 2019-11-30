package com.project.kiosk.dessert;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DessertController {
	
	@RequestMapping(value="/dessert", method= RequestMethod.GET)
	public String main(Model model) {
		// TODO Auto-generated method stub
		return "dessert/dessert";
	}

}
