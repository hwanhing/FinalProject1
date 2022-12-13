package com.spring.coffee;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.CoffeeBeanDTO;
import com.spring.model.CoffeeOrderDAO;
import com.spring.model.CoffeeOrderDTO;
import com.spring.model.FinalMemberDTO;

@Controller
public class CoffeeOrderController {
	
	@Inject
	private CoffeeOrderDAO orderDao;
	
	// 장바구니에서 주문서 작성 페이지로 이동
	public Map<String, Object> cartMapM(String[] cartNumArr){
		
		List<Integer> cartNumList = new ArrayList<Integer>();
		for(int i=0; i<cartNumArr.length; i++) {
			int tmp = Integer.valueOf(cartNumArr[i]);
			cartNumList.add(tmp);
		}
		
		List<CoffeeOrderDTO> cartList = orderDao.getCartListFin(cartNumList);
		
		String item_name = "";
		int quantity = 0;
		
		// 주문 상품이 1개 이상일 경우 해당 상품명, 여러개일경우 상품명 외 숫자 표현
		// 예시) 원두a 만 구매시 상품명 원두a  / 원두a, 원두b 구매시 상품명 원두b 외 1
		if(cartList.size()>1) {
			item_name = cartList.get(0).getBeans_name() + " 외 " + (cartList.size()-1) ;
		}else {
			item_name = cartList.get(0).getBeans_name();
		}
		
		for(int i=0; i<cartList.size(); i++) {
			quantity += cartList.get(i).getOrder_cnt();
		}
		
		System.out.println("구매 아이템 : " + item_name);
		System.out.println("구매 수량 : " + quantity);
		
		Map<String, Object> cartMap = new HashMap<String, Object>();
		cartMap.put("cartList", cartList);
		cartMap.put("item_name", item_name);
		cartMap.put("quantity", quantity);
		
		return cartMap;
	}
	
	// 멤버 정보
	public Map<String, Object> memberMapM(int member_num) {
		
		FinalMemberDTO memberDto = orderDao.getMemberCont(member_num);
		
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

		Map<String, Object> memberMap = new HashMap<String, Object>();
		memberMap.put("memberDto", memberDto);
		memberMap.put("phoneArr", phoneArr);
		memberMap.put("emailArr", emailArr);
		memberMap.put("addrArr", addrArr);
		
		
		return memberMap;
	}
	
	// 카카오
	public String kakao(String itemName, int quantity, int totalAmout) {
	
		String fin = null;
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready"); 		//주소
			HttpURLConnection con = (HttpURLConnection) url.openConnection(); 	// 서버연결
			
			// 메서드 방식
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK ae43b251191006bb3cd574d0340abccf");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			con.setDoOutput(true);
			
			// parameter 정의
			String param = "cid=TC0ONETIME"
						 + "&partner_order_id=partner_order_id"
						 + "&partner_user_id=partner_user_id"
						 + "&item_name=" + itemName
						 + "&quantity=" + quantity
						 + "&total_amount=" + totalAmout
						 + "&tax_free_amount=0"	// 비과세
						 + "&approval_url=http://localhost:8585/coffee/approvalpay.do"
						 + "&cancel_url=http://localhost:8585/coffee/cancelpay.do"
						 + "&fail_url=http://localhost:8585/coffee/failpay.do";
			
			OutputStream put =  con.getOutputStream();				// 서버에게 전달
			DataOutputStream dataPut = new DataOutputStream(put); 	// 서버에게 데이터를 전달
			dataPut.write(param.getBytes("UTF-8")); 
			
			dataPut.close();
			
			int result = con.getResponseCode(); // 결과보기
			InputStream input; 				 	// 결과 받는애
			if(result == 200) {					// 정상 통신 완료!
				input = con.getInputStream();
				System.out.println("정상통신 완료!");
			}else {								// 정상 통신 실패
				input = con.getErrorStream();
				System.out.println("정상통신 실패!");
			}
			
			InputStreamReader reader = new InputStreamReader(input);
			BufferedReader change = new BufferedReader(reader);
			
			fin = change.readLine();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fin;
	}
	
