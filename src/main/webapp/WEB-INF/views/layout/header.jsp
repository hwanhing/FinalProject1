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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css">
<script src= "<%=request.getContextPath()%>/resources/js/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/layout/header.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet" />


        <header class="header">
            <div class="h-wrap" style="height: 80px">
                <div class="h-logo">
                    <a href=""><img src="<%=request.getContextPath()%>/resources/images/cuppa_logo.png" alt="cupofcoffee"></a>
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
					</div>
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

                                        <form id="log-form" name="log-form" type="post" action="<%=request.getContextPath()%>/member_login_check.do">

                                            <fieldset class="mf-wrap">

                                                <div class="mf-form">
                                                    <p><input type="text" name="member_id" placeholder="아이디를 입력하세용가리가리가리" required autofocus></p>
                                                    <p><input type="password"name="member_pwd" placeholder="비밀번호를 입력하세요" required></p>
                                                <input type="checkbox" class="log-input"><label class="log-check">내 정보 기억</label>
                                                </div>

                                                    <button type="submit" class="mf-btn" id="mf-btn">login</button>

                                                <div class="mf-etc">
                                                    <a class="mf-join"><span class="icon-people"></span>회원가입</a>
                                                    <a class="mf-find"><span class="icon-question"></span>
                                                    아이디/비밀번호 찾기</a>
                                                    
                                                        <!-- <div class="find-modal">

                                                            <div class="find-form">
                                                                <div class="find-title">
                                                                    <img src="<%=request.getContextPath()%>/resources/images/cuppa_logo.png" alt="cupofcoffee">
                                                                        <p>아이디/비밀번호 찾기</p>
                                                                    <span class="icon-close" id="fd-close"></span>
                                                                </div>

                                                                <div class="fd-select">
                                                                    <label><input type="radio" name="mf-mode" value="id" checke="checked">아이디 찾기</label>
                                                                    <label><input type="radio" name="mf-mode" value= "pw">비밀번호 찾기</label>
                                                                </div>


                                                                <form id="fd-form" name="fd-form" type="post" action="<%=request.getContextPath()%>/member_find_check.do">

                                                                    <fieldset class="fd-wrap">
                        
                                                                        <div class="fd-form">
                                                                            <p><input type="email" name="fd-email" placeholder="가입한 이메일을 입력하세요" required autofocus></p>

                                                                            <p id="fid"><input type="text" name="fd-id" placeholder="가입한 아이디를 입력하세요" required></p>

                                                                            <p id="fname"><input type="text" name="fd-name
                                                                                " placeholder="가입자 이름을 입력하세요" required></p>

                                                                                <button type="submit" class="fd-btn" id="fd-btn">계정찾기
                                                                            </button>
                                                                        </div>
                                                                    </fieldset>
                                                                </form>
                                                            </div>
                                                        </div> -->
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            <!--------------로그인 모달 창 END ---------------->



                            <!------------회원가입 모달 창 START ---------------->
                            <a href="#" class="join-pop" >Join</a>
                            <div class="join-modal join-bg" id="join-modal">

                                <div class="join-form">

                                    <div class="join-title">
                                        <img src="<%=request.getContextPath()%>/resources/images/cuppa_logo.png" alt="cupofcoffee">
                                        <span class="icon-close"></span>
                                    </div>

                                    <form id="j-form" name="j-form" type="post" action="<%=request.getContextPath()%>/member_join_check.do">

                                        <fieldset class="join-wrap">

                                            <div class="jf-form">
                                            
                                                <label class="label-id" for="member_id">아이디</label>
                                                    <p><input type="text" id="join-id" placeholder="영문,숫자 조합 최소 5자 이상" autofocus></p>
                                                    <p class="id-error error"></p>

                                                <label class="label-pw" for="member_pw">비밀번호</label>
                                                    <p><input type="text" id="join-pw" placeholder="숫자, 영문,특수조합 최소 8자 이상"></p>
                                                    <p class="pw-error error"></p>

                                                    <p><input type="text" placeholder="비밀번호 재입력"></p>

                                                <label class="label-email" for="member_email">이메일</label>
                                                    <p><input type="text" id="join-email" placeholder="사용 가능한 이메일을 입력하세요"></p>
                                                    <p class="email-error error"></p>
                                            </div>


                                            <div class="join-agr">

                                                <div class="join-agr-all">
                                                    <input type="checkbox" class="checkbox-group" id="check-all">
                                                    <label for="agr-all">약관 전체 동의</label>
                                                </div>

                                                <div class="join-agr-per">
                                                    <input type="checkbox" class="checkbox-group" >
                                                    <label for="agr-per">[필수]개인정보 수집 및 이용 동의</label>
                                                </div>

                                                <div class="join-agr-shop">
                                                    <input type="checkbox" class="checkbox-group" >
                                                    <label for="agr-shop">[필수]커퍼커피 스토어 이용 동의</label>
                                                </div>


                                                <div class="join-agr-age">
                                                    <input type="checkbox" class="checkbox-group" >
                                                    <label for="agr-age">[필수]만 14세 미만 가입 제한</label>
                                                </div>


                                                <div class="join-agr-mak">
                                                    <input type="checkbox" class="checkbox-group" >
                                                    <label for="agr-mak">[선택]마케팅 및 광고성 정보 수신 동의</label>
                                                </div>

                                            </div>
                                            
                                            <button type="submit" class="jf-btn" id="jf-btn">가입하기</button>
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
	          			<button>테스트하기</button>
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


    <script language="javascript" src="<%=request.getContextPath()%>/resources/js/member.js?<%=time%>"></script>
   
