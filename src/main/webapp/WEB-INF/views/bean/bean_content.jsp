	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	    
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>커피 상세내역</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	
	<style type="text/css">
		
		/* 전체 크기 div 박스 */
	    .empty{
	        display: flex;
	        width: 70%;
	        margin-left: 23%;
	        margin-right: 17%;
	     
	    }
	
		/* 원두 이미지 뒷 배경 색상 */
		.img_box1{
			background-color: lightgray;
	
		}
		
		.left_box1{
			width: 40%;
			height: 50%;
		}
		
		.bean_info{ 
			height: 10%;
			margin-left: 10%;
			width: 50%;
		}
		.bean_taste{
			font-size: 3em;
			margin-bottom: 3%;
		}
		.bean_title{
			font-size: 2.0em;
			margin-bottom: 1%;
		}
		.bean_price{
			font-size: 1.6em;
			margin-bottom: 5%;
		}
		
		/* 장바구니 버튼 */
		.cart_btn1{
			width: 45%;
			height: 3em;	
			border-radius: 5em;
			text-align: center;		 
			background-color: #d9cec1;
			color: #000;
			font-size: 1em;
			font-weight: bold;
			margin-top: 2%		
		}
		
		/* 장바구니 버튼 : hover */
		.cart_btn1:hover{
			background-color: #C4BAAF;
		}
		/*------------------------------*/
		
		/* 구매하기 버튼 */
		.cart_btn2{
			width: 45%;
			height: 3em;
			background-color: #734338;
			border-radius: 5em;
			text-align: center;
			color: #fff;
			font-size: 1em;
			font-weight: bold;
			margin-top: 1%;
		}
		
		/* 구매하기 버튼 : hover */
		.cart_btn2:hover{
			background-color: #54342D;
		}
		
		.bean_star{
			margin-bottom: 5%;
		}
		
		.grind_q{
			margin-bottom: 3%;
		}
		/*------------------------------*/
		
		/* 갈기 여부 버튼 */
		.grind_0,
		.grind_1{
			/* border: 1px solid #000; */
			border-radius: 0.5em;
			width: 21%;
			background-color: #f2f2f2;
			height: 6em;
			font-weight: bold;
			font-size: 1em;
			margin-bottom: 5%;
		}
		
		/* 갈기 여부 버튼 : hover */
		.grind_0:hover{
			background-color: #d9cec1; 
		}
		
		/* 갈기 여부 버튼 : hover */
		.grind_1:hover{
			background-color: #d9cec1; 
		}
		.grind_1{
			margin-left: 2%;
		}
		/*------------------------------*/
		
		/* 그램 수 버튼 ex) 100g, 200g */
		.gram_1,
		.gram_2,
		.gram_3,
		.gram_4{
			/* border: 1px solid #000; */
			border-radius: 0.5em;
			background-color: #f2f2f2;
			width: 10%;
			height: 8em;
			margin-bottom: 5%;
		}

		/* 그램 수 버튼 : hover */
		.gram_1:hover{
			background-color: #d9cec1; 
		}		
		.gram_2:hover{
			background-color: #d9cec1; 
		}		
		.gram_3:hover{
			background-color: #d9cec1; 
		}		
		.gram_4:hover{
			background-color: #d9cec1; 
		}
		.gram_2,
		.gram_3,
		.gram_4{
			margin-left: 1%;
		}	
		/*-----------------------------*/
		
		.count_box{
			display: flex;
			border: 1px solid gray;
			width: 15%;
			height: 2.1em;
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
			width: 1em;
			height: 1em;
			border: 1px solid lightgray;
			padding: 0;
			margin: 0;
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		.bean_intro{
			font-size: 1em;
			margin-top: 2em;
		}
		
		#accordionFlushExample{
			margin-top: 3em;
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
		  /* border: 1px solid lightgray; */
		  border-radius: 1em;
	      width: 100%;
	      position: relative;
	      height: 32em;		
		}
		
	
		
	/* 	.con1:after{
	      display: block;
	      content: "";
	      padding-bottom: 100%;			
		}     */
		
	/* ------------------------------------------- */		
	
			.con_info{
				margin-top: 5%;
				margin-bottom: 10%;
				text-align: center;
			}
			
			.info_out{
				height: 5em;
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
				margin-bottom: 1em;
			}
			
			.con_price{
				font-size: 1.3em;
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
			padding: 1%;
			border-radius: 5px; 
			width:90%; 
			background-color: #fff;				
		}
		    
	    .write_box2{
	    	width: 100%;
	    }
	    
		#re_writer{
			border: none;
			pointer-events: none;
			font-size: 1.5em;
			font-weight: bold;
			width: 50%;
		}	
		
		#re_content{    
			width: 98%;
		    border: none;
		    resize: none;
		    outline: none;
			overflow: hidden;	
			margin-left: 1%;
			margin-top: 1%;
			font-size: 1em;  
			min-height: 6em;
		}
		
		#replyBtn{
			border: none;
		    font-size: 1.5em;
		    font-weight: bold;
		    border-radius: 1em;
		    text-align: center;
		    background-color: white;
		    float: right;
		    margin-top: 1%;
		    margin-right: 1%;
		}
		
		.writer_img{
			margin-left: 1%;
			width: 2.8em;
			height:2.8em; 
		}
		
		.writer_td_box{
		 	height: 4em;
		}
		    
		 
	.upload-name {
	    display: inline-block;
	    height: 3em;
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
	    height: 3em;
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
	
	.writer2_img{
		width: 2.8em;
		height:2.8em; 	
	}
	
	.writer2_name{
		font-size: 17px;
		font-weight: bold;
	}
	
	.write_img2{
		width: 7em;
		height: 7em;
	}

	.write_img2:hover{
		opacity: 50%;
	}
	
	.text_inbox{
		border-radius: 6px; 
		border-style: hidden; 
		box-shadow: 0 0 0 1px #c6c6c6;	
	}

	.write_list1{
		/*border: 1px solid #000;*/ 
		width: 90%; 
		margin-left: 3%; 
		padding-top: 3%; 
		padding-left: 2%;
	}
	
	.write_starbox{
		margin-left: 0.5%; 
		margin-top: 0.5%; 
		margin-bottom: 0.5%;
	}
	
	.write_contbox{
		margin-left: 0.5%; 
		margin-top: 0.5%; 
		margin-bottom: 0.5%;
		padding-right: 3%;
	}
	
	.write_singobox{
		margin-right: 1%; 
		margin-bottom: 1%; 
		margin-top: 1%;
	}
	/* -----------------------------------------------*/
	
	/* 사진 클릭시 확대 되도록 (모달) ----------------------*/
	.modal11 {
		display: none;
		z-index: 500;
		width: 100%;
		height: 100vh;
		position: fixed;
		top: 0;
		left: 0;
		background-color: rgba(0, 0, 0, 0.3);
	}
	
	.modal_btn{
		position: absolute;
		top: 3rem;
		right: 3rem;
		background: transparent;
		border: 0;
		color: #ffffff;
		font-size: 3rem;
	}
	
	.modalBox {
		position: relative;
		top: 20%;
		left: 50%;
		transform: translate(-50%, -20%);
		width: 30%;
		height: 30%;
		text-align: center;
	}
	
	.modalBox img {
		width: 100%;
	}

	/* -----------------------------------------------*/	
	.heart_count{
		font-size: 1em;
		margin-left: 5%;
	}
	    
	#star_count{
		outline: none;
		border: none;
	}

