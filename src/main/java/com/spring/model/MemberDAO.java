package com.spring.model;

import javax.servlet.http.HttpSession;

public interface MemberDAO {

	FinalMemberDTO checkMember(FinalMemberDTO dto);
	
	public void logout(HttpSession session);
}
