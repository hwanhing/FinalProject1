package com.spring.model;

import java.util.List;
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

	@Override
	public int addrModify2(FinalMemberDTO dto) {
		return this.sqlSession.update("addrmodify2",dto);
	}

	@Override
	public int addrModify3(FinalMemberDTO dto) {
		return this.sqlSession.update("addrmodify3",dto);
	}

	@Override
	public int addrModify4(FinalMemberDTO dto) {
		return this.sqlSession.update("addrmodify4",dto);
	}

	@Override
	public int addrModify5(FinalMemberDTO dto) {
		return this.sqlSession.update("addrmodify5",dto);
	}

	@Override
	public int deletemember(int num) {
		return this.sqlSession.update("member_Delete",num);
	}

	@Override
	public int phone_modify(FinalMemberDTO dto) {
		return this.sqlSession.update("phone_modify",dto);
	}

	@Override
	public int email_modify(FinalMemberDTO dto) {
		return this.sqlSession.update("Email_modify", dto);
	}

	@Override
	public int pwd_modify(FinalMemberDTO dto) {
		
		return this.sqlSession.update("pwd_modify" , dto);
		
	}

	@Override
	public List<FinalMemberDTO> member_heart(int num) {
		return this.sqlSession.selectList("heart_list", num);
	}

	@Override
	public int myheartdelete(int num) {
		return this.sqlSession.delete("myheartdelete",num);
	}

	@Override
	public int joinIdCheck(String joinId) {

		int result = this.sqlSession.selectOne("joinIdCheck",joinId);
		
		System.out.println("impl :" + joinId);
		
		System.out.println(result);

		return result;
		
	}

}