/* 마우스오버
#starWrap {}
#starWrap ul:after {content:''; display:block; clear:both;}
#starWrap ul li {width:26px; height:15px; float:left; background:url('resources/images/bgStarSolo.png') no-repeat; cursor:pointer;}
#starWrap.star1 .s1 {background-position:0 -15px;}
#starWrap.star2 .s1,#starWrap.star2 .s2 {background-position:0 -15px;}
#starWrap.star3 .s1,#starWrap.star3 .s2,#starWrap.star3 .s3 {background-position:0 -15px;}
#starWrap.star4 .s1,#starWrap.star4 .s2,#starWrap.star4 .s3,#starWrap.star4 .s4 {background-position:0 -15px;}
#starWrap.star5 .s1,#starWrap.star5 .s2,#starWrap.star5 .s3,#starWrap.star5 .s4,#starWrap.star5 .s5 {background-position:0 -15px;}    */  

/* 마우스클릭 */
#starWrapClick ul:after {content:''; display:block; clear:both;}
#starWrapClick ul li {width:20px; height:15px; float:left; background:url('resources/images/bgStarSolo.png') no-repeat; cursor:pointer;}
#starWrapClick.star1 .s1 {background-position:0 -15px;}
#starWrapClick.star2 .s1,#starWrapClick.star2 .s2 {background-position:0 -15px;}
#starWrapClick.star3 .s1,#starWrapClick.star3 .s2,#starWrapClick.star3 .s3 {background-position:0 -15px;}
#starWrapClick.star4 .s1,#starWrapClick.star4 .s2,#starWrapClick.star4 .s3,#starWrapClick.star4 .s4 {background-position:0 -15px;}
#starWrapClick.star5 .s1,#starWrapClick.star5 .s2,#starWrapClick.star5 .s3,#starWrapClick.star5 .s4,#starWrapClick.star5 .s5 {background-position:0 -15px;}	    

