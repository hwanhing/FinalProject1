<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		
	<title>CuppACoffee</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/frame.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/orderOk.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/orderList.css">
    <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
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
                                 <col style="width: 40%">
                                 <col style="width: 50%">
                                 <col style="width: 10%">
                                 <%-- 
                                 <col style="width: 50%">
                                 <col style="width: 40%">
                                 <col style="width: 10%">
                                  --%>
                             </colgroup>
                             <tr>
                                  <td class="search_term">
					                <ul class="list s_term">
					                    <div>
					                        <li class="sel">
					                            <button class="btn s_term_btn" onclick="openLi()">
					                                <p>기간 선택</p>
					                                <i class="fa-solid fa-caret-down"></i>
					                            </button>
					                        </li>
					                        <li class="sel_term display_none" value="-">
					                            <button class="btn" >
					                                <p>-</p>
					                            </button >
					                        </li>
					                        <li class="sel_term display_none" value="1">
					                            <button class="btn" >
					                                <p>1개월 전</p>
					                            </button >
					                        </li>
					                        <li class="sel_term display_none" value="3">
					                            <button class="btn" >
					                                <p>3개월 전</p>
					                            </button >
					                        </li>
					                        <li class="sel_term display_none" value="6">
					                            <button class="btn" >
					                                <p>6개월 전</p>
					                            </button>
					                        </li>
					                        <li class="sel_term display_none" value="12">
					                            <button class="btn" >
					                                <p>12개월 전</p>
					                            </button>
					                        </li>
					                    </div>
					                </ul>
					            </td>
					            <!-- <td class="search_month"> -->
                                     <!-- 현재월의 -6개월 -->
                                     <!-- <ul class="list s_month">
                                         <li><button class="btn sel_month clicked">7월</button></li>
                                         <li><button class="btn sel_month">8월</button></li>
                                         <li><button class="btn sel_month">9월</button></li>
                                         <li><button class="btn sel_month">10월</button></li>
                                         <li><button class="btn sel_month">11월</button></li>
                                         <li><button class="btn sel_month">12월</button></li>
                                     </ul> -->
                                 <!-- </td> -->
                                 <td class="search_date">
                                     <div class="s_date">
                                     	 
                                         <input type="date" class="start_date">
                                         <span>-</span>
                                         <input type="date" class="end_date">
                                     
                                     </div>
                                 </td>
                                 <td class="search_btn">
                               		<div class="s_date">
                                    	 <button class="btn etc_btn sub_middle_text">조회</button>
                                     </div>
                                 </td>
                             </tr>
                         </table>
                     </div>
                     <!-- main -->
                     <div class="m_main">                
                       
                        <c:forEach items="${orderMonArr }" var="month">
                        <c:set var="orderMonth" value="${month}" />
                        
                         <!-- 주문 월 -->
                         <div class="m_order_month">
                             <h4 class="point_text">${month }</h4>
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
                                 
                                 <c:forEach items="${orderList }" var="list">
                                 
                                 	<c:if test="${list.getOrder_month().equals(orderMonth)}">
	                             
		                                 <tr class="m_order_row">
		                                     <td class="p_date_area txt_center">
		                                         <a class="a p_date" href="<%=request.getContextPath() %>/bean_order_ok.do?order=${list.getOrder_num() }">${list.getOrder_num() }</a>
		                                         <p>(${list.getOrder_date().substring(0,10) })</p> 
		                                     </td>
		                                  
		                                     <td class="p_cont_area">
		                                         <div class="p_cont_imgcont">
		                                             <div class="p_img">
		                                                 <a href="<%=request.getContextPath() %>/bean_content.do?num=${list.getBeans_num()}" class="p_img_a">
		                                                     <img src="${list.getBeans_img() }" alt="${list.getBeans_name() }">
		                                                 </a>
		                                             </div>
		                                             <div class="p_cont">
		                                                 <p>${list.getBeans_name() }</p>
		                                             </div>
		                                         </div>
		                                     </td>
		                                     <td class="txt_right">
		                                     	<fmt:formatNumber type="currency" value="${list.getOrder_price() }"/>
		                                     </td>
		                                 </tr>
	                                 
                                 	</c:if>
                                 
                                 </c:forEach>
                                 
                             </table>
                         </div>

                        <!--  <div class="m_page">
                             <div>
                                 페이지
                                 <button class="btn">더보기</button>
                             </div>
                         </div> -->
                     
                     </c:forEach>
                     </div>
                     <%-- m_main 끝 -----------------------------------------------------------%>
                 </div>
             </section>
             <%-- order_main 끝 ---------------------------------------------------------------%>
         </section>
         <%-- order_wrap 끝 -------------------------------------------------------------------%>
     </section>
     <%-- content 끝 --------------------------------------------------------------------------%>
     
     
     <%-- 푸터 --%>
     <jsp:include page="../layout/footer.jsp" />
     <script src="<%=request.getContextPath() %>/resources/js/cartAndOrderJs/orderList.js"></script>
</body>
</html>