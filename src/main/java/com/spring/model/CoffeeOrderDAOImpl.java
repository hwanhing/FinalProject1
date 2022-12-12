package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CoffeeOrderDAOImpl implements CoffeeOrderDAO {

	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public CoffeeBeanDTO getProduct(int beans_num) {
		return this.sqlSession.selectOne("product", beans_num);
	}
	
	@Override
	public FinalMemberDTO getMemberCont(int member_num) {
		return this.sqlSession.selectOne("getMemberCont", member_num);
	}
	
	@Override
	public List<CoffeeOrderDTO> getCartListFin(int member_num) {
		return this.sqlSession.selectList("getCartListFin", member_num);
	}

	@Override
	public int insertOrder(List<CoffeeOrderDTO> orderDto) {
		return this.sqlSession.update("insertOrder", orderDto);
	}
	// 한번에 여러행 추가 방법 : https://aljjabaegi.tistory.com/528

	@Override
	public int updateBeanCnt(List<CoffeeOrderDTO> orderDto) {
		return this.sqlSession.update("updateBeanCnt", orderDto);
	}

	@Override
	public int deleteCart(List<CoffeeOrderDTO> orderDto) {
		return this.sqlSession.delete("deleteCart", orderDto);
	}

	
	

	
}
