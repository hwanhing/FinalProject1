package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Repository
public class BeanDAOImpl implements BeanDAO{
	
	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CoffeeBeanDTO> getBeanList() {
		
		return this.sqlSession.selectList("list");
	}


	@Override
	public List<CoffeeBeanDTO> getBeanHeartList() {
		
		return this.sqlSession.selectList("heartlist");
	}
	
	@Override
	public List<CoffeeBeanDTO> BeanPriceDownList() {
		
		return this.sqlSession.selectList("pricedownlist");
	}	

	@Override
	public List<CoffeeBeanDTO> BeanPriceUpList() {
		return this.sqlSession.selectList("priceuplist");
	}	

	
	@Override
	public CoffeeBeanDTO getBeanContent(int num) {
		return this.sqlSession.selectOne("Cont", num);
	}

	@Override
	public CoffeeStarDTO seHeart(Map<String, Integer> map) {
		return this.sqlSession.selectOne("heartmap1", map);
	}


	@Override
	public void insertHeart(Map<String, Integer> map) {
		this.sqlSession.selectOne("insertHeart1", map);
		
	}


	@Override
	public void updateHeart(Map<String, Integer> map) {
		this.sqlSession.selectOne("updateHeart1", map);
		
	}


	@Override
	public List<CoffeeWriteDTO> getWriteList(int num) {
		return this.sqlSession.selectList("writeList", num);
	}


	@Override
	public int seWrite(CoffeeWriteDTO dto) {
		return this.sqlSession.insert("insertWrite", dto);
	}

	
	/* list 페이지에서 상세보기 눌렀을 때 후기글 몇 개 인지 조회하는 메서드. */
	@Override
	public int getWriteCount(int num) {
		return this.sqlSession.selectOne("writeCount", num);
	}


	@Override
	public void getStar(CoffeeStarDTO dto) {
		this.sqlSession.update("updateStar", dto);
		
	}


	@Override
	public int checkWrite(CoffeeStarDTO dto1) {
		return this.sqlSession.selectOne("checkWrite", dto1);
	}


	@Override
	public int deleteWrite(int write_num) {
		return this.sqlSession.delete("deleteWrite", write_num);
	}







/*	@Override
	public void beanHeartUp(Map<String, Integer> map) {
		this.sqlSession.update("heartUp", map);
		
	}


	@Override
	public void beanHeartDown(Map<String, Integer> map) {
		this.sqlSession.update("heartDown", map);
	}
	
*/





















	



	
	

	
}
