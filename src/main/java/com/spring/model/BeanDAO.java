package com.spring.model;

import java.util.List;
import java.util.Map;


public interface BeanDAO {

	List<CoffeeBeanDTO> getBeanList();
	
	List<CoffeeBeanDTO> getBeanHeartList();
	
	List<CoffeeBeanDTO> BeanPriceDownList();
	
	List<CoffeeBeanDTO> BeanPriceUpList();
	
	CoffeeStarDTO selectBean(Map<String, Object> map);
	
//	int insertHeart(Map<String, Object> map);
	
	
	
	CoffeeBeanDTO getBeanContent(int num);
}
