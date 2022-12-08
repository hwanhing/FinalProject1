package com.spring.model;

import lombok.Data;

@Data
public class FinalMemberDTO {

	private int member_num;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_birth;
	private String member_email;
	private String member_phone;
	private String member_date;
	private String member_img;
	private String member_addr;
	private String member_addr2;
	private String member_addr3;
	private String member_addr4;
	private String member_addr5;
	private int member_point;		// 주문금액의 5%
	private int test_num;
	private int member_use;
	
	//그외 
	

	private String test_name;
	private String test_full_name;
	private String test_info;
	private String test_match_coffee;
	private String test_mate;
	private String test_img;
	
	private int beans_num;
	private double coffee_star;
	private int coffee_heart;

	private String beans_name;
	private int beans_price;
	private int beans_weight;
	private String beans_taste;
	private String beans_intro;
	private String beans_img;
	private String beans_url;
	
}


