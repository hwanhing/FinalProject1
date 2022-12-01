package com.spring.model;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FinalMemeberDAOImpl implements FinalMemberDAO{

	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public FinalMemberDTO MemberMyPage(String id) {
		
		return this.sqlSession.selectOne("MyPage", id);
	
	}

}
