package com.spring.coffee;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.BeanDAO;
import com.spring.model.CoffeeBeanDTO;
import com.spring.model.CoffeeCartDAO;
import com.spring.model.CoffeeCartDTO;
import com.spring.model.CoffeeOrderDTO;

@Controller
public class CoffeeCartController {
	
	@Inject
	private CoffeeCartDAO cartDao;
	
	@RequestMapping("bean_cart_insert.do")
	public void list(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		/*
		 *  로직
		  	1. 로그인 상태 확인
		 		1-1 : 로그인 안함 
		 			ㄴ 로그인 페이지로 이동
		 		1-2 : 로그인 함 
		 	 		ㄴ 2. coffee_cart DB에 데이터가 하나라도 있는지 확인
						ㄴ 2-1 : 데이터가 없으면 cart_num을 1로 지정, url 에서 받아온값 db에 저장
		      			ㄴ 2-2 : coffee_cart 테이블에 데이터는 있을 경우
		      				ㄴ 3. 회원이 요청한 상품이 있는지 확인
		      				 	ㄴ 3-1 : 회원이 요청한 상품이 없으면 
		      				 		ㄴ 3-1-1 : 수량, 그람, 원두갈기 선택 안할 경우 (상품 리스트페이지에서 장바구니로 이동시 사용)
		      				 				  수량 :1 , 그람 : 100g, 원두갈기 0(안감)으로 해서 DB에 저장
		      				 		ㄴ 3-1-2 : 수량, 그람, 원두갈기 선택한 경우 해당 데이터로 DB에 저장 (상품 상세페이지에서 장바구니로 이동시 사용)
		      				 	ㄴ 3-2 : 회원이 요청한 상품이 이미 장바구니에 있으면 
		      				 		ㄴ 3-2-1 : 장바구니 수정 요청 안함
		      				 			ㄴ 장바구니 페이지로 이동
		      				 		ㄴ 3-2-1 : 장바구니 수정 요청 함
		      				 			ㄴ 요청 수량, 그람을 db 저장 (저장될 수량 >> 기존 db 수량 + 요청 수량 )
		      				 			ㄴ 요청 수량은 따로 지정 안할 경우 1
		*/
		
		// 1. 로그인 상태 확인
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		 
		if((Integer) session.getAttribute("member_num")==null) {
			out.println("<script>");
			out.println("location.href='go_login.do'");
			out.println("</script>");
		}
		
		int member_num = (Integer) session.getAttribute("member_num");
		System.out.println("member_num : " + member_num);
		
		// url 에서 받아온값(beans_num, cart_weight(상품상세페이지), cart_grind(상품세페이지))
		int beans_num = Integer.valueOf(request.getParameter("no"));
		System.out.println("beans_num : " + beans_num);
		
		// 상품 상세페이지에서 받아온 수량, 원두 그람수,원두 갈기 여부 
		// 따로 받아온 값이 없을 경우 장바구니 수량 1 / 원두 그람수는 100 / 원두갈기는 0 (갈지 않고) 
		int select_cnt = 1;
		int select_weight = 100;
		int select_grind = 0;
		
		if(request.getParameter("count")!=null) {
			select_cnt = Integer.valueOf(request.getParameter("count")) ;
		};
		
		if(request.getParameter("weight")!=null) {
			select_weight = Integer.valueOf(request.getParameter("weight")); 
		};
		
		if(request.getParameter("grind")!=null) {
			select_grind = Integer.valueOf(request.getParameter("grind"));
		}
		
		// 2. 데이터가 완전히 없는지 확인
		int cartDBTrue = cartDao.getCartDBTrue();
		
		if(cartDBTrue == 0) {	// 2-1 db에 데이터 아예 없음
			CoffeeCartDTO cartFDto = new CoffeeCartDTO();
			cartFDto.setCart_num(1);
			cartFDto.setBeans_num(beans_num);
			cartFDto.setCart_cnt(select_cnt);
			cartFDto.setCart_weight(select_weight);
			cartFDto.setCart_grind(select_grind);
			cartFDto.setMember_num(member_num);
			
			System.out.print(cartFDto.getCart_num());
			
			cartDao.insertFirstCart(cartFDto);
			
			System.out.println("장바구니 등록 성공!");
			out.println("<script>");
			out.println("location.href='bean_cart.do'");
			out.println("</script>");
				
		}else {	// 2-2 db에 데이터 있음
			
			// 3. 동일한 상품이 이미 장바구니에 있는지 여부 확인 
			// 0 = 없음 / 있을 경우 cart_num
			Map<String, Integer> cartMap = new HashMap<String, Integer>();
			cartMap.put("beans_num", beans_num);
			cartMap.put("member_num", member_num);
			cartMap.put("select_grind", select_grind);
			CoffeeCartDTO cartDto = cartDao.getCart(cartMap);
			
			int cart_num = cartDto.getCart_num();	
			int db_cnt = cartDto.getCart_cnt();
			int db_weight = cartDto.getCart_weight();
			int db_grind = cartDto.getCart_grind();
			
			cartDto.setBeans_num(beans_num);
			cartDto.setMember_num(member_num);
			
			if(cart_num == 0) {
				// 3-1. 상품 번호가 장바구니에 없는경우(row 추가)
				System.out.println("장바구니에 없는 상품 입니다.");
				cartDto.setCart_cnt(select_cnt);
				cartDto.setCart_weight(select_weight);
				cartDto.setCart_grind(select_grind);
				
				int res = cartDao.insertCart(cartDto);
				if(res>0) {
					System.out.println("장바구니 등록 성공!");
					out.println("<script>");
					out.println("location.href='bean_cart.do'");
					out.println("</script>");
					
				}else {
					System.out.println("장바구니 등록 실패!");
				}
				
			}else {
				// 3-2. 상품 번호가 장바구니에 이미 있는 경우(수량 업데이트, 가격 업데이트)
				System.out.println("장바구니에 있는 상품 입니다.");
				
				cartDto.setCart_cnt(select_cnt + db_cnt);
				
				// 장바구니 요청 원두그람이 있을경우 그람수 수정
				if(request.getParameter("weight")!=null) {
					cartDto.setCart_weight(select_weight);
				}
				
				out.println("<script>");
				out.println("if(confirm('이미 장바구니에 있는 상품입니다. 상품 추가를 원하실까요?'))"
						        + "{ location.href='bean_cart_update.do?no="+cartDto.getCart_num()+"&cnt="+cartDto.getCart_cnt()+"&weight="+cartDto.getCart_weight()+"'"
								+ "} else{location.href='bean_cart.do'}");
				out.println("</script>");
			}
		}
	}
	
