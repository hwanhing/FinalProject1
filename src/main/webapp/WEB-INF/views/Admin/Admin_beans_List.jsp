<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원두 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.easing/1.3/jquery.easing.1.3.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script type="text/javascript">
	// 탭 두개 콘텐츠 값 다르게 보여주는 함수.
	$(document).ready(function(){
		   
		  $('ul.tabs li').click(function(){
		    var tab_id = $(this).attr('data-tab');
		 
		    $('ul.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');
		 
		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
		  });
	
	});
</script>
<style type="text/css">
	
	.empty1{
		margin-left: 23%;
	}
	
	.empty2{
		
	}
	
	.table{
		width: 95%;
	}
	
	.table_box{
		margin-top: 3%;
	}
	
	.page1{
		margin-left: 30%;
	}
	
	#hr1{
		border: solid 1px #000; 
		opacity: 100 !important;
	}
	/* 탭 메뉴 */
	ul.tabs{
	  margin: 0px;
	  padding: 0px;
	  list-style: none;
	}
	
	/* 탭 메뉴 글 */
	ul.tabs li{
	  background: none;
	  color: #222;
	  display: inline-block;
	  padding: 10px 15px;
	  cursor: pointer;
	  font-size: 15px;
	}	
	
	ul.tabs li.current{
	  /* background: #F4E9DC; */
	  color: #734338;
	  font-weight: bold;
	  border-radius: 0px 0px 0px 0px;
	  border-bottom: 3px solid #734338;
	}
	
	/* 탭 콘텐츠 영역 */
	.tab-content{
	  display: none;  
	  padding: 15px 0;
	}
	
	.tab-content.current{
	  display: inherit;
	}
	
	.title_box{
		margin-bottom: 3%;
	}
	
	tr{
		text-align: center;
	}
	
	.c_check{
		width: 6%;
	}
	
	.c_num{
		width: 10%;
	}
	
	.c_name{	
		text-align: left;
	}
	
	.btn_1{
		background-color: #fff;
		border: 1px solid gray;
		border-radius: 10px;
	}
	
	.paging{
		border: none;
	}
	.page1,
	.pagination,
	.page-item{
		border: none;
		}
	.pagination{
	
		color: #000;
	}	
</style>
</head>


<body>
<jsp:include page="../layout/Admin_header2.jsp"  />
	 <c:set value="${beans_list }" var="list" /> 
	 <c:set var="paging" value="${Paging }" />
	 	
	 	<div class="empty1">
	 		<div class="table_box">
	 		
	 			<h2><b>원두 관리</b></h2>
	 			
	 			<br><br>
	 				
	  <ul id="tabs" class="tabs">
	    <li class="tab-link current" data-tab="tab1">원두 리스트</li>
		 <li class="tab-link" data-tab="tab2">원두 새로 등록</li>	    
	  </ul>	 				
	 		<div id="tab1" class="tab-content current">		
	 		<br>
	 		<div style="display: flex;">
	 			<h6 style="margin-bottom: 0; margin-top: 7px;"><b>원두 검색</b></h6>
	 			<input style="width: 300px; height: 25px; border: 1px solid #000; margin-left: 60%;">
	 			<button>검색</button>
	 		</div>
	 		<hr id="hr1" width="95%">
	 		
	 		 <c:set var="count" value="${Count }" />
	 		 	<div class="title_box">
	 		 		원두 상품 총 개수 : ${count }개
	 		 	</div>

		 		<table class="table">
		 			<tr>
		 				<th class="c_check">선택</th>
		 				<th class="c_num">원두번호</th>
		 				<th class="c_name">원두이름</th>
		 				<th>주문량</th>
		 				<th>원두가격</th>
		 				<th>원두재고</th>
		 				<th>관리</th>
		 			</tr>
	
		 		 <c:forEach items="${list }" var="e">
		 		 	<tr>
		 		 		<td>
		 		 			<input type="checkbox">
		 		 		</td>
		 		 		<td>
		 		 			${e.getBeans_num()}
		 		 		</td>
		 		 		<td class="c_name">
		 					${e.getBeans_name() }
		 				</td>
		 				<td>
		 					0
		 				</td>
		 				<td>
		 					<fmt:formatNumber value="${e.getBeans_price() }" />원
		 				</td>
		 				<td>
		 					${e.getBeans_count() }
		 		 		</td>
		 		 		<td>
		 		 			<button class="btn_1">수정</button>
		 		 			<button class="btn_1">삭제</button>
		 		 		</td>
		 		 	</tr>
		 		 
		 		 </c:forEach>
		 		</table>
	 		
	 
	 	<div class="empty2">
			<!-- 페이징 처리 -->
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
		                     href="admin_beans.do?page=${paging.getEndBlock() + 1 }">▶</a></li>
		                  <li class="page-item"><a class="page-link paging_btn"
		                     href="admin_beans.do?page=${paging.getAllPage() }">▶▶</a></li>
		               </c:if>
		            </ul>
		         </nav>				
				</div>
			</div>
			
			
			</div>	
			
			<div id="tab2" class="tab-content">
				
				<br>
				<h6 style="margin-bottom: 0; margin-top: 7px;"><b>원두 추가</b></h6>
				<hr id="hr1" width="95%">
				
				
				
			</div>
		</div>
	</div>
</body>
</html>