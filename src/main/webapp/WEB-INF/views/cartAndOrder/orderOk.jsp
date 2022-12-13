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
</head>
<body>
	
	 <%-- 해더 --%>
  	 <jsp:include page="../layout/header.jsp" />
  
  	 <div class="blank"></div>
  	 
	  <!-- 컨텐츠 부분 -->
        <section class="content">
            <section class="order_wrap">
                <section class="order_top">
                    <!-- 홈 > 장바구니 > 주문서작성 > 결제완료 > 주문완료 -->
                    <section class="order_path">
                        <ul class="list order_path_list">
                            <li>
                                <a href="<%=request.getContextPath() %>" class="a order_path_a">홈</a>
                            </li>
                            <li>
                                <a class="a order_path_a disable">장바구니</a>
                            </li>
                            <li>
                                <a class="a order_path_a disable">주문서작성</a>
                            </li>
                            <li>
                                <a href="#" class="a last order_path_a"><b>주문완료</b></a>
                            </li>
                        </ul>
                    </section>
                </section>

                <!-- 주문 완료 목록 -->
                <section class="order_main">
                    
                    <div class="order_main_in">
                        <!-- head -->
                        <div class="m_header">
                            <h3 class="point_text">주문내역</h3>
                            <div class="e_btn_area">
                                <button class="btn etc_btn">더보기</button>
                            </div>
                        </div>
                        <!-- main -->
                        <div class="m_main">
                           
                            <!-- 요약 -->
                            <div class="m_main_t m_sumary_t">
                                <h4 class="middle_text">요약</h4>
                                <table class="m_table m_s_t">
                                    <colgroup>
                                        <col style="width: 15%">
                                        <col style="width: 10%">
                                        <col style="width: 30%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                    </colgroup>
                                    <tr>
                                        <th>주문번호</th>
                                        <th>주문일</th>
                                        <th>상품명</th>
                                        <th>주문금액</th>
                                        <th>사용포인트</th>
                                        <th>결제금액</th>
                                    </tr>
                                    <tr>
                                    	<c:set var="summary" value="${summaryOrder }"/>
                                    		<td class="txt_center">${summary.order_num }</td>
	                                        <td class="txt_center">${summary.order_date }</td>
	                                        <td>${summary.order_product }</td>
	                                        <td class="txt_right">
	                                        	<fmt:formatNumber type="currency" value="${summary.order_price_total }"/> 
	                                        </td>
	                                        <td class="txt_right">
	                                        	<fmt:formatNumber type="currency" value="${summary.use_point }"/>
	                                        </td>
	                                        <td class="txt_right">
	                                        	<fmt:formatNumber type="currency" value="${summary.order_price_total - summary.use_point }"/>
	                                        </td>
                                    </tr>
                                </table>
                              
                            </div>
                            
                            <!-- 상세 -->
                            <div class="m_main_t m_detail_t">
                                <h4 class="middle_text">상세</h4>
                                <table class="m_table m_d_t">
                                    <colgroup>
                                        <col style="width: 10%">
                                        <col style="width: 45%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                    </colgroup>
                                    <tr>
                                        <th>순번</th>
                                        <th>주문상품</th>
                                        <th>그람</th>
                                        <th>수량</th>
                                        <th>금액</th>
                                    </tr>
                                     
                                    <c:forEach items="${orderList}" var="list">
                                    	<tr class="t_hr">
	                                        <td class="txt_center">${list.getOrder_row() }</td>
	                                        <td>${list.getBeans_name() }</td>
	                                        <td class="txt_right">${list.getCart_weight() } g</td>
	                                        <td class="txt_right">${list.getOrder_cnt() }</td>
	                                        <td class="txt_right">
	                                        	<div>
	                                        		<fmt:formatNumber type="currency" value="${list.getOrder_price() }"/>
	                                        	</div>
	                                        </td>
	                                    </tr>
                                    </c:forEach> 
                                   
                                   <!--  <tr class="t_hr">
                                        <td class="txt_center">d</td>
                                        <td>dd</td>
                                        <td class="txt_right">d</td>
                                        <td class="txt_right">d</td>
                                        <td class="txt_right">d</td>
                                    </tr> -->
                                </table>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
        </section>
        
        <%-- 푸터 --%>
        <jsp:include page="../layout/footer.jsp" />
</body>
</html>