package com.spring.model;

import java.util.List;

public interface AdminDAO {

	FinalAdminDTO admin_check(FinalAdminDTO dto);

	List<FinalMemberDTO> memberList(PageDTO dto);

	int memberList();

	FinalMemberDTO admin_cont(int num);

	

}
