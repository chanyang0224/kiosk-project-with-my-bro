package com.kiosk.chart.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		String msg = "&#9743; 자세한 문의는 가맹점에 연락주세요";
		model.addAttribute("msg", msg);
		return "home";
	}
	
}
