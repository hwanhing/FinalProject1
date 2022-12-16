<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		
	<title>CuppACoffee</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/frame.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/orderOk.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/orderList.css">
</head>
<body>

     <%-- 해더 --%>
  	 <jsp:include page="../layout/header.jsp" />
  
  	 <div class="blank"></div>
	 
	 <!-- 컨텐츠 부분 -->
     <section class="content">
         <section class="order_wrap">
             <!-- 주문 완료 목록 -->
             <section class="order_main"> 
                 <div class="order_main_in">
                     <!-- head -->
                     <div class="m_header">
                         <h3>주문내역</h3>
                     </div>
                     <!-- search -->
                     <div class="m_search">
                         <table class="m_table">
                             <colgroup>
                                 <col style="width: 50%">
                                 <col style="width: 40%">
                                 <col style="width: 10%">
                             </colgroup>
                             <tr>
                                 <td class="search_month">
                                     <!-- 현재월의 -6개월 -->
                                     <ul class="list s_month">
                                         <li><button class="btn sel_month clicked">7월</button></li>
                                         <li><button class="btn sel_month">8월</button></li>
                                         <li><button class="btn sel_month">9월</button></li>
                                         <li><button class="btn sel_month">10월</button></li>
                                         <li><button class="btn sel_month">11월</button></li>
                                         <li><button class="btn sel_month">12월</button></li>
                                     </ul>
                                 </td>
                                 <td class="search_date">
                                     <div class="s_date">
                                         <input type="date">
                                         <span>-</span>
                                         <input type="date">
                                     </div>
                                 </td>
                                 <td class="search_btn">
                                     <button class="btn etc_btn">조회</button>
                                 </td>
                             </tr>
                         </table>
                     </div>
                     <!-- main -->
                     <div class="m_main">                
                         <!-- for each 예정(월별) -->
                         <!-- 주문 월 -->
                         <div class="m_order_month">
                             <h4>2022.10</h4>
                         </div>
                         <!-- 주문 내역 -->
                         <div class="m_order_rows">  
                             <!-- 주문 월 주문내역  -->
                             <table class="m_table m_rows_table">
                                 <colgroup>
                                     <col style="width: 20%">
                                     <col style="width: 60%">
                                     <col style="width: 20%">
                                 </colgroup>
                                 <!-- for each 예정(월별 주문내역) -->
                                 <tr class="m_order_row">
                                     <td class="p_date_area txt_center">
                                         <a class="a p_date" href="">202212161215301</a>
                                         <p>(2022.12.16)</p> 
                                     </td>
                                  
                                     <td class="p_cont_area">
                                         <div class="p_cont_imgcont">
                                             <div class="p_img">
                                                 <a class="p_img_a" href="">
                                                     <img src="./resources/orderimg/coffeebean.png" alt="">
                                                 </a>
                                             </div>
                                             <div class="p_cont">
                                                 <p>상품이름 외 2</p>
                                             </div>
                                         </div>
                                     </td>
                                     <td class="txt_right">10,000 원</td>
                                 </tr>
                             </table>
                             
                         </div>

                         <div class="m_page">
                             <div>
                                 <!-- 페이지 -->
                                 <button class="btn">더보기</button>
                             </div>
                         </div>
                     </div>
                 </div>
             </section>
             <%-- order_main 끝 ---------------------------------------------------------------%>
         </section>
         <%-- order_wrap 끝 -------------------------------------------------------------------%>
     </section>
     <%-- content 끝 --------------------------------------------------------------------------%>
     
     
     <%-- 푸터 --%>
     <jsp:include page="../layout/footer.jsp" />
</body>
</html>