package com.spring.model;

import java.util.List;
import java.util.Map;

public interface CoffeeCartDAO {
	
	// 상품 정보 가져오는 메서드
	CoffeeBeanDTO getProduct(int beans_num);
	
	// 장바구니 업데이트 메서드
	CoffeeCartDTO getCart(Map<String, Integer> cartMap);
	int insertCart(CoffeeCartDTO cartDTO);
	int updateCart(Map<String, Integer> cartMap);
	
	// 장바구니에서 수량, 그람 추가시 업데이트 메서드
	
	// 장바구니 가져오는 메서드
	List<CoffeeCartDTO> getCartList(int member_num);
	
	// 찜하기 메서드(만약 찜한 데이터가 있으면 db수정, 없을경우 db추가)
	int inHeart(Map<String, Integer> heartMap);
	
	void insertHeart(Map<String, Integer> heartMap);
	
	void updateHeart(Map<String, Integer> heartMap);
	
}
