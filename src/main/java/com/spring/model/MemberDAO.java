package com.spring.model;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MemberDAO {

	FinalMemberDTO checkMember(FinalMemberDTO dto);
	
	public void logout(HttpSession session);
	
	FinalMemberDTO MemberMyPage(int num);
	//주소
	int addrModify(FinalMemberDTO dto);
	
	int addrModify2(FinalMemberDTO dto);
	
	int addrModify3(FinalMemberDTO dto);
	
	int addrModify4(FinalMemberDTO dto);
	
	int addrModify5(FinalMemberDTO dto);

	
	

	
}
