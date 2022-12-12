package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

public interface CoffeeOrderDAO {

	// 상품 정보 가져오는 메서드
	CoffeeBeanDTO getProduct(int beans_num);
		
	// 멤버 정보 가져오기
	FinalMemberDTO getMemberCont(int member_num);
	
	// 장바구니 목록 가져오기
	List<CoffeeOrderDTO> getCartListFin(int member_num);
	
	// 장바구니 테이블 등록하기
	int insertOrder(List<CoffeeOrderDTO> orderDto);
	
	// 판매된 상품 재고 마이너스 처리
	int updateBeanCnt(List<CoffeeOrderDTO> orderDto);
	
	// 장바구니 삭제
	int deleteCart(List<CoffeeOrderDTO> orderDto);
}
