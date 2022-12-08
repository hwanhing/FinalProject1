<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% long time = System.currentTimeMillis(); %>

<!DOCTYPE html>
<html> 
<head>
    <meta charset="UTF-8">
    <title>커퍼 커피(Cuppa Coffee)</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Script-Type" content="text/javascript" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


    <meta name="robots" content="noindex">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 	<script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
 	<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet" />
    </head>

    <body>
        <header class="header">
            <div class="h-wrap" style="height: 80px">
                <div class="h-logo">
                    <a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/images/cuppa_logo.png" alt="cupofcoffee"></a>
                </div>
        
                <div class="h-gnb">
                    <nav class="h-nav">
                        <ul class="h-menu">
                            <li><a href="">나만의 커피</a></li>
                            <li><a href="<%=request.getContextPath()%>/bean_list.do">모든 커피</a></li>
                            <li><a href="">추천 커피</a></li>
                            <li><a href="">읽는 커피</a></li>
                        </ul>
                    </nav>

				<c:if test="${member_name ne null }">
					<div>
						<b>${member_name }님</b>
						  <button id="btnnav" class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
					     <span class="navbar-toggler-icon"><i class="fa-solid fa-bars"></i></span>
					   </button>
					</div>
				</c:if>
				<c:if test="${member_name eq null }">	
                    <div class="menu-etc">
                        <a href="<%=request.getContextPath()%>/member_login.do">Log-in</a>
                        <button id="btnnav" class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
					     <span class="navbar-toggler-icon"><i class="fa-solid fa-bars"></i></span>
					   </button>
                    </div>
                </c:if>    
                </div>

            </div>
        </header>
	     <c:if test="${!empty member_id  }">
	     <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
		     <div class="offcanvas-header">
		       <h5 class="offcanvas-title" id="offcanvasNavbarLabel">${member_name} 님 환영합니다.</h5>
		    	<div>
		    	
		    	
		    	</div>
	       <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		     </div>
		     <div class="offcanvas-body">
		       <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
		     
		       
		         <li class="nav-item">
	          	<div>
	          	<div >
	          		<c:if test="${!empty test_img }">
	          			 <img class="result-img" src="${test_img }" width=200>
	          		</c:if>
	          		 <c:if test="${empty test_img }">
	          			<button>테스트하러가기</button>
	          		</c:if>
	          		</div>
	          		
	          	<div>
	          		<span class="result_name">${test_name}</span>
	          	</div>
	          	
	          	</div>
		          <div>
		          		<span> 💰포인트 : ${member_point }p</span>
		          </div>
		         </li>
		         <li class="nav-item">
		           <a class="nav-link" href="<%=request.getContextPath()%>/member_mypage.do?num=${member_num}">마이페이지</a>
		           <a class="nav-link" href="<%=request.getContextPath()%>/member_heart.do?num=${member_num}">찜리스트</a>
	        
		         <li class="nav-item dropdown">
		           <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		         	고객센터
		           </a>
		           <ul class="dropdown-menu">
		             <li><a class="dropdown-item" href="<%=request.getContextPath()%>/board_list.do?num=${dto.getMember_num()}">문의게시판</a></li>
		             <li><a class="dropdown-item" href="<%=request.getContextPath()%>/">1:1문의하기</a></li>
		             <li>
		     
		             </li>
		       
		           </ul>
		    
		    
		           <a class="nav-link" href="<%=request.getContextPath() %>/member_logout.do">로그아웃</a>
		         </li>
		       </ul>
		      
		     </div>
		   </div>
		   </c:if>
		
		  <c:if test="${empty member_id }">
		  	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
		     <div class="offcanvas-header">
		       <h5 class="offcanvas-title" id="offcanvasNavbarLabel">로그인하셈</h5>
		       <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		     </div>
		     <div class="offcanvas-body">
		       <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
		         <li class="nav-item">
		           <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/">Home</a>
		         </li>
		         <li class="nav-item">
		           <a class="nav-link" href="#">Link</a>
		         </li>
		         <li class="nav-item dropdown">
		           <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		           로그인안댐
		           </a>
		           <ul class="dropdown-menu">
		             <li><a class="dropdown-item" href="#">Action</a></li>
		             <li><a class="dropdown-item" href="#">Another action</a></li>
		             <li>
		               <hr class="dropdown-divider">
		             </li>
		             <li><a class="dropdown-item" href="#">Something else here</a></li>
		           </ul>
		         </li>
		       </ul>
		       <form class="d-flex mt-3" role="search">
		         <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		         <button class="btn btn-outline-success" type="submit">Search</button>
		       </form>
		     </div>
		   </div>
		   </c:if>

    </body>

