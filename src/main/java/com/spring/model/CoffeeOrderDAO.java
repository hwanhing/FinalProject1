package com.spring.model;

import java.util.List;

import javax.inject.Inject;

public interface CoffeeOrderDAO {

	// 멤버 정보 가져오기
	FinalMemberDTO getMemberCont(int member_num);
	
	// 장바구니 목록 가져오기
	List<CoffeeOrderDTO> getCartListFin(int member_num);
}
