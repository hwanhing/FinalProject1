<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% long time = System.currentTimeMillis(); %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<link href="<%=request.getContextPath()%>/resources/css/main.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/swiper.min.css">
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/swiper.min.js"></script>




<jsp:include page="layout/header.jsp" />

<!--------------메인 비주얼 ---------------->

<div class="main-contents" id="main-contents">
	<div class="container-wide">
		<div class="main-visual">
			<video muted autoplay loop>
				<source src="<%=request.getContextPath()%>/resources/video/coffee_video.mp4" type="video/mp4">
				<strong>Your browser does not support the video tag.</strong>
				</video>
			<div class="main-title">
				<h2 class="visual-title" >내 입맛에 맞추는<br>나만의 커피</h2>
				<button type="button" class="btn btn-outline-light">추천받기</button>
			</div>
		</div>
	</div>

<!----------원두 추천 ---------------->

	<div class="main-recom swiper-container">
		<div class="recom-title">
			<a href=""></a>
			<h2 class="recom-h2">다양한 취향에 따라<br>내린 한 잔</h2>
			<p class="recom-txt">편하게 즐기는 데일리부터<br>밤을 지켜주는 디카페인까지</p>
		</div>

		<div class="container recom-wrap">
			<ul class="swiper-wrapper">
				<li class="swiper-slide">
					<a href="#">
						<img src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0017/B00000017021201ko.jpg?l=ko">
						<p id="slide-txt">Purple Rain<br>테일러커피</p>
					</a>
				</li>

				<li class="swiper-slide">
					<a href="#">
						<img src="https://cdn.imweb.me/thumbnail/20220120/1135905abc858.png">
						<p id="slide-txt">Icebreaker<br>센터커피</p>
					</a>
				</li>

				<li class="swiper-slide">
					<a href="#">
						<img src="http://hellcafe.co.kr/web/product/big/202101/b831afa5f1e662a6f098ebdb81f3621c.png">
						<p id="slide-txt">HellCafe 강배전<br>헬카페</p>
					</a>
				</li>

				<li class="swiper-slide">
					<a href="#">
						<img src="https://s3.ap-northeast-2.amazonaws.com/meesig/v3/prod/image/item/main/211/46883f617b6d4b8e90ecc45a14fcf4ca20220524203436.">
						<p id="slide-txt">프루티봉봉<br>모모스커피</p>
					</a>
				</li>

			</ul>
		</div>

	</div>

<!----------카페 추천 ---------------->

	<div class="main-shop container">
		<div class="shop-title">
			<h2 class="shop-h2">한번쯤은 마셔보고 싶던 로스터리 카페</h2>
		</div>

		<ul class="shop-wrapper">
			<li class="shop-box"><a href="">
				<img src="https://d227tph7fpseou.cloudfront.net/static/main/roastery/roastery_1.jpg" alt="나무사이로">
			</a>
		</li>

			<li class="shop-box">
				<a href="">
					<img src="https://d227tph7fpseou.cloudfront.net/static/main/roastery/roastery_2.jpg" alt="센터커피"></a>
				</li>

			<li class="shop-box">
				<a href="">
					<img src="https://d227tph7fpseou.cloudfront.net/static/main/roastery/roastery_3.jpg" alt="피어커피">
				</a>
			</li>


			<li class="shop-box">
				<a href="">
					<img src="https://d227tph7fpseou.cloudfront.net/static/main/roastery/roastery_4.jpg" alt="txt커피">
				</a>
			</li>
		</ul>
	</div>

	


</div>
<jsp:include page="layout/footer.jsp" />


<script>

	var recomSwiper = new Swiper(".main-recom .recom-wrap ",{
			effect: "slide",
			slidesPerView: 3,
			spaceBetween: 0,
			speed: 300,
			loop: true,
			touchEnabled: false,
			autoplay: {
				delay: 2000,
			}

		});
	
	
	  </script> 
