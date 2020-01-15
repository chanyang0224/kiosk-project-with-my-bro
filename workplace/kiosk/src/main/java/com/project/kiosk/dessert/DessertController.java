package com.project.kiosk.dessert;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.kiosk.service.KioskService;
import com.project.kiosk.vo.KioskVO;

@Controller
public class DessertController {
	
	@Autowired
	KioskService service;
	
	@RequestMapping(value="/dessert", method= RequestMethod.GET)
	public String main(Model model) {
		List<KioskVO> dessert = service.dessert();
		model.addAttribute("dessert", dessert);
		
		return "dessert/dessert";
	}

}
