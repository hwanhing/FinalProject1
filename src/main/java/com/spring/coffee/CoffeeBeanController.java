package com.spring.coffee;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.model.BeanDAO;
import com.spring.model.CoffeeBeanDTO;
import com.spring.model.CoffeeCartDTO;
import com.spring.model.CoffeeStarDTO;
import com.spring.model.CoffeeWriteDTO;

@Controller
public class CoffeeBeanController {

	@Inject
	private BeanDAO dao;
	
	@RequestMapping("bean_list.do")
	public String list(Model model, CoffeeBeanDTO dto) {
		
		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.getBeanList();
		model.addAttribute("List", list);
	
		
		return "./bean/bean_list";
	}

	// 찜 수정 또는 등록
	@RequestMapping("beans_heart.do")
	public void updateHeart(HttpServletRequest request, HttpServletResponse response) throws IOException{
	
	int member_num = Integer.valueOf(request.getParameter("member_num")); 
	int beans_num = Integer.valueOf(request.getParameter("beans_num"));
	
	Map<String, Integer> map = new HashMap<String, Integer>();
	map.put("member_num", member_num);
	map.put("beans_num", beans_num);
	
	// 이미 데이터가 있다면 DB 수정, 없을 경우 DB 추가 (0일때는 데이터 없음)
	CoffeeStarDTO dto = this.dao.seHeart(map);
	int insertHeart = dto.getBeans_num();
	int updateHeart = dto.getCoffee_heart();
	
	
	// 찜해져있는 상태라면 찜 해제(0), 아닐경우 찜하기(1)
	if(updateHeart==0) {
		updateHeart = 1;
		
	}else {
		updateHeart = 0;
	}
	
	map.put("coffee_heart", updateHeart);
	
	PrintWriter out = response.getWriter();
	
	if(insertHeart==0) {
		// 찜 등록
		this.dao.insertHeart(map);
	}else {
		// 찜 수정
		this.dao.updateHeart(map);
		
	}

	out.println(updateHeart);
	
}

	@RequestMapping("beans_list_heart.do")
	public String downlist(Model model, CoffeeBeanDTO dto) {
		
		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.getBeanHeartList();
		model.addAttribute("List", list);		
		
		return "./bean/bean_list";
	
	}	
	
	@RequestMapping("beans_price_down.do")
	public String priceDownList(Model model, CoffeeBeanDTO dto) {
		
		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.BeanPriceDownList();
		model.addAttribute("List", list);		
		
		return "./bean/bean_list";
		
	}	
	
	@RequestMapping("beans_price_up.do")
	public String priceUpList(Model model, CoffeeBeanDTO dto) {
		
		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.BeanPriceUpList();
		model.addAttribute("List", list);		
		
		return "./bean/bean_list";
		
	}	
	
	@RequestMapping("bean_content.do")
	public String content(@RequestParam("num") int num,CoffeeBeanDTO dto_1, Model model) {

		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.getBeanList();
		model.addAttribute("List", list);
		
		CoffeeBeanDTO dto = this.dao.getBeanContent(num);
		model.addAttribute("Cont", dto);
		
		List<CoffeeWriteDTO> list_1 = this.dao.getWriteList();
		model.addAttribute("writeList", list_1);
		
		
		return "./bean/bean_content";
	}
	
	@RequestMapping("write_insert.do")
	public String writeinsert(MultipartHttpServletRequest mrequest, CoffeeWriteDTO dto, HttpServletResponse response) throws IOException {
		
		int res = this.dao.writeinsert(dto);
		
		int num = dto.getBeans_num();
		
		
		return "./bean/bean_content.do?no="+num+"";
	}

}
