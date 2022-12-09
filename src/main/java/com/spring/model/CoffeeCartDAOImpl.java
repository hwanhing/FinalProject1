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
	
	// 장바구니 페이지 전 >> 장바구니 페이지 : 장바구니 추가 또는 수정 ---------------------------------------------
	@Override
	public CoffeeCartDTO getCart(Map<String, Integer> cartMap) {
		return this.sqlSession.selectOne("findCart", cartMap);
	}

	@Override
	public int insertCart(CoffeeCartDTO cartDTO) {
		return this.sqlSession.insert("insertCart", cartDTO);
	}
	
	@Override
	public int updateCart(Map<String, Integer> cartMap) {
		return this.sqlSession.update("updateCart", cartMap);
	}
	
	@Override
	public List<CoffeeCartDTO> getCartList(int member_num) {
		return this.sqlSession.selectList("getCartList", member_num);
	}

	
	
	// 장바구니 페이지 : 찜 --------------------------------------------------------------------------------
	@Override
	public CoffeeCartDTO inHeart(Map<String, Integer> heartMap) {
		return this.sqlSession.selectOne("heartMap",heartMap);
	}

	@Override
	public void insertHeart(Map<String, Integer> heartMap) {
		this.sqlSession.selectOne("insertHeart",heartMap);
	}

	@Override
	public void updateHeart(Map<String, Integer> heartMap) {
		this.sqlSession.selectOne("updateHeart",heartMap);
	}
	
	// 장바구니 페이지 : 장바구니 row 삭제 -------------------------------------------------------------------
	@Override
	public int deleteCartRow(int cartNum) {
		return this.sqlSession.delete("deleteCartNum",cartNum);
	}
	
	// 장바구니 페이지 : 수량 ------------------------------------------------------------------------------
	@Override
	public int updateCartCnt(Map<String, Integer> cartCntMap) {
		return this.sqlSession.update("updateCartCnt",cartCntMap);
	}

	
	

	
	


}
