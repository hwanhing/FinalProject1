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

import com.spring.model.BeanDAO;
import com.spring.model.CoffeeBeanDTO;
import com.spring.model.CoffeeStarDTO;

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
	
/*	@RequestMapping("heart_insert.do")
	public void insert(@RequestParam("member_num") int member_num, @RequestParam("coffee_heart") int coffee_heart, @RequestParam("beans_num") int beans_num, HttpServletResponse response, HttpServletRequest request) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("member_num", member_num);		
		map.put("coffee_heart", coffee_heart);	
		map.put("beans_num", beans_num);
		
		int res = this.dao.insert(map);				
	
	}*/
	
	@RequestMapping("heart_select_list.do")
	public void selectBean(@RequestParam("member_num") int member_num, @RequestParam("beans_num") int beans_num, HttpServletResponse response) throws IOException {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("member_num", member_num);		
		map.put("beans_num", beans_num);
		
		
		CoffeeStarDTO dto = this.dao.selectBean(map);
	
		PrintWriter out = response.getWriter();
		
		int result;
		
		if(dto != null) {
			result = 1;	// 값 있음.
		}else {
			result = 0;	// 값 없음.
		}
		
		out.println(result);
	
	}	
	
/*	@RequestMapping("heart_insert.do")
	public void insertheart(@RequestParam("member_num") int member_num, @RequestParam("beans_num") int beans_num, @RequestParam("coffee_heart") int coffee_heart, HttpServletResponse response) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("member_num", member_num);		
		map.put("beans_num", beans_num);
		map.put("coffee_heart", coffee_heart);
		
		PrintWriter out = response.getWriter();
		
		int res = this.dao.insertHeart(map);
		
		System.out.println(res);
		out.println(res);
	} */
	
	
	
	@RequestMapping("bean_content.do")
	public String content(@RequestParam("num") int num,CoffeeBeanDTO dto_1, Model model) {

		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.getBeanList();
		model.addAttribute("List", list);
		
		CoffeeBeanDTO dto = this.dao.getBeanContent(num);
		model.addAttribute("Cont", dto);
		
		return "./bean/bean_content";
	}


}