	// 결제 완료후
	// 주문완료 정보 요약
	public Map<String, Object> summaryOrder(String order_num, List<CoffeeOrderDTO> orderList){
		
		// 요약 정보
		Map<String, Object> summaryOrder = new HashMap<String, Object>();
		
		// 주문일
		String order_date = orderList.get(0).getOrder_date().substring(0,10);
		
		// 주문명 주문상품이 1개 이상일경우 oo상품 외 2
		String order_product = orderList.get(0).getBeans_name();
		if(orderList.size()>1) {
			order_product = orderList.get(0).getBeans_name() + " 외 " + (orderList.size() -1);
		}

		// 총 주문금액
		int order_price_total = 0;
		for(int i=0; i<orderList.size(); i++) {
			order_price_total += orderList.get(i).getOrder_price();
		}
		
		// 사용 포인트
		int use_point = orderList.get(0).getUse_point();
		
		summaryOrder.put("order_num", order_num);
		summaryOrder.put("order_date", order_date);
		summaryOrder.put("order_product", order_product);
		summaryOrder.put("order_price_total", order_price_total);
		summaryOrder.put("use_point", use_point);
		
		return summaryOrder;
	}
	
	// --------------------------------------------------------------------------------------------------
	
	
//	@RequestMapping("bean_direct_order.do")
//	public String beanOrder(HttpSession session, HttpServletRequest request, Model model) {
//		int member_num = (Integer) session.getAttribute("member_num");
//		int beans_num = Integer.valueOf(request.getParameter("no"));
//		int select_cnt = Integer.valueOf(request.getParameter("count")) ;
//		int select_weight = Integer.valueOf(request.getParameter("weight")); 
//		int select_grind = Integer.valueOf(request.getParameter("grind"));
//		
//		CoffeeBeanDTO coffeeDto = orderDao.getProduct(beans_num);
//		FinalMemberDTO memberDto = orderDao.getMemberCont(member_num);
//		
//		CoffeeOrderDTO orderDto = new CoffeeOrderDTO();
//		orderDto.setOrder_cnt(select_cnt);
//		orderDto.setOrder_price(select_cnt * coffeeDto.getBeans_price() * (select_weight/100));
//		orderDto.setBeans_num(beans_num);
//		orderDto.setBeans_name(coffeeDto.getBeans_name());
//		orderDto.setBeans_price(coffeeDto.getBeans_price());
//		orderDto.setBeans_taste(coffeeDto.getBeans_taste());
//		orderDto.setBeans_img(coffeeDto.getBeans_img());
//		orderDto.setCart_weight(select_weight);
//		orderDto.setCart_grind(select_grind);
//		orderDto.setMember_num(member_num);
//		
//		
//		model.addAttribute("memberDto",memberDto);
//		model.addAttribute("cartList",orderDto);
//		model.addAttribute("itemName", coffeeDto.getBeans_name());
//		model.addAttribute("quantity", select_cnt);
//		model.addAttribute("phoneArr", phoneArr);
//		model.addAttribute("emailArr", emailArr);
//		model.addAttribute("addrArr", addrArr);
//		model.addAttribute("requestType", "d");	// 바로주문하기 일경우 "d"
//		
//		return "./cartAndOrder/order";
//	}
	
	@RequestMapping("bean_order.do")
	public String beanCartList(HttpSession session, HttpServletRequest request, Model model) {
		
		int member_num = (Integer) session.getAttribute("member_num");
		
		// 카트번호가 넘어오면 장바구니에서 넘어온 주문작성, 아닐경우 바로주문
		if(request.getParameter("cart")!=null) {
			
			// 받아온 카트번호
			String cart = request.getParameter("cart");
			String[] cartNumArr = cart.split(",");
			
			Map<String, Object> cartMap = cartMapM(cartNumArr);
			model.addAttribute("cartList",cartMap.get("cartList"));
			model.addAttribute("itemName", cartMap.get("item_name"));
			model.addAttribute("quantity", cartMap.get("quantity"));
			model.addAttribute("requestType", "c");	// 장바구니를 통해서 주문일 경우 "c"
			
		}
		
		Map<String, Object> memberMap = memberMapM(member_num);
		model.addAttribute("memberDto", memberMap.get("memberDto"));
		model.addAttribute("phoneArr", memberMap.get("phoneArr"));
		model.addAttribute("emailArr", memberMap.get("emailArr"));
		model.addAttribute("addrArr", memberMap.get("addrArr"));

		return "./cartAndOrder/order";
	}
	
