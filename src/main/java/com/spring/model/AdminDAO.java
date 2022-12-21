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

	List<FinalMemberDTO> boardList(PageDTO dto);

	String getBeansCount();


	int boardList();


	
	CoffeeBeanDTO getBeanContent(int no);
	
	int adminBeanModify(CoffeeBeanDTO dto);

}
