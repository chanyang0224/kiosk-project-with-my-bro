package com.project.kiosk.coffee;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CoffeeController {
	
	/* @ResponseBody */
	@RequestMapping(value="/coffee", method= RequestMethod.GET)
	public String main(
			/*
			 * @RequestParam int idx,
			 * 
			 * @RequestParam int cnt,
			 * 
			 * @RequestParam List<String> arrProduct,
			 * 
			 * @RequestParam List<String> arrPrice,
			 * 
			 * @RequestParam HashMap<String, Integer> dictProduct,
			 * 
			 * @RequestParam HashMap<String, Integer> dictCheck,
			 * 
			 * @RequestParam String take_out,
			 */
			Model model) {
		/*
		 * System.out.println(idx); System.out.println(cnt);
		 * System.out.println(arrProduct); System.out.println(arrPrice);
		 * System.out.println(dictProduct); System.out.println(dictCheck);
		 * System.out.println(take_out);
		 */
		return "coffee/coffee";
	}

}
