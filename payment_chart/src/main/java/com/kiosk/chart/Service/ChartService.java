package com.kiosk.chart.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiosk.chart.DAO.ChartDAO;

@Service
public class ChartService implements ChartServiceImpl {
	
	@Autowired
	ChartDAO chartdao;

	@Override
	public String userselect(String value) {
		String password = chartdao.selectOne(value);
		
		return password;
	}
}
