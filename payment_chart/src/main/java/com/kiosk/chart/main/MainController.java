package com.kiosk.chart.main;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kiosk.chart.Service.ChartService;

@Controller
public class MainController {
	
	@Autowired
	ChartService service;
	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String main(Model model, HttpServletRequest req) {		
		
		// window 스케줄링 프로그램을 통해 kiosk_chart.exe 프로그램을 주기적(매일 00시)으로 실행
		/*
		 * String exeFile = "C:\\Java\\workplace\\kiosk_chart\\kiosk_chart.exe"; Runtime
		 * rt = Runtime.getRuntime(); Process p;
		 * 
		 * try { p = rt.exec(exeFile); p.waitFor(); System.out.println("실행 완료"); } catch
		 * (Exception e) { e.printStackTrace(); }
		 */
		
		String value = (String) req.getParameter("id");
		String user_pw = (String) req.getParameter("pw");
		System.out.println("id :" + value);
		System.out.println("user_pw :" + user_pw);
		
		String month = "1월";
		String svg = "mon_1.svg";
		model.addAttribute("month", month);
		model.addAttribute("svg", svg);
		
		try {
			String pw = service.userselect(value);
			if (pw == null) {
				System.out.println("pw is null");
				pw = "pw is null";
			}
			System.out.println(pw);
			if (pw.equals(user_pw)) {
				return "main";
			} else {
				String msg = "아이디와 비밀번호를 확인해주세요";
				model.addAttribute("msg", msg);
				return "home";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg = "아이디와 비밀번호를 확인해주세요";
		model.addAttribute("msg", msg);
		
		return "home";
	}
	
	@RequestMapping(value = "/choice", method = RequestMethod.POST)
	public String choice(Model model, HttpServletRequest req) {
		String svg;
		String month = req.getParameter("month");
		String[] month_arr = month.split("월");
		svg = "mon_" + month_arr[0] + ".svg";
		model.addAttribute("month", month);
		model.addAttribute("svg", svg);
		
		return "main";
	}
	
}
