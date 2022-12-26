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

	List<FinalMemberDTO> boardList(PageDTO dto);

	String getBeansCount();


	int boardList();


	
	CoffeeBeanDTO getBeanContent(int no);
	
	int adminBeanModify(CoffeeBeanDTO dto);

	
	int adminBeanDelete(int beans_num);

	FinalMemberDTO centerwrite(int board_num);


	int admincenterOk(Map<String, Object> map);

	int updatecenter(int board_num);

	FinalMemberDTO greenbtn(int board_num);

	int afterList();

	List<FinalMemberDTO> after_writeList(PageDTO dto);

	FinalMemberDTO write_cont(int write_num);

	

	

	

	

	

}
