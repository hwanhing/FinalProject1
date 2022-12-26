<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
.first{
	margin-top: 100px;
	margin-left: 23%;
}
.seconed{
	
}
.third{
	
}
.table{
		width: 1400px;
	}
	
.th1{
width: 70px;
}

.line{
width: 1600px;
color:#734338;
}
.span1{
color: #a66b56;
}
.h11{
color: #734338;
}

.pages{
margin-top:30px;
margin-left: 550px;
}
tr,td{
text-align: center;

}
</style>
</head>
<body>
<jsp:include page="../layout/Admin_header2.jsp"  />
<c:set value="${afterList }" var="afterList" />
<c:set var="paging" value="${Paging }" />
<div class="first">
	<h1 class="h11"><span class="span1">후기글</span> 관리</h1>
	<hr class="line" style="height: 10px;">
	<div class="seconed"> 
		<div class="third">
			<table class="table">
				<tr>
				<th class="th1">글번호</th>
				<th>원두이름</th>
				<th>작성자</th>
				<th>작성일</th>
				</tr>
			<c:forEach items="${afterList }" var="dto">
			<tr onclick="location.href='admin_Write_cont.do?num=${dto.getWrite_num()}'">
				<td>${dto.getWrite_num() }</td>
				<td>${dto.getBeans_name() }</td>
				<td>${dto.getMember_id() }</td>
				<td>${dto.getWrite_date() }</td>	
			</tr>
			</c:forEach>
			</table>
			<!--page  -->
		<div class="pages">
			<div class="page1">
				<nav class="paging">
		            <ul class="pagination">
		               <li class="page-item"><a class="page-link paging_btn"
		                  href="admin_beans.do?page=1">◀◀</a></li> 
		               <c:if test="${paging.getPage() == 1 }">
		                <li>
		                 <a class="page-link paging_btn" 
		                        href="admin_beans.do?page=1">◀</a> 
		                </li>
		                </c:if>
		                <c:if test="${paging.getPage() != 1 }">
		                <li>
		                  <a class="page-link paging_btn" 
		                        href="admin_beans.do?">◀</a>
		                 
		                </li>
		                </c:if>
		               <c:forEach begin="${paging.getStartBlock() }" end="${paging.getEndBlock() }" var="i">
		      
		                  <c:if test="${i == paging.getPage() }">
		                     <li class="page-item active" aria-current="page"><a
		                        class="page-link paging_btn"   href="admin_beans.do">${i }</a></li>
		                  </c:if>
		      
		                  <c:if test="${i != paging.getPage() }">
		                     <li class="page-item"><a class="page-link paging_btn" 
		                        href="admin_beans.do?page=${i }">${i }</a></li>
		                  </c:if>
		               </c:forEach>
		      
		               <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
		                  <li class="page-item"><a class="page-link paging_btn"
		                     href="admin_beans.do?page=${paging.getEndBlock() + 1 }">▶</a></li>
		                  <li class="page-item"><a class="page-link paging_btn"
		                     href="admin_beans.do?page=${paging.getAllPage() }">▶▶</a></li>
		               </c:if>
		            </ul>
		         </nav>				
				</div>
			</div>	
		</div>
	</div>
</div>
</body>
</html>