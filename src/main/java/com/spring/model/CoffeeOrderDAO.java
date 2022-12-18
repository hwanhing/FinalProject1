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
	List<CoffeeOrderDTO> getCartListFin(List<Integer> cartList);
	
	// 주문 테이블 등록하기 & 재고 마이너스 처리 (여러상품 주문일 경우 & 장바구니통해서 주문)
	int insertOrder(List<CoffeeOrderDTO> orderDto);
	int updateBeanCnt(List<CoffeeOrderDTO> orderDto);
	
	// 주문 테이블 등록하기 & 재고 마이너스 처리 (바로가기 주문일 경우)
	int insertOneOrder(CoffeeOrderDTO orderDto);
	int updateOneBeanCnt(CoffeeOrderDTO orderDto);
	
	// 멤버 포인트 업데이트
	int updatePoint(Map<String, Object> map);
	
	// 장바구니 삭제
	int deleteCart(List<CoffeeOrderDTO> orderDto);
	
	// 주문목록 가져오기
	List<CoffeeOrderDTO> getNowOrderList(String order_num);
	
	// 주문목록 가져오기(list)
	List<CoffeeOrderDTO> getOrderList(int member_num);
}
