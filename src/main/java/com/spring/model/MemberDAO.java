package com.spring.model;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MemberDAO {

	FinalMemberDTO checkMember(FinalMemberDTO dto);
	
	public void logout(HttpSession session);
	
	FinalMemberDTO MemberMyPage(int num);
	
	int addrModify(FinalMemberDTO dto);

	
	

	
}