	@RequestMapping("kakaopay.do")
	@ResponseBody
	public String kakaopay(HttpServletRequest request) {
		
		String itemName = request.getParameter("itemName");
		int quantity = Integer.valueOf(request.getParameter("quantity")); 
		int totalAmout = Integer.valueOf(request.getParameter("totalAmout"));
		
		String fin = kakao(itemName, quantity, totalAmout);
		
		return fin;
	}
	
	@RequestMapping("order_session.do")
	public void orderSession(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		// 바로가기로 구매한 상품: d , 장바구니 페이지 거쳐서 구매한 상품 : c
		String reqestType = request.getParameter("requestType");
		
		// 사용자가 구매 요청시 상품 단가, 사용포인트, 적립 포인트
		String[] cartArr = request.getParameterValues("rowCartArr");
		String[] priceArr = request.getParameterValues("rowPriceArr");
		int usePoint = Integer.valueOf(request.getParameter("totalUsePoint"));
		int savePoint = Integer.valueOf(request.getParameter("savePoint"));
		
		List<Integer> cartList = new ArrayList<Integer>();
		List<Integer> priceList = new ArrayList<Integer>();
		for(int i=0; i<cartArr.length; i++) {
			cartList.add(Integer.valueOf(cartArr[i]));
			priceList.add(Integer.valueOf(priceArr[i]));
		}
		
		Map<String, Object> sessionMap = new HashMap<String, Object>();
		sessionMap.put("reqestType", reqestType);
		sessionMap.put("usePoint", usePoint);
		sessionMap.put("savePoint", savePoint);
		
		// 세션 등록
		session.setAttribute("cartList", cartList);
		session.setAttribute("priceList", priceList);
		session.setAttribute("sessionMap", sessionMap);
		
		PrintWriter out = response.getWriter();
		out.println("1");
	}
	
