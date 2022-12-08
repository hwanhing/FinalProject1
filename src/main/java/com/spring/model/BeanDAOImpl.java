package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BeanDAOImpl implements BeanDAO{
	
	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CoffeeBeanDTO> getBeanList() {
		
		return this.sqlSession.selectList("list");
	}


	@Override
	public List<CoffeeBeanDTO> getBeanHeartList() {
		
		return this.sqlSession.selectList("heartlist");
	}
	
	@Override
	public List<CoffeeBeanDTO> BeanPriceDownList() {
		
		return this.sqlSession.selectList("pricedownlist");
	}	

	@Override
	public List<CoffeeBeanDTO> BeanPriceUpList() {
		return this.sqlSession.selectList("priceuplist");
	}	
	
	@Override
	public CoffeeStarDTO selectBean(Map<String, Object> map) {
		
		return this.sqlSession.selectOne("Bean_select", map);
	}	
	
/*	@Override
	public int insertHeart(Map<String, Object> map) {
		
		return this.sqlSession.insert("Heart_insert", map);
	} */
	
	
	
/*	@Override
	public int update(Map<String, Object> map) {
		
		return this.sqlSession.insert("Del", map);
	}*/
	
	@Override
	public CoffeeBeanDTO getBeanContent(int num) {
		return this.sqlSession.selectOne("Cont", num);
	}
















	



	
	

	
}
