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
				<p>내가 고른 커피 나를 위해 골랐지</p>
				<p><a href="">나만의 커피</a></p>
			</div>

			<div class="main-visual">
				<div class="video-container">
					<iframe width="560" height="315" src="https://www.youtube.com/embed/HCNL1XinQBA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen autoplay muted></iframe>

				</div>




			</div>
		</div>

	</div>
</div>
<jsp:include page="layout/footer.jsp" />

