package com.project.kiosk.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kiosk.vo.KioskInsertVO;
import com.project.kiosk.vo.KioskVO;

/* "DAO(Data Access Object)"로써 DB와 직접 연결된 객체 */
/* "@Repository" 어노테이션을 통해 DAO를 표현 */
@Repository
public class KioskDAO implements KioskDAOImpl{
	
	/* "@Autowired" 어노테이션을 통해 SqlSession bean을 자동 주입 */
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<KioskVO> selectAll() {
		/* sqlSession.method(namespace.id) 형식으로 사용하여 mapper에 등록된 SQL문을 사용함 */
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

	@Override
	public void insertData(KioskInsertVO vo) {
		sqlSession.insert("kiosk.insertData", vo);
		
	}

}
