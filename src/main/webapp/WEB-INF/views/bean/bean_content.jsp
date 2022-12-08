	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	    
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>커피 상세내역</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	
	<style type="text/css">
	
	    .empty{
	        display: flex;
	        width: 70%;
	        margin-left: 23%;
	        margin-right: 17%;
	     
	    }
	
		.img_box1{
			background-color: lightgray;
	
		}
		
		.left_box1{
			width: 40%;
			height: 50%;
		}
		
		.bean_info{ 
			height: 1000px;
			margin-left: 10%;
			width: 50%;
		}
		.bean_taste{
			font-size: 30px;
			margin-bottom: 3%;
		}
		.bean_title{
			font-size: 25px;
			margin-bottom: 1%;
		}
		.bean_price{
			font-size: 20px;
			margin-bottom: 5%;
		}
	
		.cart_btn1{
			width: 45%;
			height: 3em;	
			border: 1px solid #000;
			border-radius: 15px;
			text-align: center;		 
			background-color: #fff;
			color: #000;
			font-size: 15px;
			font-weight: bold;		
		}
	
		.cart_btn1:hover{
			border: 2px solid red;
		}
	
		.cart_btn2{
			width: 45%;
			height: 3em;
			background-color: brown;
			border-radius: 15px;
			text-align: center;
			color: #fff;
			font-size: 15px;
			font-weight: bold;
			margin-top: 1%;
		}
		
		.cart_btn2:hover{
			background-color: #F86D00;
		}
		
		.bean_star{
			margin-bottom: 5%;
		}
		
		.grind_q{
			margin-bottom: 3%;
		}
		
		.grind_0,
		.grind_1{
			border: 1px solid #000;
			border-radius: 5px;
			width: 21%;
			height: 6em;
			font-weight: bold;
			font-size: 15px;
			margin-bottom: 5%;
		}
		
		.grind_1{
			margin-left: 2%;
		}
		
		.gram_1,
		.gram_2,
		.gram_3,
		.gram_4{
			border: 1px solid #000;
			border-radius: 5px;
			width: 10%;
			height: 8em;
			margin-bottom: 5%;
		}
		
		.gram_2,
		.gram_3,
		.gram_4{
			margin-left: 1%;
		}	
		
		.count_box{
			display: flex;
			border: 1px solid gray;
			width: 15%;
			height: 43px;
		}
		
		#result{
			width: 130%;
			margin-top: 6%;
			margin-bottom: 8%;
		}
		
		#p_m_box{
			display: block;
		}
	
		#plus_box,
		#mi_box{
			display: block;
			width: 22px;
			height: 21px;
			border: 1px solid lightgray;
			padding: 0;
			margin: 0;
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		.bean_intro{
			font-size: 25px;
			margin-top: 30px;
		}
		
		#accordionFlushExample{
			margin-top: 50px;
		}
		
		#acd_1,
		#acd_2{
			 outline: none !important;
	 		 box-shadow: none !important;
	 		 background-color: #fff;
	 		 color: #000;
		}
		
		
	/* 이런 원두는 어때요? 추천 박스 부분 ----------------*/	
	
	    .empty2{
	        width: 80%;
	        margin-left: 10%;
	        margin-right: 17%;
	    }		
	    
		.list_box{
	
	      	width: 70%;
	      	display: grid;
	      grid-template-columns: repeat(8, 1fr);
	      gap: 30px;
	      	
		}    
	    
		.con1{
	
	      width: 100%;
	      position: relative;
	      background-color: #E3DCCC;
	      height: 450px;		
		}
		
	
		
	/* 	.con1:after{
	      display: block;
	      content: "";
	      padding-bottom: 100%;			
		}     */
		
	/* ------------------------------------------- */		
	
			.con_info{
				margin-top: 10%;
				margin-bottom: 10%;
				padding-top: 5%;
				text-align: left;
				margin-left: 15%;
			}
			
			.info_out{
				background-color: #D6CCB7;
				height: 145px;
			}		
			
			.con_new{
				color: #A66B56;
				font-weight: bold;
				margin-bottom: 5px;
				text-shadow: 1px 1px 2px black;
			}
			
			.con_name{
				font-weight: bold;
				font-size: 1.2em;
			}
			
			.con_taste{
				margin-bottom: 10px;
			}
			
			.con_price{
				font-size: 20px;
			}
			
			.aa-prev{
				width: 10%;
				
			}
			
			.aa-next{
				width: 5%;
			}
			
			.carousel-control-prev-icon,
			.carousel-control-next-icon{
				background-color: #000;
			}
	
			.que{
				margin-left: 10%;
			}
			.que1{
				margin-left: 3%;
			}
			
			
	/* empty3 부분 ------------------------------------*/
	
	    .empty3{
	        width: 70%;
	        margin-left: 17%;
	        margin-right: 17%;
	    }		
	    
		.write_box1{
			margin-left: 3%;	
			border: 2px solid #c6c6c6;
			padding: 16px;
			border-radius: 5px; 
			width:90%; 
			background-color: #fff;				
		}
		    
	    .write_box2{
	    	width: 100%;
	    	height: 500px;
	    	background-color: green;
	    }
	    
		#re_writer{
			border: none;
			pointer-events: none;
			font-size: 18px;
			font-weight: bold;
			width: 500px;
		}	
		
		#re_content{    
			width: 98%;
		    border: none;
		    resize: none;
		    outline: none;
			overflow: hidden;	
			margin-left: 1%;
			margin-top: 1%;
			font-size: 17px;  
			min-height: 100px;
		}
		
		#replyBtn{
			border: none;
		    font-size: 15px;
		    border-radius: 6px;
		    text-align: center;
		    background-color: white;
		    float: right;
		    margin-top: 1%;
		}
		
		.writer_img{
			margin-left: 1%;
			width: 30px;
			height:30px; 
		}
		
		.writer_td_box{
		 	height: 50px;
		}
		    
		 
	.upload-name {
	    display: inline-block;
	    height: 40px;
	    padding: 0 10px;
	    vertical-align: middle;
	    border: 1px solid #dddddd;
	    width: 90%;
	    color: #999999;
	}
	
	.file_label {
	    display: inline-block;
	    padding: 10px 20px;
	    color: #fff;
	    vertical-align: middle;
	    background-color: #000;
	    cursor: pointer;
	    height: 40px;
	    margin-left: 10px;
	}
	
	#file {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}
	/* -----------------------------------------------*/    
	</style>
	
	
	</head>
	<body>
	
		<jsp:include page="../layout/header.jsp" />
	
	    <div style="height: 10em;">
	
	    </div>
	    
	    <c:set var="i" value="${Cont }" />
	    <c:set var="list" value="${List }" />
	    <div class="empty">
	    
		    <div class="left_box1">
		    	<div class="img_box1" align="center">
		    		<img alt="커피원두1" width="500px" height="500px" src="${i.getBeans_img() }">
		    	</div>    	
		    	
		   		<div class="bean_intro" align="center">
		   			◾ ${i.getBeans_intro() } ◾ 		
		   		</div>    	
		   		
		   		<div>
					<div class="accordion accordion-flush" id="accordionFlushExample">
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingOne">
					      <button id="acd_1" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
					        상품 필수 표기 정보
					      </button>
					    </h2>
					    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
					      <div class="accordion-body">
					      		- 식품의 유형: 커피<br>
								- 제조원 및 소재지: 오이르 경기도 부천시 양지로92번길9-3, 106호<br>
								- 유통기한: 제조일로부터 1년<br>
								- 제조일자: 주문 확인 후 제조<br>
								- 내용량: 1kg<br>
								- 보관방법: 직사광선을 피하고 온도, 습도가 낮으며 통풍이 잘 되는 곳에 밀폐 보관<br>
								- 원재료 및 함량: 커피원두 100%<br>
								- 제품문의 관련 주소 및 전화번호: 오이르로스터스</div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingTwo">
					      <button id="acd_2" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
					        배송안내
					      </button>
					    </h2>
					    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
					      <div class="accordion-body">
					      	배송 기간은 결제일로부터 1일 ~ 5일 정도 소요될 수 있습니다.<br>
							제주도를 포함한 도서산간 지역은 추가 배송일과 추가 배송비 입금 요청이 있을 수 있습니다.<br><br>
							<b>교환/반품/환불</b><br>
							교환 및 반품은 상품 수령일로부터 7일 이내에 코케 고객센터로 접수해 주세요.<br>
							원두(드립백 포함)는 신선 제품입니다. 고객의 변심에 의한 교환 및 반품은 불가합니다.<br>
							분쇄 옵션 선택 실수로 인한 교환 및 반품은 불가합니다.<br>
							제품 하자가 있는 경우 전액이 환불됩니다 (반품 배송비 포함)
					      </div>
					    </div>
					  </div>
					</div>
		   		</div>	<%-- 부트스트랩 아코디언 끝 --%>
	
		    </div>	<%--left_box1 끝 --%>
	    	
	    	<div class="bean_info">
	<%-- 	    <div class="bean_taste">
		    		<span><b>${i.getBeans_taste() }</b></span>
		    	</div>	 --%>
		    	<input type="hidden" id="hidden_beans_num" value="${i.getBeans_num() }">
		    	<div class="bean_title">
		    		<span>${i.getBeans_name() }</span>
		    	</div>
		    	<div class="bean_star">
		    		⭐⭐⭐⭐⭐ <%--여기 --%><span>1,000개 상품평</span>
		    	</div>  	
		    	
		    	<div class="bean_price">
		    		<input type="hidden" id="hidden_total" value="${i.getBeans_price() }">
		    		<span><b>￦ <span id="b_price"><fmt:formatNumber value="${i.getBeans_price()}" /></span></b></span>
		    		▪ <span><span id="b_weight"> ${i.getBeans_weight()}</span>g</span>
		    		<br><br>
				<div class="count_box">
					<div id="result" align="center">1</div>
					<div id="p_m_box">
						<button id="plus_box" onclick='count("plus")'><span id="tagg">∧</span></button>
						<button id="mi_box" onclick='count("mi")'>∨</button>
					</div>  
		    	</div>
		    </div>
		    	   	
		    	<hr width="48%" align="left" color="lightgray"><br>
		    	
		    	<div class="bean_gram">
		    		<div class="grind_q"><span><b>원두 용량</b><br>
						로스터리마다 용량이 조금씩 다를 수 있습니다.</span></div>
		    		<button class="gram_1" id="gram1" value="100">100g</button>
		    		<button class="gram_2" id="gram2" value="200">200g</button>					
		    		<button class="gram_3" id="gram3" value="300">300g</button>
		    		<button class="gram_4" id="gram4" value="400">400g</button>					
					
		    	</div>    
		    	
		    	<div class="bean_grind">
		    		<div class="grind_q"><span>원두 갈아드릴까요?</span></div>
		    		<button class="grind_0" id="grind0" value="0">그대로 주세요</button>
		    		<button class="grind_1" id="grind1" value="1">갈아주세요</button>
		    	</div>
			
				<div class="cart_btn">
					<button class="cart_btn1">장바구니담기</button><br>	<%-- onclick태그안에 넣는법... --%>
					<button class="cart_btn2">구매하기</button>
				</div>
			
			</div>
			
	
			
	    </div> <%-- empty 끝 --%>
	<div align="center">
		<hr width=70%;>
	</div>
	<br>
		<div class="empty3">
		
			<h3 class="que1">후기글</h3>
			<br>
			
	
				<div class="write_box1">
					<table>
						<tr>
							<td class="writer_td_box">
								<img class="writer_img" src="https://cdn-icons-png.flaticon.com/128/5079/5079583.png">	
								<input name="re_id" id="re_writer" value="${member_name }">
							</td>
						</tr>	
						<tr>
							<td>
							<br>
								<input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly="readonly">
	    						<label for="file" class="file_label">사진추가</label> 
						  		<input type="file" id="file" accept="image/*" onchange="readURL1(this)" width="280" name="movie_dpic">
						  		<img id="img-preview1" class="img_no" src="" width="100px">
						  		<br><br>
							</td>
						</tr>
						<tr style="border-radius: 6px; border-style: hidden; box-shadow: 0 0 0 1px #c6c6c6;">
							<td>
								<textarea class="autosize" name="re_content" id="re_content" cols="500" placeholder="후기글을 작성해주세요."></textarea>
							</td>
						</tr>
	<!--					<tr>
							<td>
								<input style="width: 100%; border-color:#c6c6c6; box-shadow-color:#000; box-shadow:none !important;" type="file" name="free_file">
							</td>
						</tr> --> 
						
						<tr>
							<td>
							<input type="button" id="replyBtn" value="등록">
							</td>
						</tr>		
		
					</table>
				</div>		
			<br>
			<div class="write_box2">		
			</div>
		
		</div>	<%-- empty3 끝 --%>
	
		<br>
		<br>
		
		<div class="empty2">
			<h3 class="que">이런 원두는 어때요???</h3>
			<br>
			<br>
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">		
	 <div class="carousel-inner">
	 	<div class="carousel-item active" align="center">
			<div class="list_box">
	
			<c:forEach items="${list }" var="i" begin="0" end="3" varStatus="status">
	
	        	<div class="con1">
	        	
	        		<div class="con_box" align="center" >
	        			<img alt="커피원두1" width="250px" height="280px" <%--여기--%> src="${i.getBeans_img() }" onclick="location.href='bean_content.do?num=${i.getBeans_num()}'"> 
	        		</div>
	        		<div class="info_out">
	        		
		        		<div class="con_info">
		        			<div class="con_new">
		        				<span>New</span>
		        			</div>
		        			<div class="con_name">
		        				<span><%--여기--%>${i.getBeans_name() }</span>
		        			</div>
		        			<div class="con_taste">
		        				<span><%--여기--%>${i.getBeans_taste() }</span>
		        			</div>
		        			<div class="con_price">
		        				<span><b>￦ <fmt:formatNumber value="${i.getBeans_price() }" /></b></span>
		        			</div>        			
		        		</div>
	        		</div>
	        	</div>
			</c:forEach>
			</div>
			</div>
	 	<div class="carousel-item" align="center">
			<div class="list_box" >
	
			<c:forEach items="${list }" var="i" begin="4" end="7" varStatus="status">
	
	        	<div class="con1">
	        	
	        		<div class="con_box" align="center" >
	        			<img alt="커피원두1" width="250px" height="280px" <%--여기--%> src="${i.getBeans_img() }" onclick="location.href='bean_content.do?num=${i.getBeans_num()}'"> 
	        		</div>
	        		<div class="info_out">
	        		
		        		<div class="con_info">
		        			<div class="con_new">
		        				<span>New</span>
		        			</div>
		        			<div class="con_name">
		        				<span><%--여기--%>${i.getBeans_name() }</span>
		        			</div>
		        			<div class="con_taste">
		        				<span><%--여기--%>${i.getBeans_taste() }</span>
		        			</div>
		        			<div class="con_price">
		        				<span><b>￦ <fmt:formatNumber value="${i.getBeans_price() }" /></b></span>
		        			</div>        			
		        		</div>
	        		</div>
	        	</div>
			</c:forEach>
			</div>
			</div>
			</div>
				<button class="aa-prev carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="aa-next carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</div>
	
	
		<jsp:include page="../layout/footer.jsp" />
	
	<script type="text/javascript">
	let resultElement = document.getElementById("result");
	let number = resultElement.innerText;
	sumTotal(number);
	let beans_num = document.getElementById("hidden_beans_num").value;
	
	function count(type){
		
		let resultElement = document.getElementById("result");
	
		let number = resultElement.innerText;
	
		
		if(type == "plus"){
			number = parseInt(number) + 1;
			sumTotal(number);
			
		}else if(type == "mi" && number > 1){
			number = parseInt(number) - 1;
			sumTotal(number);
			
		}
	
		resultElement.innerText = number;
	
		
	}
	
	
	
	function sumTotal(number){
		let beans_num = document.getElementById("hidden_beans_num").value;
		let hidden_total = parseInt(document.getElementById("hidden_total").value);
		let number_1 = parseInt(document.getElementById("result").textContent);
		let b_weight = parseInt(document.getElementById("b_weight").textContent);
		b_weight = b_weight/100;
		b_price_total = hidden_total * number * b_weight;
		
		console.log("총 >>> "+b_price_total)
		console.log("가격 >>> "+hidden_total)
		console.log("수량 >>> "+number)
		console.log("그램 >>> "+b_weight)
		console.log("원두번호 >>> "+beans_num)
		
		b_price.textContent = b_price_total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); 
	 	
	}
	
	
	$(".gram_1").on("click",function(){
		let b_weight = document.getElementById("b_weight");
		let gram1 = document.getElementById("gram1").value;
		
		let number = parseInt(document.getElementById("result").textContent);
		
		b_weight.textContent = gram1; 
	
		
		$("#gram1").css({
			"border" : "2px solid red"
		});
		
		$("#gram2").css({
			"border" : "1px solid"
		});
		$("#gram3").css({
			"border" : "1px solid"
		});
		$("#gram4").css({
			"border" : "1px solid"
		});
		
		sumTotal(number);
		
	});
	
	$(".gram_2").on("click",function(){
		let b_weight = document.getElementById("b_weight");
		let gram2 = document.getElementById("gram2").value;
		
		let number = parseInt(document.getElementById("result").textContent);
		
		b_weight.textContent = gram2; 
	
		
		$("#gram2").css({
			"border" : "2px solid red"
		});
		
		$("#gram1").css({
			"border" : "1px solid"
		});
		$("#gram3").css({
			"border" : "1px solid"
		});
		$("#gram4").css({
			"border" : "1px solid"
		});
	
		sumTotal(number);
		
	});
	
	$(".gram_3").on("click",function(){
		let b_weight = document.getElementById("b_weight");
		let gram3 = document.getElementById("gram3").value;
		
		let number = parseInt(document.getElementById("result").textContent);
		let b_price = document.getElementById("b_price");
		
		b_weight.textContent = gram3; 
		
		$("#gram3").css({
			"border" : "2px solid red"
		});
		
		$("#gram1").css({
			"border" : "1px solid"
		});
		$("#gram2").css({
			"border" : "1px solid"
		});
		$("#gram4").css({
			"border" : "1px solid"
		});	
	
		sumTotal(number);
		
	});
	
	$(".gram_4").on("click",function(){
		let b_weight = document.getElementById("b_weight");
		let gram4 = document.getElementById("gram4").value;
		
		let number = parseInt(document.getElementById("result").textContent);
		let b_price = document.getElementById("b_price");
		
		b_weight.textContent = gram4; 
	
		$("#gram4").css({
			"border" : "2px solid red"
		});
		
		$("#gram1").css({
			"border" : "1px solid"
		});
		$("#gram2").css({
			"border" : "1px solid"
		});
		$("#gram3").css({
			"border" : "1px solid"
		});
		
		sumTotal(number);
		
	});
		
		let grind_total;
	
		let grind0 = parseInt(document.getElementById("grind0").value);
		let grind1 = parseInt(document.getElementById("grind1").value);
		
	$(".grind_0").on("click",function(){
		
		grind_total = grind0;
	
		$(".grind_0").css({
			"border" : "2px solid red"
		});
		
		$(".grind_1").css({
			"border" : "1px solid"
		});	
		
		console.log("갈기여부 >>> " + grind_total);
	});
	
	$(".grind_1").on("click",function(){
		
		grind_total = grind1;
		
		$(".grind_1").css({
			"border" : "2px solid red"
		});
		
		$(".grind_0").css({
			"border" : "1px solid"
		});		
		
		console.log("갈기여부 >>> " + grind_total);
	});
	
	$(".cart_btn1").on("click",function(){
		
		let beans_num = document.getElementById("hidden_beans_num").value;
		let number = parseInt(document.getElementById("result").textContent);
		let b_weight = parseInt(document.getElementById("b_weight").textContent);
		parseInt(grind_total);
		
		location.href="cart_insert.do?bean_num="+beans_num+"&count="+number+"&weight="+b_weight+"&grind="+grind_total+""
		
	});	
	
	$("textarea.autosize").on('keydown keyup', function () {
		  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
		});	
		
		
	
	function readURL1(input) {
	  console.log(input.files);
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	      $("#img-preview1").attr("src", e.target.result);
	    };
	
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    $("#img-preview1").attr("src", noimage);
	  }
	}	
	
	$("#file").on('change',function(){
		  var fileName = $("#file").val();
		  $(".upload-name").val(fileName);
		});
		
	</script>
	
	
	</body>
	</html>