	@RequestMapping("approvalpay.do")
	public void approvalPay(HttpSession session, HttpServletResponse response) throws IOException {
		
		/*
	 	1. 주문 테이블에 주문건 저장
	 		ㄴ 사용자가 결제요청시 상품단가와 상품의 현 단가와 상이할 경우 사용자 구매 요청 단가로 변경
	 	2. 상품 수량 판매된 수량 만큼 제외
	 	3. 포인트 업데이트
	 	4. 장바구니 목록 삭제
	 	5. 세션 종료("priceList","usePoint")
	 	6. 주문내역 페이지로 이동
		*/
	
		// 1. 주문 테이블에 주문건 저장
		// 	ㄴ 1-1 장바구니 상품 정보를 가져오기
		//  ㄴ 1-2 현재 상품금액과 사용자 구매 요청 금액 비교 & 구매 날짜(주문번호, 주문row, 주문일 dto에 입력)
		//  ㄴ 1-3 주문 테이블에 저장
		int member_num = (Integer) session.getAttribute("member_num");
		
		List<Integer> cartList =  (ArrayList) session.getAttribute("cartList");
		List<Integer> priceList =  (ArrayList) session.getAttribute("priceList");
		
		Map<String, Object> sessionMap = (Map<String, Object>) session.getAttribute("sessionMap");
		sessionMap.put("memberNum", member_num);
		
		String requestType = (String) sessionMap.get("reqestType");
		int usePoint = (Integer) sessionMap.get("usePoint");
		int savePoint = (Integer) sessionMap.get("savePoint");
		
		System.out.println("--bean_order_ok.do-------------------------------------------------------------------------------------------------------");
		System.out.println("requestType : " + requestType);
		System.out.println("사용한 포인트(usePoint) : " + usePoint);
		System.out.println("저장할 포인트(usePoint) : " + savePoint);
		
		// 1-1 장바구니 상품 정보를 가져오기
		List<CoffeeOrderDTO> orderList = orderDao.getCartListFin(cartList);
		
		// 1-2 현재 상품금액과 사용자 구매 요청시 상품금액 비교 & 구매 날짜(주문번호, 주문row, 주문일 dto에 입력)
		
		// 상품 가격 비교를 위한 변수 배열
		int[] dataPrice = new int[orderList.size()];
		int[] userPirce = new int[orderList.size()];
		
		// 오늘 날짜 현재시간 (시간 12시간형)
		LocalDateTime now = LocalDateTime.now();
		String formatNow24 = now.format(DateTimeFormatter.ofPattern("yyyyMMddkkmmss"));
		String formatNow12 = now.format(DateTimeFormatter.ofPattern("yyyyMMddhhmmss"));
		
		for(int i=0; i<orderList.size(); i++) {
			
			dataPrice[i] = orderList.get(i).getBeans_price();
			userPirce[i] = priceList.get(i); 
			System.out.println("현재 원두 가격(dataPrice) == 사용자가 구매시 원두가격(userPrice) >>> " + dataPrice[i] + "==" + userPirce[i] + " ==> " + (dataPrice[i] == userPirce[i]) );
			
			// 현재 원두 단가와 사용자가 결제 요청 시점 원두 단가가 다름
			if(dataPrice[i]!=userPirce[i]) {
				
				// 사용자가 결제 요청 시점 단가로 변경
				orderList.get(i).setBeans_price(userPirce[i]);
				
				// 결제 금액 변경 (단가 * 수량 * (그람/100) 
				int reOrderPrice =  orderList.get(i).getBeans_price() * orderList.get(i).getOrder_cnt() * (orderList.get(i).getCart_weight()/100);
				orderList.get(i).setOrder_price(reOrderPrice);
			}
			
			// 주문번호, 주문row, 주문시간 등록
			// 주문번호 
			orderList.get(i).setOrder_num("O"+formatNow24+member_num);
			// 주문row
			orderList.get(i).setOrder_row(i+1);
			// 주문일
			orderList.get(i).setOrder_date(formatNow12);
			// 사용포인트
			orderList.get(0).setUse_point(usePoint);
			
		}
		
		int result = 0;
		// 1-3. 주문 목록 db 저장
		orderDao.insertOrder(orderList);
		
		// 2. 포인트 업데이트 
		orderDao.updatePoint(sessionMap);
		
		// 3. 상품 수량 판매된 수량 만큼 제외
		orderDao.updateBeanCnt(orderList);
		
		// 4. 장바구니 목록 삭제(장바구니 페이지에서 넘어온 경우에만 목록 삭제)
		if(requestType.equals("c")) {
			orderDao.deleteCart(orderList);
		}
		
		System.out.println("-------------------------------------------------------------------------------------------------------------------------");
		
		// 5. 세션 종료("priceList","usePoint")
		session.removeAttribute("cartList");
		session.removeAttribute("priceList");
		session.removeAttribute("sessionMap");
		
		// 6. 주문내역 페이지로 이동
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='bean_order_ok.do?order="+orderList.get(0).getOrder_num() +"'");
		out.println("</script>");
	}
	
	@RequestMapping("cancelpay.do")
	public void cancelPay(HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='bean_cart.do'");
		out.println("</script>");
	}
	
	@RequestMapping("failpay.do")
	public void failPay(HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='bean_cart.do'");
		out.println("</script>");
	}
	
	@RequestMapping("bean_order_ok.do")
	public String beanOrderOkList(@RequestParam("order") String order_num, Model model) throws IOException {
		
		// 주문 테이블 가져오기
		List<CoffeeOrderDTO> orderList = orderDao.getNowOrderList(order_num);
		Map<String, Object> summaryOrder = summaryOrder(order_num, orderList);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("summaryOrder", summaryOrder);
		
		return "./cartAndOrder/orderOk";
	}
}

