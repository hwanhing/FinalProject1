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
	public int insert(Map<String, Object> map) {
		
		return this.sqlSession.insert("Add", map);
	}


	



	
	

	
}
