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
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/orderListD.css">
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

				<!-- 변경 후 -------------------------------------------------------------- -->
				
				 <section class="order_main"> 
                    <div class="order_main_in">
                        <!-- head -->
                        <div class="m_header">
                            <h3 class="point_text">주문 상세정보</h3>
                        </div>

                        <!-- main -->
                        <div class="m_main">
                            <!-- 주문 내역 -->
                            <div class="m_order_rows m_main_t m_detail_t">
                                <div class="m_order_num">
                                    <ul class="list">
                                        <li>주문일 | <span><b>2022.12.16</b></span> </li>
                                        <li>주문번호 | <span><b>O202212161413221</b></span> </li>
                                    </ul>
                                </div>
                                <table class="m_table m_s_t">
                                    <colgroup>
                                        <col style="width: 10%">
                                        <col style="width: 60%">
                                        <col style="width: 20%">
                                        <col style="width: 10%">
                                    </colgroup>
                                    <tr>
                                        <th>순번</th>
                                        <th>상품 정보</th>
                                        <th>상품 금액</th>
                                        <th>재구매</th>
                                    </tr>
                                    <!-- foreach로 돌아갈 예정 -->
                                    <tr class="m_tr">
                                       
                                        <td class="p_row txt_center">1</td>
                                        <!-- 이미지 -->
                                        <td class="p_cont_area">
                                            <div class="p_cont_imgcont">
                                                <div class="p_img">
                                                    <a class="p_img_a" href="">
                                                        <img src="./resources/orderimg/coffeebean.png" alt="">
                                                    </a>
                                                </div>
                                                <div class="p_cont">
                                                    <p class="sub_middle_text">상품이름</p>
                                                    <p class="small_txt">그람 : <span> 100</span> </p>
                                                    <p class="small_txt">수량 : <span> 1</span> </p>
                                                    <p class="small_txt">원두갈기 : <span> 갈아주세요</span> </p>
                                                </div>
                                            </div>
                                        </td>
                                      
                                        <td class="p_price txt_right">10,000 원</td>
                                        <td class="p_reorder">
                                            <button class="btn small_txt">재구매하기</button>
                                        </td>
                                    </tr>
                                </table>
                                
                            </div>
                            <!-- ---------------------------- -->
                            
                            <!-- 결제 정보 -->
                            <div>
                                <div class="m_header">
                                    <h3 class="point_text">주문/결제 정보</h3>
                                </div>
                                <div class="o_all">
                                    <div class="o_pay_point">
                                        <div class="o_order_pay">
                                            <div class="o_order">
                                                <h5 class="middle_text">주문금액</h5>
                                                <table>
                                                    <tr>
                                                        <th>상품금액</th>
                                                        <td class="txt_right">
                                                            10000원
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>배송비</th>
                                                        <td class="txt_right">0원</td>
                                                    </tr>
                                                    <tr>
                                                        <th>포인트사용</th>
                                                        <td class="txt_right">- 1000원</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="o_pay">
                                                <h5 class="middle_text">결제금액</h5>
                                                <table>
                                                    <tr>
                                                        <th>카카오페이</th>
                                                        <td class="txt_right">10000원</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="o_point">
                                            <h5 class="middle_text">포인트</h5>
                                            <table>
                                                <tr>
                                                    <th>포인트적립</th>
                                                    <td class="txt_right">10000원</td>
                                                </tr>
                                            </table>
                                        </div> 
                                    </div>
                                    <div class="o_conclusion">
                                        <table class="o_conclusion_t">
                                            <tr>
                                                <th>주문금액</th>
                                                <td class="txt_right">10000원</td>
                                            </tr>
                                            <tr>
                                                <th>배송비</th>
                                                <td class="txt_right">+ 0원</td>
                                            </tr>
                                            <tr>
                                                <th>포인트사용</th>
                                                <td class="txt_right">- 1000원</td>
                                            </tr>
                                            <tr class="sep_tr">
                                                <td colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <th>결제금액</th>
                                                <td class="txt_right">9000원</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                               
                            </div>
                           
                        </div>
                    </div>
                </section>
				
				
				<!--------------------------------------------------------------------------->
				
				<!-- 변경 전 -------------------------------------------------------------- -->
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
	                                        <td>${list.getBeans_name() }<br>
	                                        	<c:if test="${list.getCart_grind() eq 0 }">
	                                         	 	<i class="fa-solid fa-check"></i>
		                                         	 원두 그대로 주세요
		                                         </c:if>
		                                         
		                                         <c:if test="${list.getCart_grind() eq 1 }">
		                                         	 <i class="fa-solid fa-check"></i>
		                                         	 원두 갈아주세요
		                                         </c:if>
	                                        </td>
	                                        <td class="txt_right">${list.getCart_weight() } g</td>
	                                        <td class="txt_right">${list.getOrder_cnt() }</td>
	                                        <td class="txt_right">
	                                        	<div>
	                                        		<fmt:formatNumber type="currency" value="${list.getOrder_price() }"/>
	                                        	</div>
	                                        </td>
	                                    </tr>
                                    </c:forEach> 
                                   
                                </table>
                            </div>
                        </div>
                        
                        <!--------------------------------------------------------------------------->
                    </div>
                </section>
            </section>
        </section>
        
        <%-- 푸터 --%>
        <jsp:include page="../layout/footer.jsp" />
</body>
</html>