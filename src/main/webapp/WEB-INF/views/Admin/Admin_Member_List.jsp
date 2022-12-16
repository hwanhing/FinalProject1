<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="<%=request.getContextPath()%>/resources/css/admin_member.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$( "#member_table tr" ).on( "mouseover", function() {
    $( this ).css( "background-color", "#f4f4f4" );
    $( this).children("tr").css( "cursor", "pointer" );
});

$( "#member_table tr" ).on( "mouseleave", function() {
    $( this ).css( "background-color", "white" );
});


</script>

<body>
<jsp:include page="../layout/Admin_header2.jsp"  />
	 <c:set value="${memberList }" var="member_list" /> 
	 <c:set var="paging" value="${Paging }" />
		<div class="container">
			<div class="warp">
				<table class="table" id="member_table">
				  <thead>
				    <tr>
				      <th scope="col">회원번호</th>
				      <th scope="col">회원아이디</th>
				      <th scope="col">회원이름</th>
				      <th scope="col">회원가입일</th>
				      <th scope="col"></th>
				    </tr>
				  </thead>
				  <c:if test="${!empty member_list }">
				  	<c:forEach items="${member_list }" var="dto">
						  <tbody>
								    <tr  onclick="location.href='admin_cont.do?num=${dto.getMember_num()}&page=${paging.getPage()}'">
								      <th scope="row">${dto.getMember_num() } </th>
								      <td>${dto.getMember_name() }</td>
								      <td>${dto.getMember_id() }</td>
								      <td>${dto.getMember_date() }</td>
								      <td>
								  							     
											<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
											 <span>삭제</span>
											</button>
											
											<!-- Modal -->
											<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
											        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											      </div>
											      <div class="modal-body">
											        정말로 회원을 삭제처리하시겟습니까?					
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
											        <button type="button" class="btn btn-primary" onclick="location.href='admin_delete.do'">삭제</button>
											      </div>
											    </div>
											  </div>
											</div>		<!-- 모달끝 -->						      
								      </td><!--  버튼끝 -->
								    </tr>
								    <tr> 
						  </tbody>
					  </c:forEach>
				  </c:if>
				</table>
				<!-- 페이징 처리 -->
	<div class="page">
		<nav class="paging">
            <ul class="pagination">
               <li class="page-item"><a class="page-link paging_btn"
                  href="admin_memeber.doo?page=1">First</a></li> 
               <c:if test="${paging.getPage() == 1 }">
                <li>
                 <a class="page-link paging_btn" 
                        href="admin_memeber.do?page=1">Previous</a> 
                </li>
                </c:if>
                <c:if test="${paging.getPage() != 1 }">
                <li>
                  <a class="page-link paging_btn" 
                        href="admin_memeber.do?">Previous</a>
                </li>
                </c:if>
               <c:forEach begin="${paging.getStartBlock() }" end="${paging.getEndBlock() }" var="i">
      
                  <c:if test="${i == paging.getPage() }">
                     <li class="page-item active" aria-current="page"><a
                        class="page-link paging_btn"   href="admin_memeber.do">${i }</a></li>
                  </c:if>
      
                  <c:if test="${i != paging.getPage() }">
                     <li class="page-item"><a class="page-link paging_btn" 
                        href="admin_memeber.do?page=${i }">${i }</a></li>
                  </c:if>
               </c:forEach>
      
               <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
                  <li class="page-item"><a class="page-link paging_btn"
                     href="admin_memeber.do?page=${paging.getEndBlock() + 1 }">Next</a></li>
                  <li class="page-item"><a class="page-link paging_btn"
                     href="admin_memeber.do?page=${paging.getAllPage() }">End</a></li>
               </c:if>
            </ul>
         </nav>			
		<%-- <c:if test="${paging.getPage()>paging.getBlock()}">
	 		<a href="admin_memeber.do?page=1">[처음으로]</a>
	 		<a href="admin_memeber.do?page=${paging.getStartBlock()-1 }">◀</a>
	 	</c:if>
	 	<c:forEach begin="${paging.getStartBlock() }" end="${paging.getEndBlock() }" var="i">
	 		<c:if test="${i == paging.getPage() }">
	 			<b><a href="admin_memeber.do?page=${i }">[${i }]</a></b>
	 		</c:if>
	 		
	 		<c:if test="${i != paging.getPage() }">
	 			<a  href="admin_memeber.do?page=${i }">[${i }]</a>
	 		</c:if>
	 		
	 	</c:forEach>
	 	<c:if test="${paging.getEndBlock()<paging.getAllPage() }">
	 		<a href="admin_memeber.do?page=${paging.getEndBlock()+1 }">▶</a>
	 		<a href="admin_memeber.do?page=${paging.getAllPage() }">[마지막으로]</a>
	 	</c:if> --%>
				
	<!-- 		<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item"><a class="page-link" href="#">Next</a></li>
			  </ul>
			</nav> -->
					
					
				</div>
			</div>	
		</div>	
</body>
</html>