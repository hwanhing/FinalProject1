package com.spring.model;

import lombok.Data;

@Data
public class CoffeeCartDTO {
	
	// 테이블
	private int cart_num;
	private int beans_num;
	private int beans_price;
	private int cart_cnt;
	private int cart_weight;
	private int cart_grind;
	private int member_num;
	
	// 테이블 외 필요
	private String beans_name;
	private String beans_taste;
	private String beans_img;
	private String beans_url;
	private int coffee_heart;
	
}


