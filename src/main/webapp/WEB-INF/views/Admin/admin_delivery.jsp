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
 	<section class="wrap">
		<section class="header">
			<jsp:include page="../layout/Admin_header2.jsp"  />
		</section>
		<section class="main">
			<section class="main_in">
				<div class="m_header">
					<p>배달 현황</p>
				</div>
				<div class="m_summary">
					<div class="m_s_delivery m_s_delivery_ok">
						<h3>배송완료</h3>
						<h4><a href="">5</a></h4>
					</div>
					<div class="hr_div"></div>
					<div class="m_s_delivery m_s_delivery_ing">
						<h3>배송중</h3>
						<h4><a href="">3</a></h4>
					</div>
					<div class="hr_div"></div>
					<div class="m_s_delivery m_s_delivery_before">
						<h3>배송대기</h3>
						<h4><a href="">5</a></h4>
					</div>
				</div>
				<div class="m_select">
					
				</div>
				<div class="m_content">
					<table>
						<tr>
							<th>주문번호</th>
							<th>상품명</th>
							<th>배달현황</th>
						</tr>
					</table>
				</div>
			</section>
		</section>
	</section>
</body>
</html>