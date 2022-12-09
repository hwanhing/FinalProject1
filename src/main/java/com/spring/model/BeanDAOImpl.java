package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public CoffeeBeanDTO getBeanContent(int num) {
		return this.sqlSession.selectOne("Cont", num);
	}


	@Override
	public CoffeeStarDTO seHeart(Map<String, Integer> map) {
		return this.sqlSession.selectOne("heartmap1", map);
	}


	@Override
	public void insertHeart(Map<String, Integer> map) {
		this.sqlSession.selectOne("insertHeart1", map);
		
	}


	@Override
	public void updateHeart(Map<String, Integer> map) {
		this.sqlSession.selectOne("updateHeart1", map);
		
	}


	@Override
	public List<CoffeeWriteDTO> getWriteList() {
		return this.sqlSession.selectList("writeList");
	}


	@Override
	public int seWrite(Map<String, Object> map) {
		return this.sqlSession.insert("insertWrite", map);
	}





















	



	
	

	
}
