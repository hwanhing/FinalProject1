package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CoffeeCartDAOImpl implements CoffeeCartDAO {

	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public CoffeeBeanDTO getProduct(int beans_num) {
		return this.sqlSession.selectOne("product", beans_num);
	}
	
	@Override
	public CoffeeCartDTO getCart(Map<String, Integer> cartMap) {
		return this.sqlSession.selectOne("findCart", cartMap);
	}

	@Override
	public int insertCart(CoffeeCartDTO cartDTO) {
		return this.sqlSession.insert("insertCart", cartDTO );
	}
	
	@Override
	public int updateCart(Map<String, Integer> cartMap) {
		return this.sqlSession.update("updateCart", cartMap);
	}
	
	
	@Override
	public List<CoffeeCartDTO> getCartList(int member_num) {
		return this.sqlSession.selectList("getCartList", member_num);
	}
	

	
	


}
