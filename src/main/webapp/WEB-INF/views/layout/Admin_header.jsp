<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/admin.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/8cabb9ab88.js" crossorigin="anonymous"></script>
</head>
<body>
		<div class="cont">
			<div>
				<div>
					
					<img class="img_1" src="<%=request.getContextPath()%>/resources/images/cuppa_logo.png" alt="cupofcoffee">						
							<a class="out_btn" href="<%=request.getContextPath()%>/logout.do">
								<i class="fa-solid fa-right-from-bracket">
								</i>
							</a>
					<ul class="navigation">
					  <li><a href="<%=request.getContextPath()%>/admin_main.do">메인</a></li>
					  <li><a href="<%=request.getContextPath()%>/admin_memeber.do">회원관리</a></li>
					  <li><a href="<%=request.getContextPath()%>/admin_beans.do">원두관리</a></li>
					  <li><a href="<%=request.getContextPath()%>/admin_add.do">상품등록</a></li>
					  <li><a href="<%=request.getContextPath()%>/admin_orderlist.do">주문내역</a></li>
					  <li><a href="<%=request.getContextPath()%>/admin_after.do">후기글</a></li>
					  <li><a href="<%=request.getContextPath()%>/admin_center.do">고객센터</a></li>
					</ul> 
				</div>
			</div>	
		</div>
</body>
