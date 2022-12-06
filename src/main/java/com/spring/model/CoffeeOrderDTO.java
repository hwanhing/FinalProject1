package com.spring.model;

import lombok.Data;

@Data
public class CoffeeOrderDTO {

	private String order_num;
	private int order_row;
	private int order_cnt;
	private int order_price;
	private String order_date;
	private int beans_num;
	private String beans_name;
	private int beans_price;
	private String beans_taste;
	private int cart_weight;
	private int cart_grind;
	private int member_num;
}


