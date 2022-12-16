<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% long time = System.currentTimeMillis(); %>

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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css">
	<script src= "<%=request.getContextPath()%>/resources/js/jquery-3.5.1.min.js"></script>
	<script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet" />


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
						<button type="button" onclick="location.href='member_logout.do'">로그아웃</button>
						  <button id="btnnav" class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
					     <span class="navbar-toggler-icon"><i class="fa-solid fa-bars"></i></span>
					   </button>
					</div>
				</c:if>
				<c:if test="${member_name eq null }">	
                  <!--   <div class="menu-etc">
                        <button id="btnnav" class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
					     <span class="navbar-toggler-icon"><i class="fa-solid fa-bars"></i></span>
					   </button>
                    </div> -->
                </c:if>    				

            <!--------------비회원 c:if 문 START------------->
                    <c:if test="${member_name eq null }">	
                <!-----------menu-etc START--------------------->
                        <div class="menu-etc">
                     <!------------로그인 모달 창 START ---------------->

                            <a href="#" class="login-pop">Log-in</a>
                                <div class="log-modal login-bg" id="log-modal">

                                    <div class="login-form">
                                        <div class="login-title">
                                            <img src="<%=request.getContextPath()%>/resources/images/cuppa_logo.png" alt="cupofcoffee">
                                                <p>회원 로그인</p>
                                            <span class="icon-close"></span>
                                        </div>

                                        <form id="log-form" name="log-form" method="post" action="<%=request.getContextPath()%>/member_login_check.do">
                                            <fieldset class="mf-wrap">

                                                <div class="mf-form">
                                                    <p><input type="text" name="member_id" placeholder="아이디를 입력하세용가리가리가리" required autofocus></p>
                                                    <p><input type="text" name="member_pwd" placeholder="비밀번호를 입력하세요" required></p>
                                                <input type="checkbox" class="log-input"><label class="log-check">내 정보 기억</label>
                                                </div>

                                                    <button type="submit" class="mf-btn" id="mf-btn">login</button>

                                                <div class="mf-etc">
                                                    <a href="<%=request.getContextPath()%>/member_join.do"><span class="icon-people"></span>회원가입</a>
                                                    <a href="<%=request.getContextPath()%>/member_find.do"><span class="icon-question"></span>
                                                    아이디/비밀번호 찾기</a>
                                                </div>

                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            <!------------로그인 모달 창 END ---------------->

                            <!------------회원가입 모달 창 START ---------------->
                            <a href="<%=request.getContextPath() %>/adminlogin.do" class="join-pop">Join</a>
                            <div class="join-modal join-bg" id="join-modal">

                                <div class="join-form">
                                    <div class="join-title">
                                        <img src="<%=request.getContextPath()%>/resources/images/cuppa_logo.png" alt="cupofcoffee">
                                            <p>회원가입</p>
                                        <span class="icon-close"></span>
                                    </div>

                                    <form id="join-form" name="join-form" type="post" action="<%=request.getContextPath()%>/member_join_check.do">
                                        <fieldset class="join-wrap">

                                            <div class="join-form">

                                                <label for="">아이디</label>
                                                <p><input type="text" placeholder="숫자, 영문,특수조합 최소 8자" required autofocus></p>

                                                <button type="input" class="e-check">중복확인</button>


                                                <p><input type="text" placeholder="비밀번호 재입력" required></p>

                                                <p><input type="text" placeholder="비밀번호를 다시 한 번 입력하세요" required></p>





                                                <button type="submit" class="mf-btn" id="mf-btn">login</button>

                                            <div class="mf-etc">
                                                <a href="<%=request.getContextPath()%>/member_join.do"><span class="icon-people"></span>회원가입</a>
                                                <a href="<%=request.getContextPath()%>/member_find.do"><span class="icon-question"></span>
                                                아이디/비밀번호 찾기</a>
                                            </div>

                                        </fieldset>
                                    </form>
                                </div>
                            </div>

                            
                        </div>
                        
                    </c:if>    
                    <!--------------비회원 c:if 문 END ------------->
                    <!---------------menu-etc END------------------>
                        
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
		          		<span class="point"> 💰포인트 : <span>${member_point }p</span></span>
		          </div>
		         </li>
		         <li class="nav-item">
		           <a class="nav-link" href="<%=request.getContextPath()%>/member_mypage.do?num=${member_num}"><span class="point">마이페이지</span> </a>
		           <a class="nav-link" href="<%=request.getContextPath()%>/member_heart.do?num=${member_num}"><span class="point">찜리스트</span></a>
	        
		         <li class="nav-item dropdown">
		           <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		         	<span class="point">고객센터</span>
		           </a>
		           <ul class="dropdown-menu">
		             <li><a class="dropdown-item" href="<%=request.getContextPath()%>/board_list.do?num=${member_num}"><span class="point">문의게시판</span></a></li>
		             <li><a class="dropdown-item" href="<%=request.getContextPath()%>/w_write.do?num=${member_num}"><span class="point2">1:1문의하기</span></a></li>
		             <li>
		     
		             </li>
		       			
		           </ul>
		    
		    
		           <a class="nav-link" href="<%=request.getContextPath() %>/member_logout.do"><span class="point">로그아웃</span></a>
		         </li>
		       </ul>
		      
		     </div>
		   </div>
		   </c:if>
		
		<%--   <c:if test="${empty member_id }">
		  	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
		     <div class="offcanvas-header">
		       <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Cuppa Coffee에 오신걸 환영합니다</h5>
		       <button type="button" class="btn-close" data-bs-dismiss="offcanvas"  aria-label="Close"></button>
		     </div>
		     <div class="offcanvas-body">
		       <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
		         <li class="nav-item">
		         <button class="nav-link active login-pop" aria-current="page" id="unlogin" onclick="loaction.href='login.do'">Login
		         
		         
		           <a class="nav-link active" aria-current="page" id="unlogin" href="<%=request.getContextPath()%>/login.do">Login</a>
		       	 </button>	
		       </ul>
		     </div>
		   </div>
		   </c:if> --%>


    </body>

    <script>
        $('.login-pop').click(function(){
            $('.log-modal').fadeIn()
        });

        $('.icon-close').click(function(){
            $('.log-modal').fadeOut()
        });



    </script>
