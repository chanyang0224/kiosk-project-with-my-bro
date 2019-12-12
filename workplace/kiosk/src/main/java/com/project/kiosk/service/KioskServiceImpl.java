package com.project.kiosk.service;

import java.util.List;

import com.project.kiosk.vo.KioskVO;

public interface KioskServiceImpl {
	public List<KioskVO> coffee();
	public List<KioskVO> juice();
	public List<KioskVO> icetea();
	public List<KioskVO> tea();
	public List<KioskVO> dessert();
}
