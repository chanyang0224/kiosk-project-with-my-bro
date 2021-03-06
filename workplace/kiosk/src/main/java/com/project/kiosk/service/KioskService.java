package com.project.kiosk.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.kiosk.dao.KioskDAO;
import com.project.kiosk.vo.KioskInsertVO;
import com.project.kiosk.vo.KioskVO;

/* "Service" 객체로써 DAO를 통해 받아온 DB의 데이터를 가지고 여러 로직을 수행한 후 값을 반환 */
/* "@Service" 어노테이션을 사용함으로써 Service 객체임을 표현 */
@Service
public class KioskService implements KioskServiceImpl {
	
	/* "DAO" 객체를 자동 주입 */
	@Autowired
	KioskDAO dao;

	@Override
	public List<KioskVO> coffee() {
		/* 로직의 수행. DAO 객체에서 받아온 값을 List 타입의 객체에 할당함 */
		List<KioskVO> coffee = dao.selectCoffee();
		
		/* coffee 객체를 반환 */
		return coffee;
	}

	@Override
	public List<KioskVO> juice() {
		// DAO 객체에서 받아온 값을 List 타입의 객체에 할당
		List<KioskVO> juice = dao.selectJuice();
		
		// juice 객체를 반환
		return juice;
	}

	@Override
	public List<KioskVO> icetea() {
		// DAO 객체에서 받아온 값을 List 타입의 객체에 할당
		List<KioskVO> icetea = dao.selectIceTea();
		
		// icetea 객체를 반환
		return icetea;
	}

	@Override
	public List<KioskVO> tea() {
		// DAO 객체에서 받아온 값을 List 타입의 객체에 할당
		List<KioskVO> tea = dao.selectTea();
		
		// tea 객체를 반환
		return tea;
	}

	@Override
	public List<KioskVO> dessert() {
		// DAO 객체에서 받아온 값을 List 타입의 객체에 할당
		List<KioskVO> dessert = dao.selectDessert();
		
		// dessert 객체를 반환
		return dessert;
	}

	@Override
	public void insertData(KioskInsertVO vo) {
		dao.insertData(vo);
		
	}
	
}
