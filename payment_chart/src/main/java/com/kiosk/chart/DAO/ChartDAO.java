package com.kiosk.chart.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDAO implements ChartDAOImpl {

	@Autowired
	SqlSession sqlSession;
	
	public static void main(String[] args) {
		
	}

	@Override
	public String selectOne(String value) {
		String password = sqlSession.selectOne("chart.selectOne", value);
		
		return password;
	}

}
