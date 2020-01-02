package com.project.kiosk.home;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.kiosk.service.KioskService;
import com.project.kiosk.vo.KioskInsertVO;
import com.project.kiosk.vo.KioskPaymentVO;

/* 컨트롤러 임을 나타내는 어노테이션 */
@Controller
public class HomeController {

	@Autowired
	KioskService service;

	/* client 요청에 따라 View의 이름을 반환하는 어노테이션 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		/* View의 이름을 String 타입으로 반환 */
		/* 여기서는 home 폴더 하위(/)의 home.jsp를 말함 */
		return "home/home";
	}

	@ResponseBody
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String insert(@RequestBody KioskPaymentVO payment_vo, Locale locale, Model model, HttpServletRequest req) {
		KioskInsertVO vo = new KioskInsertVO();

		Date now = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy/MM/dd", locale);
		SimpleDateFormat format2 = new SimpleDateFormat("HH:mm", locale);
		String charge_date = format1.format(now);
		String charge_time = format2.format(now);
		System.out.println(charge_date);
		System.out.println(charge_time);
		String payment_data = String.valueOf(payment_vo.getPayment_data());
		String take_out = (String) payment_vo.getTake_out().values().toArray()[0];

		System.out.println(payment_data);
		System.out.println(take_out);

		if (payment_data != null) {
			vo.setCharge_date(charge_date);
			vo.setCharge_time(charge_time);
			vo.setProduct_data(payment_data);
			vo.setTake_out(take_out);

			service.insertData(vo);
		}

		System.out.println("FINISH");
		
		/* View의 이름을 String 타입으로 반환 */
		/* 여기서는 home 폴더 하위(/)의 home.jsp를 말함 */
		return "home/home";
	}

}