	@RequestMapping("go_login.do")
	public String goLogin() {
		
		return "./cartAndOrder/login";
	}
	
	@RequestMapping("bean_cart_update.do")
	public void updateCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int cart_num = Integer.valueOf(request.getParameter("no").trim()); 
		int cart_cnt = Integer.valueOf(request.getParameter("cnt").trim()); 
		int cart_weight = Integer.valueOf(request.getParameter("weight").trim()); 
		
		Map<String, Integer> cartMap = new HashMap<String, Integer>();
		cartMap.put("cart_num", cart_num);
		cartMap.put("cart_cnt", cart_cnt);
		cartMap.put("cart_weight", cart_weight);
		
		int res =cartDao.updateCart(cartMap);
		
		PrintWriter out = response.getWriter();
		
		if(res>0) {
			System.out.println("장바구니 수정 성공!");
			out.println("<script>");
			out.println("location.href='bean_cart.do'");
			out.println("</script>");
		}else {
			System.out.println("장바구니 수정 실패!");
		}
	}
	
	
	@RequestMapping("bean_cart.do")
	public String goCart(HttpSession session,HttpServletResponse response, Model model) throws IOException{
		
		System.out.println("--approvalpay.do----------------------------------------------------------------");
		System.out.println("session member_num : " + session.getAttribute("member_num"));
		
		PrintWriter out = response.getWriter();
		if(session.getAttribute("member_num")==null) {
			out.println("<script>");
			out.println("location.href='go_login.do'");
			out.println("</script>");
		}
		
		int member_num = (Integer) session.getAttribute("member_num");
		System.out.println("--------------------------------------------------------------------------------");
		
		
		List<CoffeeCartDTO> cartList = cartDao.getCartList(member_num);
		
		// 추천 상품 가져오기
		// cartList.size() 가 0 이면 가장 많이 주문한 상품 맛 기준으로 전체 주문건 많은 상품순 
		// 아닐 경우 장바구니에 많이 담겨져있는 상품 맛 기준 전체 주문건이 많은 상품 순
		List<CoffeeCartDTO> getRecList = new ArrayList<CoffeeCartDTO>();
		if(cartList.size() != 0) {
			getRecList = cartDao.getRecListCart(member_num);
			
		}else {
			getRecList = cartDao.getRecListOrder(member_num);
		}
		
		model.addAttribute("memNum", member_num);
		model.addAttribute("cartList", cartList);
		model.addAttribute("recProductList", getRecList);
		
		return "./cartAndOrder/cart";
	}
	
	
	// ajax -----------------------------------------------------------------------
	// 찜 수정 또는 등록
	@RequestMapping("heart.do")
	public void updateHeart(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		int memNum = Integer.valueOf(request.getParameter("memNum")); 
		int beansNum = Integer.valueOf(request.getParameter("beansNum"));
		
		Map<String, Integer> heartMap = new HashMap<String, Integer>();
		heartMap.put("memNum", memNum);
		heartMap.put("beansNum", beansNum);
		
		// 이미 데이터가 있다면 DB 수정, 없을 경우 DB 추가 (0일때는 데이터 없음)
		CoffeeCartDTO inHeartDto = cartDao.inHeart(heartMap);
		int inHeart = inHeartDto.getBeans_num();
		int nowHeart = inHeartDto.getCoffee_heart();
		
		// 찜해져있는 상태라면 찜 해제(0), 아닐경우 찜하기(1)
		if(nowHeart==0) {
			nowHeart = 1;
			
		}else {
			nowHeart = 0;
		}
		
		heartMap.put("heart", nowHeart);
		
		if(inHeart==0) {
			// 찜 등록
			cartDao.insertHeart(heartMap);
			
		}else {
			// 찜 수정
			cartDao.updateHeart(heartMap);
		}
		
		PrintWriter out = response.getWriter();
		out.println("1");
		
	}
	// 장바구니 삭제
	@RequestMapping("deleteCartRow.do")
	public void deleteCartRow(@RequestParam("cartNum") int cartNum, HttpServletResponse response) throws IOException{
		
		int res = cartDao.deleteCartRow(cartNum);
		System.out.println("coffeeCartController 장바구니 행 삭제 결과 : " + res);
		
		PrintWriter out = response.getWriter();
		out.println("1");
	}
	
	// 장바구니 수량 수정
	@RequestMapping("updateCartCnt.do")
	public void updateCartCnt(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		int cartNum = Integer.valueOf(request.getParameter("cartNum").trim());
		int cartCnt = Integer.valueOf(request.getParameter("cartCnt").trim());
		
		Map<String, Integer> cartCntMap = new HashMap<String, Integer>();
		cartCntMap.put("cartNum", cartNum);
		cartCntMap.put("cartCnt", cartCnt);
		int res = cartDao.updateCartCnt(cartCntMap);
		System.out.println("coffeeCartController 수량 수정 결과 : " + res);
		
		PrintWriter out = response.getWriter();
		out.println("1");
	}
	
	// 장바구니 그람 수정
	@RequestMapping("updateCartGram.do")
	public void updateCartGram(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		int cartNum = Integer.valueOf(request.getParameter("cartNum").trim());
		int cartGram = Integer.valueOf(request.getParameter("cartGram").trim());
		
		Map<String, Integer> cartGramMap = new HashMap<String, Integer>();
		cartGramMap.put("cartNum", cartNum);
		cartGramMap.put("cartGram", cartGram);
		int res = cartDao.updateCartGram(cartGramMap);
		System.out.println("coffeeCartController 그람 수정 결과 : " + res);
		
		PrintWriter out = response.getWriter();
		out.println("1");
	}
	
	
}