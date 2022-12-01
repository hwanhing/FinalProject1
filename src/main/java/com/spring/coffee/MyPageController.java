package com.spring.coffee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.FinalMemberDAO;

@Controller
public class MyPageController {

	@Autowired
	private FinalMemberDAO dao;
	

}
