package com.spring.model;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public FinalMemberDTO checkMember(FinalMemberDTO dto) {
		
		return this.sqlSession.selectOne("check",dto);
	}

	@Override
	public void logout(HttpSession session) {
		
		session.invalidate(); // 세션 초기화
		
	}
 
	@Override
	public FinalMemberDTO MemberMyPage(int num) {
		
		return this.sqlSession.selectOne("MyPage", num);
	
	}

	@Override
	public int addrModify(FinalMemberDTO dto) {
		
		return this.sqlSession.update("addrmodify",dto);
	}



	
	
	
	

	
}
