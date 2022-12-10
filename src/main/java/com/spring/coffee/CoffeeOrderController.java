package com.spring.coffee;

import java.util.List;

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
		
		// 우편번호, 나머지 주소 분리
		String addr = memberDto.getMember_addr();
		String[] addrArr = new String[2];
		addrArr[0] = addr.substring(0, 5);
		addrArr[1] = addr.substring(6);
		
		model.addAttribute("memberDto",memberDto);
		model.addAttribute("cartList",cartList);
		model.addAttribute("phoneArr", phoneArr);
		model.addAttribute("emailArr", emailArr);
		model.addAttribute("addrArr", addrArr);
		
		
		return "./cartAndOrder/order";
	}
	
	
}

