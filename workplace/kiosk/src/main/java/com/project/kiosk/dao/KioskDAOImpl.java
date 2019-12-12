package com.project.kiosk.dao;

import java.util.List;

import com.project.kiosk.vo.KioskVO;

public interface KioskDAOImpl {
	public List<KioskVO> selectAll();
	public List<KioskVO> selectCoffee();
	public List<KioskVO> selectJuice();
	public List<KioskVO> selectIceTea();
	public List<KioskVO> selectTea();
	public List<KioskVO> selectDessert();
}
