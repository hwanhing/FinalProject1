<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% long time = System.currentTimeMillis(); %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/main.css" rel="stylesheet" />

<jsp:include page="layout/header.jsp" />

<div class="main-contents" id="main-contents">
	<div class="container-wide">
		<div class="main-visual">
			<h2 class="visual-title">내 입맛에 맞추는<br>나만의 커피</h2>
			<button type="button" class="btn btn-outline-light">추천받기</button>

			<div class="video-container">
				<video src="<%=request.getContextPath()%>/resources/video/coffee_video.mp4" alt="커피 동영상" muted autoplay loop>
				</video>
			</div>
			
		</div>
	</div>


	<div class="container main-recom">
		<h2 class="recom-title">다양한 취향에 따라 내린 한 잔</h2>
		<p class="recom-txt">편하게 즐기는 데일리<br>밤을 지켜주는 디카페인</p>
		<ul class="recom-wrapper">
			<li class="recom-box"><img src></li>
			<li class="recom-box"><img src></li>
			<li class="recom-box"><img src></li>
			<li class="recom-box"><img src></li>
		</ul>

	</div>




</div>
<jsp:include page="layout/footer.jsp" />

