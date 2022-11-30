package com.spring.model;

import lombok.Data;

@Data
public class CoffeeWriteDTO {
	
	private int write_num;
	private String write_cont;
	private String write_date;
	private String write_img;
	private String member_id;
	private int beans_num;
}


