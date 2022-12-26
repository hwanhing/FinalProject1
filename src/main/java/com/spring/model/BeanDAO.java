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
	
//	void beanHeartUp(Map<String, Integer> map);
//	void beanHeartDown(Map<String, Integer> map);
	
	CoffeeBeanDTO getBeanContent(int num);
	
	int getWriteCount(int num);
	
	List<CoffeeWriteDTO> getWriteList(int num);

	int seWrite(CoffeeWriteDTO dto);
	
	void getStar(CoffeeStarDTO dto);
	
	int checkWrite(CoffeeStarDTO dto1);
	
	// 후기글 삭제
	int deleteWrite(int write_num);
	
}
