package com.project.kiosk.service;

import java.util.List;

import com.project.kiosk.vo.KioskInsertVO;
import com.project.kiosk.vo.KioskVO;

/* "Service" 객체의 명세서 */
public interface KioskServiceImpl {
	public List<KioskVO> coffee();
	public List<KioskVO> juice();
	public List<KioskVO> icetea();
	public List<KioskVO> tea();
	public List<KioskVO> dessert();
	public void insertData(KioskInsertVO vo);
}
