package com.project.kiosk.service;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.kiosk.dao.KioskDAO;

import com.project.kiosk.vo.KioskVO;

@Service
public class KioskService implements KioskServiceImpl {
	
	@Autowired
	KioskDAO dao;

	@Override
	public List<KioskVO> coffee() {
		List<KioskVO> coffee = dao.selectCoffee();
		
		return coffee;
	}

	@Override
	public List<KioskVO> juice() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<KioskVO> icetea() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<KioskVO> tea() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<KioskVO> dessert() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