#star_ul_fix ul:after {content:''; display:block; clear:both;}
#star_ul_fix ul li {width:20px; height:15px; float:left; background:url('resources/images/bgStarSolo.png') no-repeat; cursor:pointer;}

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
		    		<img alt="커피원두1" width="100%" height="100%" src="${i.getBeans_img() }">
		    		
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
		    	<div>

		    		
		    	</div>
		    	<div class="bean_title">

		    		<span>${i.getBeans_name() } 
		    		</span>
		    	</div>
		    	<div class="bean_star">
		    		<c:if test="${i.getWrite_count() == 0}">
		    			아직 평가가 없습니다.
		    		</c:if>
		    		<c:if test="${i.getWrite_count() != 0 }">
			    		⭐⭐⭐⭐⭐ <%--여기 --%><span>${i.getWrite_count() }개 상품평</span>
		    		</c:if>
		    		 
		    		<span class="heart_count">
		    			<c:if test="${i.getCount_h() != 0 }">
	    				<svg focusable="false" width="20" height="20" viewBox="0 0 24 24" fill="rgb(255, 255, 255)" xmlns="http://www.w3.org/2000/svg" class="pip-svg-icon ">
						 	<path fill-rule="evenodd" style="fill:rgb(0, 0, 0);" clip-rule="evenodd" d="M19.205 5.599c.9541.954 1.4145 2.2788 1.4191 3.6137 0 3.0657-2.2028 5.7259-4.1367 7.5015-1.2156 1.1161-2.5544 2.1393-3.9813 2.9729L12 20.001l-.501-.3088c-.9745-.5626-1.8878-1.2273-2.7655-1.9296-1.1393-.9117-2.4592-2.1279-3.5017-3.5531-1.0375-1.4183-1.8594-3.1249-1.8597-4.9957-.0025-1.2512.3936-2.5894 1.419-3.6149 1.8976-1.8975 4.974-1.8975 6.8716 0l.3347.3347.336-.3347c1.8728-1.8722 4.9989-1.8727 6.8716 0z"></path>
						</svg>			
			    			${i.getCount_h() }								
						</c:if>
					</span>						    		
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
					<button class="cart_btn1">장바구니담기</button><br>
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
				<c:if test="${member_id ne null }">
				<div class="write_box1">
				<form enctype="multipart/form-data" method="post" action="<%=request.getContextPath()%>/write_insert.do">
					<input type="hidden" name="beans_num" value="${i.getBeans_num() }">
					<input type="hidden" name="member_num" value="${member_num }">
					<table>

						<tr>
							<td class="writer_td_box">
								<img class="writer_img" src="https://cdn-icons-png.flaticon.com/128/5079/5079583.png">	
								<input name="member_id" id="re_writer" value="${member_id }">
							</td>
						</tr>	
						<tr>
							<td>
								<br>
