package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import oracle.net.aso.r;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public FinalAdminDTO admin_check(FinalAdminDTO dto) {
		
		return this.sqlSession.selectOne("admin_check", dto);
	}

	@Override
	public List<FinalMemberDTO> memberList(PageDTO dto) {
	
		return this.sqlSession.selectList("memberList", dto);
	}

	@Override
	public int memberList() {
		
		return this.sqlSession.selectOne("count");
	}

	@Override
	public FinalMemberDTO admin_cont(int num) {
	  return this.sqlSession.selectOne("admin_cont",num);

		
	}

	@Override
	public List<CoffeeBeanDTO> getBeanList(PageDTO dto) {
		return this.sqlSession.selectList("admin_beans", dto);
	}

	@Override
	public int beansList() {
		return this.sqlSession.selectOne("countb");
	}

	@Override
	public String getBeansCount() {
		return this.sqlSession.selectOne("beansCount");
	}

	public List<CoffeeOrderDTO> admin_order(int num) {
		
		return this.sqlSession.selectList("admin_order",num);
	}

	@Override
	public int boardList() {
		return this.sqlSession.selectOne("counto");
	}

	@Override
	public List<FinalMemberDTO> boardList(PageDTO dto) {
		
		return this.sqlSession.selectList("admin_board",dto);
  }
  
  @Override
	public CoffeeBeanDTO getBeanContent(int no) {
		return this.sqlSession.selectOne("beans_cont", no);
	}

	@Override
	public int adminBeanModify(CoffeeBeanDTO dto) {
		return this.sqlSession.update("bean_modify", dto);

	}

	@Override
	public int adminBeanDelete(int beans_num) {
		return this.sqlSession.delete("bean_delete", beans_num);
	}

	@Override
	public List<CoffeeBeanDTO> searchBeanList(String keyword) {
		return this.sqlSession.selectList("beanSearch", keyword);
	}

	@Override
	public int searchCount(String keyword) {
		return this.sqlSession.selectOne("searchCount", keyword);
	}

	@Override
	public int adminBeanInsert(Map<String, Object> map) {
		return this.sqlSession.insert("bean_insert", map);
	}


	public FinalMemberDTO centerwrite(int board_num) {
		
		return this.sqlSession.selectOne("centerwrite",board_num);
	}

	@Override
	public int admincenterOk(Map<String, Object> map) {
		return this.sqlSession.insert("centerOk",map);
		
	}

	@Override
	public int updatecenter(int board_num) {
		
		return this.sqlSession.update("centerupdate", board_num);
	}

	@Override
	public FinalMemberDTO greenbtn(int board_num) {
	
		return this.sqlSession.selectOne("greenbtn",board_num );
	}

	@Override
	public int afterList() {
		
		return this.sqlSession.selectOne("afterCount");
	}

	@Override
	public List<FinalMemberDTO> after_writeList(PageDTO dto) {
		
		return this.sqlSession.selectList("afterlike", dto);
	}

	@Override
	public FinalMemberDTO write_cont(int write_num) {
		
		return this.sqlSession.selectOne("write_Cont", write_num);
	}



	

	
}
