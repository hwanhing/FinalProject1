package com.spring.coffee;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.CoffeeOrderDAO;
import com.spring.model.CoffeeOrderDTO;

@Controller
public class CoffeeOrderController {
	
	@Inject
	private CoffeeOrderDAO orderDao;
	
	@RequestMapping("bean_order.do")
	public void beanCartList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("coffee_order controller!");
		
		String list = request.getParameter("allArray");
		System.out.println(list);
		
	}
	
	
}

