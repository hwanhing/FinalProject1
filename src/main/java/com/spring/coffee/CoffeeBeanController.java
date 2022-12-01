package com.spring.coffee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CoffeeBeanController {

	@RequestMapping("bean_list.do")
	public String list() {
		
		return "./bean/bean_list";
	}
	
}
