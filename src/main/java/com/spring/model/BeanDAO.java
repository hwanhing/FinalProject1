package com.spring.model;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface BeanDAO {

	List<CoffeeBeanDTO> getBeanList();
	
	List<CoffeeBeanDTO> getBeanHeartList();
	
	List<CoffeeBeanDTO> BeanPriceDownList();
	
	List<CoffeeBeanDTO> BeanPriceUpList();
	
	CoffeeStarDTO seHeart(Map<String, Integer> map);
	void insertHeart(Map<String, Integer> map);
	void updateHeart(Map<String, Integer> map);
	
	
	CoffeeBeanDTO getBeanContent(int num);

	List<CoffeeWriteDTO> getWriteList();

	int seWrite(Map<String, Object> map);
	
}
