package com.spring.model;

import javax.inject.Inject;


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


	
}
