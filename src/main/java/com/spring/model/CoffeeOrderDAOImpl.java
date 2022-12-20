package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CoffeeOrderDAOImpl implements CoffeeOrderDAO {

	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public CoffeeBeanDTO getProduct(int beans_num) {
		return this.sqlSession.selectOne("product", beans_num);
	}
	
	@Override
	public FinalMemberDTO getMemberCont(int member_num) {
		return this.sqlSession.selectOne("getMemberCont", member_num);
	}
	
	@Override
	public List<CoffeeOrderDTO> getCartListFin(List<Integer> cartList) {
		return this.sqlSession.selectList("getCartListFin", cartList);
	}

	// 주문 테이블 등록하기 & 재고 마이너스 처리 (여러상품 주문일 경우 & 장바구니통해서 주문)
	@Override
	public int insertOrder(List<CoffeeOrderDTO> orderDto) {
		return this.sqlSession.update("insertOrder", orderDto);
	}
	// 한번에 여러행 추가 방법 : https://aljjabaegi.tistory.com/528

	@Override
	public int updateBeanCnt(List<CoffeeOrderDTO> orderDto) {
		return this.sqlSession.update("updateBeanCnt", orderDto);
	}
	
	// 주문 테이블 등록하기 & 재고 마이너스 처리 (바로가기 주문일 경우)
	@Override
	public int insertOneOrder(CoffeeOrderDTO orderDto) {
		return this.sqlSession.insert("insertOneOrder", orderDto);
	}
	
	@Override
	public int updateOneBeanCnt(CoffeeOrderDTO orderDto) {
		return this.sqlSession.update("updateOneBeanCnt", orderDto);
	}
	
	// 업데이트 포인트
	@Override
	public int updatePoint(Map<String, Object> map) {
		return this.sqlSession.update("updatePoint", map);
	}

	// 장바구니 삭제
	@Override
	public int deleteCart(List<CoffeeOrderDTO> orderDto) {
		return this.sqlSession.delete("deleteCart", orderDto);
	}

	// 주문내역
	@Override
	public List<CoffeeOrderDTO> getNowOrderList(String order_num) {
		return this.sqlSession.selectList("nowOrderList", order_num);
	}

	// 주문내역 리스트
	@Override
	public List<CoffeeOrderDTO> getOrderList(int member_num) {
		return this.sqlSession.selectList("getOrderList", member_num);
	}

	// 주문내역 리스트(일자지정)
	@Override
	public List<CoffeeOrderDTO> getOrderListDate(Map<String, Object> dateMap) {
		return this.sqlSession.selectList("getOrderListDate", dateMap);
	}

	// 전체 주문취소
	@Override
	public int updateOrderAllCancel(String order_num) {
		return this.sqlSession.update("updateOrderAllCancel", order_num);
	}

	// 포인트 사용시 사용 취소
	@Override
	public int updateUsePointCancel(Map<String, Integer> memMap) {
		return this.sqlSession.update("updateUsePointCancel", memMap);
	}
	
	


	

	
	
	

	

	
	

	
}
