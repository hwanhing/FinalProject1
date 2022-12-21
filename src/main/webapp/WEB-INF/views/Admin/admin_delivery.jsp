<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>CuppACoffee</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/frame.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/adminDelivery.css">
</head>
<body>
		<section class="header">
			<jsp:include page="../layout/Admin_header2.jsp"  />
		</section>
		
		<section class="wrap">
			<div class="blank"></div>
			<section class="main">
				<section class="main_in">
					<div class="m_header">
						<h2>배달 현황</h2>
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
	                
					<div class="m_select">
						
					</div>
					
					<div class="m_content">
	                    <table class="m_content_t">
	                        <colgroup>
	                            <col style="width: 20%">
	                            <col style="width: 30%">
	                            <col style="width: 20%">
	                            <col style="width: 30%">
	                        </colgroup>
	                        <thead>
	                            <tr>
	                                <th>주문번호</th>
	                                <th>상품명</th>
	                                <th>배달현황</th>
	                                <th>특이사항</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	
	                            <!-- foreach 돌아갈 예정 -->
	                            <tr>
	                                <td>ddd</td>
	                                <td>ㅇㅇㅇ</td>
	                                <td>
	                                    <!-- 0: 배송대기, 1: 배송중, 2: 배송완료, 3:주문취소, 4:반품, 5:환불 -->
	                                    <button class="btn c_delivery_btn js_delivery_btn">배송중</button>
	                                </td>
	                                <td>ㄴㄴㄴ</td>
	                            </tr>
	
	                            <!-- --------- -->
	                            <tr>
	                                <td>ddd</td>
	                                <td>ㅇㅇㅇ</td>
	                                <td>
	                                    <!-- 0: 배송대기, 1: 배송중, 2: 배송완료, 3:주문취소, 4:반품, 5:환불 -->
	                                    <button class="btn c_delivery_btn js_delivery_btn">배송중</button>
	                                </td>
	                                <td>ㄴㄴㄴ</td>
	                            </tr>
	                            <!-- --------- -->
	
	                        </tbody>
	                    </table>
                	</div>
				</section>
				<%-- main_in 끝 ----------------------------%>
			</section>
			<%-- main 끝 -----------------------------------%>
		</section>
		<%-- wrap 끝 ---------------------------------------%>
		
</body>
</html>