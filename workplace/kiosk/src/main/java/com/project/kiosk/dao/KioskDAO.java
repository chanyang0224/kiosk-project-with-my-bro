package com.project.kiosk.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kiosk.vo.KioskVO;

@Repository
public class KioskDAO implements KioskDAOImpl{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<KioskVO> selectAll() {
		
		return sqlSession.selectList("kiosk.selectAll");
	}

	@Override
	public List<KioskVO> selectCoffee() {
		
		return sqlSession.selectList("kiosk.selectCoffee");
	}

	@Override
	public List<KioskVO> selectJuice() {
		
		return sqlSession.selectList("kiosk.selectJuice");
	}

	@Override
	public List<KioskVO> selectIceTea() {
		
		return sqlSession.selectList("kiosk.selectIceTea");
	}

	@Override
	public List<KioskVO> selectTea() {
		
		return sqlSession.selectList("kiosk.selectTea");
	}

	@Override
	public List<KioskVO> selectDessert() {
		
		return sqlSession.selectList("kiosk.selectDessert");
	}

}
