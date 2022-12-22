package com.spring.model;

import java.util.List;

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
}
