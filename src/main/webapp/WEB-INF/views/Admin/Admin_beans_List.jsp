<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원두 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style type="text/css">
	
	.empty1{
		margin-left: 25%;
	}
	
	.empty2{
		
	}
	
	.table{
		width: 90%;
	}
	
	.table_box{
		margin-top: 5%;
	}
	
	.paging{
		margin-left: 20%;
	}
	 
</style>
</head>


<body>
<jsp:include page="../layout/Admin_header2.jsp"  />
	 <c:set value="${beans_list }" var="list" /> 
	 <c:set var="paging" value="${Paging }" />
	 	
	 	<div class="empty1">
	 		<div class="table_box">
	 		
	 			<h3><b>원두 관리</b></h3>
	 			<br>
	 				
		 		<table class="table">
		 			<tr>
		 				<th>원두번호</th>
		 				<th>원두이름</th>
		 				<th>원두가격</th>
		 				<th>원두제고</th>
		 			</tr>
	
		 		 <c:forEach items="${list }" var="e">
		 		 	<tr>
		 		 		<td>
		 		 			${e.getBeans_num()}
		 		 		</td>
		 		 		<td>
		 					${e.getBeans_name() }
		 				</td>
		 				<td>
		 					${e.getBeans_price() }
		 				</td>
		 				<td>
		 					${e.getBeans_count() }
		 		 		</td>
		 		 	</tr>
		 		 
		 		 </c:forEach>
		 		</table>
	 		
	 		</div>
		</div>	
	 
	 	<div class="empty2">
			<!-- 페이징 처리 -->
			<div class="page">
				<nav class="paging">
		            <ul class="pagination">
		               <li class="page-item"><a class="page-link paging_btn"
		                  href="admin_beans.do?page=1">First</a></li> 
		               <c:if test="${paging.getPage() == 1 }">
		                <li>
		                 <a class="page-link paging_btn" 
		                        href="admin_beans.do?page=1">Previous</a> 
		                </li>
		                </c:if>
		                <c:if test="${paging.getPage() != 1 }">
		                <li>
		                  <a class="page-link paging_btn" 
		                        href="admin_beans.do?">Previous</a>
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
		                     href="admin_beans.do?page=${paging.getEndBlock() + 1 }">Next</a></li>
		                  <li class="page-item"><a class="page-link paging_btn"
		                     href="admin_beans.do?page=${paging.getAllPage() }">End</a></li>
		               </c:if>
		            </ul>
		         </nav>				
			</div>
		</div>
				
		
</body>
</html>