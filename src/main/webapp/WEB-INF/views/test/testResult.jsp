<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.empty{
		background-color: #D9CEC1;
		height: 1500px;
		padding: 150px 0px 0px 23%;
	}
	
	.empty2{
		height: 90%;
		width: 70%;
		background-color: #fff;
		border-radius: 25px;
		box-shadow: #A69B8D 0px 3px 5px;
		padding-top: 5%;
	}

	.title_box{
	}
	
	.img_box{
		margin-top: 3%;
	}
	
	.cont_box{
		margin-top: 3%;
	}
	.big_text{
		font-size: 30px;
		font-weight: bold;
	}
	
	.mid_text{
		font-size: 17px;
		font-weight: bold;
	}
	
	.sm_text{
		font-size: 16px;
	}

	.ti_text{
		font-size: 20px;
	}
	
	.box2{
		margin-top: 2%;
	}
	
	.text1{
		font-size: 18px;
	}
	
	.text2{
		font-size: 20px;
	}
	
	.btn_box{
		margin-top: 2%;
		margin-left: 30%;
	}
	
	.rly_btn{
		border: 1px solid gray;
		border-radius: 7px;
		padding: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
		
		<div class="empty">
			
			<div class="empty2">
				
				<div class="title_box" align="center">
					<b class="sm_text">내 커피 타이틀</b><br>
					<span class="big_text">부드러운 라떼 한 잔, 낭만파</span>
				</div>
				
				<div class="img_box" align="center">
					<img alt="" src="https://d227tph7fpseou.cloudfront.net/static/quizzes/result/Romantic.png" width="300px">
				</div>
				
				<div class="cont_box" align="center">
					<span class="mid_text">고소하고 부드러운 우유를 곁들여 마시는 낭만파!<br>
					라떼를 좋아하는 사람은 주변 사람들을 편하고 즐겁게 해요.</span>
				</div>
				<br>
				<hr width="60%" style="margin-left: 20%;">
				<br>
				
				<div>
					<div align="center">
						<span class="ti_text"><b>이런 커피가 잘맞아요!</b></span>
					</div>
					<div align="center" class="box2">
						<span class="text1">우유와 함께 할 때는 <span><b>고소하고 쌉싸름한 커피</b></span></span>
					</div>
				</div>
			
				<br>
				<hr width="60%" style="margin-left: 20%;">
				<br>
				
				<div align="center">
					<span class="ti_text"><b>내 커피 메이트</b></span>
				</div>					

				<div class="img_box" align="center">
					<img alt="" src="https://d227tph7fpseou.cloudfront.net/static/quizzes/result/Familiarity.png" width="200px">
				</div>
				
				<div class="cont_box" align="center">
					<span class="mid_text">고소하고 맛있는 커피 다운 커피</span>
				</div>				
				
				<div align="center">
					<span class="text2"><b>정통파</b></span>
				</div>
				
			</div>
		
			<div class="btn_box">
				<button class="rly_btn"><b>다시 테스트하기</b></button>	
			</div>
		
		</div> <%-- empty 끝 --%>
		
	<jsp:include page="../layout/footer.jsp" />	
</body>
</html>