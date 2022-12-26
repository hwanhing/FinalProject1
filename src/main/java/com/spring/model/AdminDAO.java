package com.spring.model;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

	
	FinalAdminDTO admin_check(FinalAdminDTO dto);

	List<FinalMemberDTO> memberList(PageDTO dto);

	int memberList();

	FinalMemberDTO admin_cont(int num);

	List<CoffeeBeanDTO> getBeanList(PageDTO dto);

	int beansList();

	List<CoffeeOrderDTO> admin_order(int num);
	
	String getBeansCount();
	
	CoffeeBeanDTO getBeanContent(int no);
	
	int adminBeanModify(CoffeeBeanDTO dto);
	
	int adminBeanDelete(int beans_num);
	
	List<CoffeeBeanDTO> searchBeanList(String keyword);
	
	int searchCount(String keyword);
	
	int adminBeanInsert(Map<String, Object> map);
}
