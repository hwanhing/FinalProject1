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
		System.out.println("-------------cartDAOImpl insertCart-----------");
		System.out.println(this.sqlSession.insert("insertCart", cartDTO ));
		return this.sqlSession.insert("insertCart", cartDTO );
	}
	
	@Override
	public int updateCart(Map<String, Integer> cartMap) {
		System.out.println("-------------cartDAOImpl updateCart-----------");
		System.out.println(this.sqlSession.update("updateCart", cartMap));
		return this.sqlSession.update("updateCart", cartMap);
	}
	
	
	@Override
	public List<CoffeeCartDTO> getCartList(int member_num) {
		return this.sqlSession.selectList("getCartList", member_num);
	}

	@Override
	public int inHeart(Map<String, Integer> heartMap) {
		
		return this.sqlSession.selectOne("heartMap",heartMap);
	}

	@Override
	public void insertHeart(Map<String, Integer> heartMap) {
		System.out.println("-------------cartDAOImpl insertHeart-----------");
		System.out.println(this.sqlSession.selectOne("insertHeart",heartMap));
		this.sqlSession.selectOne("insertHeart",heartMap);
	}

	@Override
	public void updateHeart(Map<String, Integer> heartMap) {
		System.out.println("-------------cartDAOImpl updateHeart-----------");
		System.out.println(this.sqlSession.selectOne("updateHeart",heartMap));
		this.sqlSession.selectOne("updateHeart",heartMap);
		//return this.sqlSession.selectOne("updateHeart",heartMap);
	}
	

	
	


}
