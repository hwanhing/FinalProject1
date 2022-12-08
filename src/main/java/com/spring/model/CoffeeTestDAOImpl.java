package com.spring.model;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;

public class CoffeeTestDAOImpl implements CoffeeTestDAO{
	
	@Inject
	private SqlSessionTemplate sqlSession;

	
	
}
