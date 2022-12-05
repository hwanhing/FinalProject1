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
						<button type="button" onclick="location.href='member_logout.do'">로그아웃</button>
					</div>
				</c:if>
				<c:if test="${member_name eq null }">	
                    <div class="menu-etc">
                        <a href="<%=request.getContextPath()%>/member_login.do">Log-in</a>
                        <a href="">Join</a>
                    </div>
                </c:if>    
                </div>

            </div>
        </header>


    </body>

