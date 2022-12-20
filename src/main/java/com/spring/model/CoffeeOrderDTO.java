package com.spring.model;

import lombok.Data;

@Data
public class CoffeeOrderDTO {

	private String order_num;
	private int order_row;
	private int order_cnt;
	private int order_price;		// 단가 * 수량 * (그람/100)
	private String order_date;
	private int beans_num;
	private String beans_name;
	private int beans_price;		// 단가
	private String beans_taste;		
	private int cart_weight;
	private int cart_grind;
	private int member_num;
	private int use_point;
	
	// 테이블 외 필요
	private int cart_num;			// 장바구니 번호
	private String beans_img;		// 상품 이미지
	private String order_month;
}


