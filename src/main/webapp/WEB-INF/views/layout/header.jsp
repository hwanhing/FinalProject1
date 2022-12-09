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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css">
<script src= "<%=request.getContextPath()%>/resources/js/jquery-3.5.1.min.js"></script>
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
                                                    <p><input type="text" placeholder="아이디를 입력하세용가리가리가리" required autofocus></p>
                                                    <p><input type="text" placeholder="비밀번호를 입력하세요" required></p>
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
                            <a href="#" class="join-pop">Join</a>
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
    </body>

    <script>
        $('.login-pop').click(function(){
            $('.log-modal').fadeIn()
        });

        $('.icon-close').click(function(){
            $('.log-modal').fadeOut()
        });



    </script>
