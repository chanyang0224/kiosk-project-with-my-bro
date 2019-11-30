package com.project.kiosk.tea;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TeaController {
	
	@RequestMapping(value="/tea", method= RequestMethod.GET)
	public String main(Model model) {
		// TODO Auto-generated method stub
		return "tea/tea";
	}

}