<!-- 								<div id="starWrap" style="margin-left: 3%; width: 50%;">
									<ul>
										<li class="s1"></li>
										<li class="s2"></li>
										<li class="s3"></li>
										<li class="s4"></li>
										<li class="s5"></li>
									</ul> 
								</div> -->
								<div id="starWrapClick" style="margin-left: 3%; width: 50%;">
									<ul>
										<li class="s1"></li>
										<li class="s2"></li>
										<li class="s3"></li>
										<li class="s4"></li>
										<li class="s5"></li>
									</ul>
								</div>				
								
												
								<div style="margin-left: 3%; margin-top: 1%; margin-bottom: 1%;">
								<span style="font-size: 2em;"><input id="star_count" name="coffee_star" value="0"></span>
								</div>
							</td>
						</tr>						
						<tr>
							<td>
								<input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly="readonly">
	    						<label for="file" class="file_label">파일추가</label> 
						  		<input type="file" id="file" onchange="readURL1(this)" width="280" name="writeimg">
						  <!--  <img id="img-preview1" class="img_no" src="" width="100px">  파일추가 했을때 바로 눈앞에 보이게 하는것.-->		
						  		<br><br>
							</td>
						</tr>
						<tr class="text_inbox">
							<td>
								<textarea class="autosize" name="write_cont" id="re_content" cols="500" placeholder="후기글을 작성해주세요."></textarea>
							</td>
						</tr>
						<tr>
							<td>
							<input type="submit" id="replyBtn" value="등록">
							</td>
						</tr>
					</table>
				</form>
				</div>	
				</c:if>	
			<br>
			
			<div class="write_box2">	
			<c:set var="w_list" value="${writeList }" />
			<c:forEach items="${w_list }" var="w">
			
				<div class="write_list1">
					
					<img class="writer2_img" alt="" src="https://cdn-icons-png.flaticon.com/128/5079/5079583.png">
					
					<span class="writer2_name">${w.getMember_id() }</span>
					
					<div class="write_starbox">
						<span>${w.getWrite_date().substring(0,10) }</span>
						<br>
						
						<c:if test="${w.getCoffee_star() == 1}">
							<div id="star_ul_fix" style="width: 50%;">
								<ul>
									<li class="c1" style="background-position:0 -15px;"></li>
									<li class="c2"></li>
									<li class="c3"></li>
									<li class="c4"></li>
									<li class="c5"></li>
								</ul>
							</div>							
						</c:if>
						
						<c:if test="${w.getCoffee_star() == 2}">
							<div id="star_ul_fix" style="width: 50%;">
								<ul>
									<li class="c1" style="background-position:0 -15px;"></li>
									<li class="c2" style="background-position:0 -15px;"></li>
									<li class="c3"></li>
									<li class="c4"></li>
									<li class="c5"></li>
								</ul>
							</div>							
						</c:if>
						<c:if test="${w.getCoffee_star() == 3}">
							<div id="star_ul_fix" style="width: 50%;">
								<ul>
									<li class="c1" style="background-position:0 -15px;"></li>
									<li class="c2" style="background-position:0 -15px;"></li>
									<li class="c3" style="background-position:0 -15px;"></li>
									<li class="c4"></li>
									<li class="c5"></li>
								</ul>
							</div>							
						</c:if>
						<c:if test="${w.getCoffee_star() == 4}">
							<div id="star_ul_fix" style="width: 50%;">
								<ul>
									<li class="c1" style="background-position:0 -15px;"></li>
									<li class="c2" style="background-position:0 -15px;"></li>
									<li class="c3" style="background-position:0 -15px;"></li>
									<li class="c4" style="background-position:0 -15px;"></li>
									<li class="c5"></li>
								</ul>
							</div>							
						</c:if>
						<c:if test="${w.getCoffee_star() == 5}">
							<div id="star_ul_fix" style="width: 50%;">
								<ul>
									<li class="c1" style="background-position:0 -15px;"></li>
									<li class="c2" style="background-position:0 -15px;"></li>
									<li class="c3" style="background-position:0 -15px;"></li>
									<li class="c4" style="background-position:0 -15px;"></li>
									<li class="c5" style="background-position:0 -15px;"></li>
								</ul>
							</div>							
						</c:if>
						${w.getCoffee_star() }
					</div>
					
					<div class="write_click_img2">
					${w.getWrite_img() }
						<img class="write_img2" src="<%=request.getContextPath() %>${w.getWrite_img() }">
					</div>
					
					<div class="write_contbox">
						${w.getWrite_cont() }								
					</div>
					
					<c:if test="${member_id eq w.getMember_id() && member_id ne null}">
						<div align="right" class="write_singobox">
							<button onclick="if(confirm('정말 삭제 하시겠습니까?')){location.href='write_delete.do?no=${w.getWrite_num()}&num=${w.getBeans_num() }'}else{return;}"><span style="color: #000;">❌삭제하기</span></button>
						</div>
					</c:if>	
					<c:if test="${member_id ne w.getMember_id() && member_id ne null}">
						<div align="right" class="write_singobox">
							<button onclick="if(confirm('정말 신고 하시겠습니까?')){location.href='ss'}else{return;}"><span style="color: red;">🚨신고하기</span></button>
						</div>
					</c:if>
					<hr>
				</div>
			
			</c:forEach>	
				
				<!-- 팝업 될 곳 -->
				<div class="modal11">
					<button class="modal_btn">&times;</button>
					<div class="modalBox">
						<img src="" alt="">
						<p></p>
					</div>
				</div>

			
			
			</div> <%-- write_box2 끝 --%>
		
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
	        			<img alt="커피원두1" width="250px" height="280px" src="${i.getBeans_img() }" onclick="location.href='bean_content.do?num=${i.getBeans_num()}'"> 
	        		</div>
	        		<div class="info_out">
	        		
		        		<div class="con_info">
		        			<div class="con_name">
		        				<span>${i.getBeans_name() }</span>
		        			</div>
		        			<div class="con_taste">
		        				<span>${i.getBeans_taste() }</span>
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
		let grind_total;
		
		console.log("총 >>> "+b_price_total)
		console.log("가격 >>> "+hidden_total)
		console.log("수량 >>> "+number)
		console.log("그램 >>> "+b_weight)
		console.log("원두번호 >>> "+beans_num)
		console.log("grind_total>>>"+grind_total);
		
		b_price.textContent = b_price_total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); 
	 	
	}
	
	
	$(".gram_1").on("click",function(){
		let b_weight = document.getElementById("b_weight");
		let gram1 = document.getElementById("gram1").value;
		
		let number = parseInt(document.getElementById("result").textContent);
		
		b_weight.textContent = gram1; 
	
		
		$("#gram1").css({
			"background-color": "#d9cec1"
		});
		
		$("#gram2").css({
			"background-color":"#f2f2f2"
		});
		$("#gram3").css({
			"background-color":"#f2f2f2"
		});
		$("#gram4").css({
			"background-color":"#f2f2f2"
		});

		sumTotal(number);
		
	});
	
	$(".gram_2").on("click",function(){
		let b_weight = document.getElementById("b_weight");
		let gram2 = document.getElementById("gram2").value;
		
		let number = parseInt(document.getElementById("result").textContent);
		
		b_weight.textContent = gram2; 
	
		
		$("#gram2").css({
			"background-color": "#d9cec1"
		});
		
		$("#gram1").css({
			"background-color":"#f2f2f2"
		});
		$("#gram3").css({
			"background-color":"#f2f2f2"
		});
		$("#gram4").css({
			"background-color":"#f2f2f2"
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
			"background-color": "#d9cec1"
		});
		
		$("#gram1").css({
			"background-color":"#f2f2f2"
		});
		$("#gram2").css({
			"background-color":"#f2f2f2"
		});
		$("#gram4").css({
			"background-color":"#f2f2f2"
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
			"background-color": "#d9cec1"
		});
		
		$("#gram1").css({
			"background-color":"#f2f2f2"
		});
		$("#gram2").css({
			"background-color":"#f2f2f2"
		});
		$("#gram3").css({
			"background-color":"#f2f2f2"
		});
		
		sumTotal(number);
		
	});
		
		let grind_total;
	
		let grind0 = parseInt(document.getElementById("grind0").value);
		let grind1 = parseInt(document.getElementById("grind1").value);
		
	$(".grind_0").on("click",function(){
		
		grind_total = grind0;
	
		$(".grind_0").css({
			"background-color" : "#d9cec1"
		});
		
		$(".grind_1").css({
			"background-color":"#f2f2f2"
		});	
		
		console.log("갈기여부 >>> " + grind_total);
	});
	
	$(".grind_1").on("click",function(){
		
		grind_total = grind1;
		
		$(".grind_1").css({
			"background-color" : "#d9cec1"
		});
		
		$(".grind_0").css({
			"background-color":"#f2f2f2"
		});		
		
		console.log("갈기여부 >>> " + grind_total);
	});
	
	$(".cart_btn1").on("click",function(){

		if('<%=session.getAttribute("member_id")%>' != "null" && grind_total != undefined){
			
			let beans_num = document.getElementById("hidden_beans_num").value;
			let number = parseInt(document.getElementById("result").textContent);
			let b_weight = parseInt(document.getElementById("b_weight").textContent);
			parseInt(grind_total);
			
			location.href="bean_cart_insert.do?no="+beans_num+"&count="+number+"&weight="+b_weight+"&grind="+grind_total+""
					
		}else if('<%=session.getAttribute("member_id")%>' == "null"){
			
			alert('로그인 후 이용해주세요.');
			
			let resultElement = document.getElementById("result");
			
			resultElement.innerText = 1;
			
			$(".grind_0").css({"background-color":"#f2f2f2"});	
			$(".grind_1").css({"background-color":"#f2f2f2"});	
			$("#gram1").css({"background-color":"#f2f2f2"});			
			$("#gram2").css({"background-color":"#f2f2f2"});			
			$("#gram3").css({"background-color":"#f2f2f2"});			
			$("#gram4").css({"background-color":"#f2f2f2"});		
			
			
		}else if(grind_total == undefined){
			alert('갈기 여부를 선택해주세요.');
	
		
		}

	});	
	
	$(".cart_btn2").on("click",function(){

		if('<%=session.getAttribute("member_id")%>' != "null" && grind_total != undefined){
			
			let beans_num = document.getElementById("hidden_beans_num").value;
			let number = parseInt(document.getElementById("result").textContent);
			let b_weight = parseInt(document.getElementById("b_weight").textContent);
			parseInt(grind_total);
			
			location.href="bean_direct_order.do?no="+beans_num+"&count="+number+"&weight="+b_weight+"&grind="+grind_total+""
					
		}else if('<%=session.getAttribute("member_id")%>' == "null"){
			
			alert('로그인 후 이용해주세요.');
			
			let resultElement = document.getElementById("result");
			
			resultElement.innerText = 1;
			
			$(".grind_0").css({"background-color":"#f2f2f2"});	
			$(".grind_1").css({"background-color":"#f2f2f2"});	
			$("#gram1").css({"background-color":"#f2f2f2"});			
			$("#gram2").css({"background-color":"#f2f2f2"});			
			$("#gram3").css({"background-color":"#f2f2f2"});			
			$("#gram4").css({"background-color":"#f2f2f2"});		
			
			
		}else if(grind_total == undefined){
			alert('갈기 여부를 선택해주세요.');
	
		
		}

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

	
	
	$(function(){
//	 	이미지 클릭시 해당 이미지 모달
		$(".write_click_img2").click(function(){
			$(".modal11").show();
			// 해당 이미지 가겨오기
			var imgSrc = $(this).children(".write_img2").attr("src");
			$(".modalBox img").attr("src", imgSrc);
			
		});
		
		//.modal안에 button을 클릭하면 .modal닫기
		$(".modal_btn").click(function(){
			$(".modal11").hide();
		});
		
		//.modal밖에 클릭시 닫힘
		$(".modal11").click(function (e) {
	    if (e.target.className != "modal11") {
	      return false;
	    } else {
	      $(".modal11").hide();
	    }
	  });
	});	
	
	$(function(){
		
		//마우스 오버
/*		$('#starWrap ul li').mouseenter(function(){
			
			let star_count = parseInt(document.getElementById("star_count").value);
			
			var idx = $(this).index() + 1;
			$('#starWrap').removeClass();
			$('#starWrap').addClass('star'+idx);
			
			console.log("별점!!>> "+ idx);
			star_count = idx;
			
			$("#star_count").val(star_count);
			
		});*/
		

		//클릭
		$('#starWrapClick ul li').click(function(){
			let star_count = parseInt(document.getElementById("star_count").value);

			var idx = $(this).index() + 1;
			$('#starWrapClick').removeClass();
			$('#starWrapClick').addClass('star'+idx);
			
			console.log("별점!!>> "+ idx);
			star_count = idx;
			
			$("#star_count").val(star_count);
			
		})
	

	});

	
	
	
</script>
	
	
	</body>
	</html>