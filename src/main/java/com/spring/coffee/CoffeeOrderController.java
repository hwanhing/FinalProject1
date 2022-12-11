package com.spring.coffee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.CoffeeOrderDAO;
import com.spring.model.CoffeeOrderDTO;
import com.spring.model.FinalMemberDTO;

@Controller
public class CoffeeOrderController {
	
	@Inject
	private CoffeeOrderDAO orderDao;
	
	@RequestMapping("bean_order.do")
	public String beanCartList(HttpSession session, Model model) {
		
		int member_num = (Integer) session.getAttribute("member_num");
		
		FinalMemberDTO memberDto = orderDao.getMemberCont(member_num);
		List<CoffeeOrderDTO> cartList = orderDao.getCartListFin(member_num);
		
		// 핸드폰번호 분리
		String phone = memberDto.getMember_phone();
		String[] phoneArr = phone.split("-");
		
		// 이메일 분리
		String email = memberDto.getMember_email();
		String[] emailArr =  email.split("@");
		
		// 주소
		String addr1 = memberDto.getMember_addr();
		String addr2 = memberDto.getMember_addr2();
		String addr3 = memberDto.getMember_addr3();
		String addr4 = memberDto.getMember_addr4();
		String addr5 = memberDto.getMember_addr5();
		String[] addrArr = {addr1, addr2, addr3, addr4, addr5};
		
		model.addAttribute("memberDto",memberDto);
		model.addAttribute("cartList",cartList);
		model.addAttribute("phoneArr", phoneArr);
		model.addAttribute("emailArr", emailArr);
		model.addAttribute("addrArr", addrArr);
		
		return "./cartAndOrder/order";
	}
	
	
}

