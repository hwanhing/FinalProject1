package com.spring.model;

import java.util.List;
import java.util.Map;


public interface BeanDAO {

	List<CoffeeBeanDTO> getBeanList();
	
	int insert(Map<String, Object> map );
}
