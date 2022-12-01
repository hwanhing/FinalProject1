<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% long time = System.currentTimeMillis(); %>
<link href="<%=request.getContextPath()%>/resources/css/main.css" rel="stylesheet" />

<jsp:include page="layout/header.jsp" />

<div class="main-contents" id="main-contents">
	<div class="container-wide">
		
		<div class="main-container">
			<div class="main-banner">
				<p>내가 내린 커피 나를 위해 골랐지</p>
				<p><a href="">나만의 커피</a></p>
			</div>

			<div class="main-visual">
				<div class="video-container">
					<video src="<%=request.getContextPath()%>/resources/video/coffee_video.mp4" alt="커피 동영상" muted autoplay loop>
					</video>
					<div class="visual-title">
						<h2>내 입맛에 딱 맞춰서</h2>
					</div>
				</div>






			</div>
		</div>

	</div>
</div>
<jsp:include page="layout/footer.jsp" />

