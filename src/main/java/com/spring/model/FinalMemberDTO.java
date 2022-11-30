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
	private int member_point;		// 주문금액의 5%
	private int test_num;
	private int member_use;
	
}


