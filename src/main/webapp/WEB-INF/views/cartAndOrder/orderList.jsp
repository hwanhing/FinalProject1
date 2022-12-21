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
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
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
                     
                     <!-- 배달 현황 요약 -->
	                <div class="m_summary">
	                    <div class="m_summary_in">
	                    
	                        <div class="m_s_delivery m_s_delivery_ok">
	                            <h3 class="point_text">배송완료</h3>
	                            <h4 class="cnt_txt">
	                            	<a href="" class="a">5</a>
	                            </h4>
	                        </div>
	                        <div class="hr_div"></div>
	                        <div class="m_s_delivery m_s_delivery_ing">
	                            <h3 class="point_text">배송중</h3>
	                            <h4 class="cnt_txt">
	                            	<a href="" class="a">3</a>
	                            </h4>
	                        </div>
	                        <div class="hr_div"></div>
	                        <div class="m_s_delivery m_s_delivery_before">
	                            <h3 class="point_text">배송대기</h3>
	                            <h4 class="cnt_txt">
	                            	<a href="" class="a">5</a>
	                            </h4>
	                        </div>
	                        <div class="hr_div"></div>
	                        <div class="m_s_delivery m_s_delivery_before">
	                            <h3 class="point_text">주문취소</h3>
	                            <h4 class="cnt_txt">
	                            	<a href="" class="a">5</a>
	                            </h4>
	                        </div>
	                        
	                    </div>
	                </div>
                     
                     
                     <!-- search -->
                     <div class="m_search">
                         <table class="m_table">
                             <colgroup>
                                 <col style="width: 20%">
                                 <col style="width: 70%">
                                 <col style="width: 10%">
                             </colgroup>
                             <tr>	
                             	<td>
                             		<div class="s_date">
                                    	 <button class="btn etc_btn sub_middle_text" onclick="location.href='order_list.do'">전체보기</button>
                                     </div>
                             	</td>
                                 <td class="search_date">
                                     <div class="s_date">
                                     	 
                                     	  <c:set var="now" value="<%=new java.util.Date()%>" />
        								  <c:set var="nowFormat"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
                                     	
                                     	 <c:if test="${empty dateMap }">
                                     	 	 <input type="date" class="start_date" value="${nowFormat }">
	                                         <span>-</span> 
	                                         <input type="date" class="end_date" value="${nowFormat }">
                                     	 </c:if>
                                     	 
                                     	 <c:if test="${!empty dateMap }">
                                     	 	 <input type="date" class="start_date" value="${dateMap.get('start') }">
	                                         <span>-</span> 
	                                         <input type="date" class="end_date" value="${dateMap.get('end') }">
                                     	 </c:if>
                                       
                                     </div>
                                 </td>
                                 <td class="search_btn">
                               		<div class="s_date">
                                    	 <button class="btn etc_btn sub_middle_text" onclick="searchData()">조회</button>
                                     </div>
                                 </td>
                             </tr>
                         </table>
                     </div>
                     <!-- main -->
                     <div class="m_main">                
                       
                        <c:if test="${empty orderList }">
                        	<table class="m_table m_rows_table">
                        		<tr>
                        			<th>주문 내역이 없습니다.</th>
                        		</tr>
                        	</table>
                        </c:if>
                       
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
                                     <col style="width: 50%">
                                     <col style="width: 20%">
                                     <col style="width: 10%">
                                 </colgroup>
                                 
                                 <c:forEach items="${orderList }" var="list">
                                 
                                 	<c:if test="${list.getOrder_month().equals(orderMonth)}">
	                             
		                                 <tr class="m_order_row">
		                                     <td class="p_date_area txt_center">
		                                         <a class="a p_date" href="<%=request.getContextPath() %>/bean_order_cont.do?order=${list.getOrder_num() }">${list.getOrder_num() }</a>
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
		                                     
		                                     <%-- 만약 배송중이면 배송완료 버튼을 누를 수 있음 --%>
		                                     <c:if test="">
		                                     </c:if>
		                                     <td class="txt_center">
		                                     	배송현황
		                                     </td>
		                                 </tr>
	                                 
                                 	</c:if>
                                 
                                 </c:forEach>
                                 
                             </table>
                         </div>

                     </c:forEach>
                     
                      <div class="m_page">
                         <div>
                             <!-- 페이징 -->
							<%-- 
							<c:if test="${paging.getPage() > paging.getBlock() }">
								<a href="board_list.do?page=1">
									 <i class="fa-solid fa-backward"></i>
								</a>
								<a href="board_list.do?page=${paging.getStartBlock() - 1}">
									 <i class="fa-solid fa-caret-left"></i>
								</a>
							</c:if>
							
							<c:forEach begin="${paging.getStartBlock() }" end="${paging.getEndBlock() }" var="i">
								<c:if test="${i == paging.getPage() }">
									<b><a href="board_list.do?page=${i }">[${i }]</a></b>
								</c:if>
								<c:if test="${i != paging.getPage() }">
									<a href="board_list.do?page=${i }">[${i }]</a>
								</c:if>
							</c:forEach>
							
							<c:if test="${paging.getEndBlock() < paging.getAllPage() }">
								<a href="board_list.do?page=${paging.getEndBlock()+1 }">
									<i class="fa-solid fa-caret-right"></i>
								</a>
								<a href="board_list.do?page=${paging.getAllPage() }">
									<i class="fa-solid fa-forward"></i>
								</a>
							</c:if>  
							--%>  
                         </div> 
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