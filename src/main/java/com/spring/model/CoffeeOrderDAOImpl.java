package com.spring.model;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CoffeeOrderDAOImpl implements CoffeeOrderDAO {

	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public FinalMemberDTO getMemberCont(int member_num) {
		return this.sqlSession.selectOne("getMemberCont", member_num);
	}
	
	@Override
	public List<CoffeeOrderDTO> getCartListFin(int member_num) {
		return this.sqlSession.selectList("getCartListFin", member_num);
	}

	
}
