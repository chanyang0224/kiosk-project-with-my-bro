package com.project.kiosk.dao;

import java.util.List;

import com.project.kiosk.vo.KioskInsertVO;
import com.project.kiosk.vo.KioskVO;

/* "DAO(Data Access Object)"의 명세서 */
public interface KioskDAOImpl {
	public List<KioskVO> selectAll();
	public List<KioskVO> selectCoffee();
	public List<KioskVO> selectJuice();
	public List<KioskVO> selectIceTea();
	public List<KioskVO> selectTea();
	public List<KioskVO> selectDessert();
	public void insertData(KioskInsertVO vo);
}
