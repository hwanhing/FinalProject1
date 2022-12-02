package com.spring.coffee;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.BeanDAO;
import com.spring.model.CoffeeBeanDTO;

@Controller
public class CoffeeBeanController {

	@Inject
	private BeanDAO dao;
	
	@RequestMapping("bean_list.do")
	public String list(Model model) {
		
		List<CoffeeBeanDTO> list = this.dao.getBeanList();
		
		model.addAttribute("List", list);
		
		return "./bean/bean_list";
	}
	

	
}
