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
	
	// 장바구니 가져오는 메서드
	List<CoffeeCartDTO> getCartList(int member_num);
	
	
}
