package com.spring.coffee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String list(Model model) {
		
		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.getBeanList();
		model.addAttribute("List", list);
		
		return "./bean/bean_list";
	}
	

	@RequestMapping("heart_insert.do")
	public void insert(@RequestParam("member_num") int no, @RequestParam("coffee_heart") int heart) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);		
		map.put("heart", heart);		
		int res = this.dao.insert(map);
		
		
	}

	
}
