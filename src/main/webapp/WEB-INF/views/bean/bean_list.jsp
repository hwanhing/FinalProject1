<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피 목록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>


<style type="text/css">
        .top{
            width: 100%;
            height: 4em;
            background-color: blue;
        }

        .top_text{
            color: white;
            font-size: 3em;
        }

        .botton{
            width: 100%;
            height: 5em;
            background-color: blue;
        }

        .botton_text{
            color: white;
            font-size: 3em;
        }

        .empty{
            width: 80%;
            margin-left: 10%;
            margin-right: 10%;
        }

        .select_box1,
        .select_box2{
            display: inline;
        }

        .box1,
        .box2{
            width: 9em;
            height: 2em;
            border: 1px solid black;
        }

		.con1{
	     /*  border: 1px solid black; */
	      width: 100%;
	      position: relative;
	      background-color: #E3DCCC;	
	      height: 600px;	
		}
		
		.con1:after{
	      display: block;
	      content: "";
	      padding-bottom: 100%;				
		}

		.list_box{
		   /*  border: 1px solid green; */
	      	width: 100%;
	      	display: grid;
	      grid-template-columns: repeat(4, 1fr);
	      gap: 28px;
	      @media screen and (max-width: 718px) {
	        gap: 3px;
	      }	      	
		}
		
		.cart_btn{
			width: 45px;
			height: 45px;
			border-radius: 25px;
			background-color: #734338;		
			margin-left: 10%;
			border: none;
		}
		
		.heart_btn{
			width: 45px;
			height: 45px;
			border-radius: 25px;
			background-color:#fff;
			margin-left: 3%;
			border: none;	
		}
		
		.con_box{
			margin-top: 10%;
		}
		
		.con_info{
			margin-top: 10%;
			margin-bottom: 10%;
			margin-left: 10%;
			padding-top: 15px;
		}

		
		.info_out{
			background-color: #D6CCB7;
			height: 225px;
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
		
		.formaa{
			float: left;
		}
		
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />

    <div style="height: 15em;">

    </div>

    <div class="empty">
        <div class="title_box">
            <h1>전체 목록</h1>
        </div>

        <div style="height: 4em;">

        </div>

       <div class="select_box1">
            <select class="box1" name="select_box">
                <option id="op_name" value="정렬">정렬</option>
                <option value="찜많은순">찜많은순</option>
                <option value="낮은가격순">낮은가격순</option>
                <option value="높은가격순">높은가격순</option>
            </select>
        </div>

        <div class="select_box2">
            <select class="box2">
                <option>고객평가</option>
                <option>★★★★★</option>
                <option>★★★★</option>
                <option>★★★</option>
                <option>★★</option>
                <option>★</option>
            </select>
            <br>
        </div>

        <br>
        <hr style="margin: 0;">
        <br>
        <c:set var="list" value="${List }" />
        <c:if test="${empty list }">
        	<table>
        		<tr>
        			<td>	
        			<h3>안ㄴ와</h3>
        			</td>
        		</tr>
        	</table>
        </c:if>

        
        <div class="list_box">
        
        	<c:forEach items="${list }" var="i"  varStatus="status">
        	
        	<div class="con1">
        	
        		<div class="con_box" align="center">
        			<img alt="커피원두1" width="300px" height="300px" <%--여기--%> src="${i.getBeans_img() }" onclick="location.href='bean_content.do?num=${i.getBeans_num()}'"> 
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
        		
        			<%-- 장바구니 버튼 --%>
       				<button type="button" class="cart_btn" onclick="location.href='bean_cart_insert.do?no=${i.getBeans_num()}'">	
						<svg focusable="false" viewBox="0 0 24 24" class="pip-svg-icon pip-btn__icon" aria-hidden="true">
							<path id="cart_border" style="fill:rgb(255, 255, 255);" fill-rule="evenodd" clip-rule="evenodd" d="M10.4372 4h3.1244l.2922.4801 3.3574 5.517h5.0694l-.3104 1.2425L21.5303 13h-2.0615l.2506-1.0029H4.2808l1.3106 5.2426a1 1 0 0 0 .9702.7574H15v2H6.5616c-1.3766 0-2.5766-.9369-2.9105-2.2724L2.03 11.2397l-.3107-1.2426H6.788l3.357-5.517L10.4372 4zm2.0003 2L14.87 9.9971H9.1291L11.5614 6h.8761zm5.5586 10v-2h2v2h2v2h-2v2h-2v-2h-2v-2h2z"></path>
						</svg>  
					</button>      				
        			
        			<%-- 찜 버튼 --%>
       				<button type="button" class="heart_btn" value="${i.getBeans_num() }">
 						<svg focusable="false" viewBox="0 0 24 24" class="pip-svg-icon pip-btn__icon" aria-hidden="true">
							<path id="heart_border" style="fill:rgb(0, 0, 0);" fill-rule="evenodd" clip-rule="evenodd" d="M19.205 5.599c.9541.954 1.4145 2.2788 1.4191 3.6137 0 3.0657-2.2028 5.7259-4.1367 7.5015-1.2156 1.1161-2.5544 2.1393-3.9813 2.9729L12 20.001l-.501-.3088c-.9745-.5626-1.8878-1.2273-2.7655-1.9296-1.1393-.9117-2.4592-2.1279-3.5017-3.5531-1.0375-1.4183-1.8594-3.1249-1.8597-4.9957-.0025-1.2512.3936-2.5894 1.419-3.6149 1.8976-1.8975 4.974-1.8975 6.8716 0l.3347.3347.336-.3347c1.8728-1.8722 4.9989-1.8727 6.8716 0zm-7.2069 12.0516c.6695-.43 1.9102-1.2835 3.1366-2.4096 1.8786-1.7247 3.4884-3.8702 3.4894-6.0264-.0037-.849-.2644-1.6326-.8333-2.2015-1.1036-1.1035-2.9413-1.0999-4.0445.0014l-1.7517 1.7448-1.7461-1.7462c-1.1165-1.1164-2.9267-1.1164-4.0431 0-1.6837 1.6837-.5313 4.4136.6406 6.0156.8996 1.2298 2.0728 2.3207 3.137 3.1722a24.3826 24.3826 0 0 0 2.0151 1.4497z"></path>
						</svg>				
					</button> 
					</div>
					</div><%-- con1 끝 --%>
								
				</c:forEach>
				
        	</div> <%-- list_box 끝 --%>
        </div> <%-- empty 끝 --%>
        
    <jsp:include page="../layout/footer.jsp" />
    
    
<script type="text/javascript">

 $(function(){
	
	// 하트찜 클릭시 member_num 과 beans_num이 있는지 select로 일단 찾아보고
 	$(document).on("click", ".heart_btn", function(){
 		 let no ='<%=session.getAttribute("member_num")%>';
 		
 		console.log("원두 번호 >> "+ $(this).val());
 		console.log("세션번호 >> " + no);
 		
 		if(no == "null"){
 			alert('로그인 후 이용가능합니다.');
 		}else{
 		
 		$.ajax({
			type : "post",
			url : "heart_select_list.do",
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			data : {
					member_num : no,
					beans_num : $(this).val()
					},
			datatype : "text",
			success: function(data1){
					
				if(data1 != 0){
					console.log("찾음");
					alert("이미 찜한 상품");
					
					
				}else{
					console.log("값 없음");
					alert("처음 찜한 상품");
					
				}

			},
			error : function(){
				alert('데이터 통신 에러');
			}
		});  
 		}
	});
	
	
 	$('.box1').change(function() {
 	    var result = $('.box1 option:selected').val();
 	   	var name = document.getElementById("op_name").value;
 	   
 	    if (result == '찜많은순') {
 	    	
 	    	location.href="beans_list_heart.do"
 
 	    } else if(result == '낮은가격순'){
 	    	
 	    	location.href="beans_price_down.do"
 	    	
 	    } else if(result == '높은가격순'){
 	    	
 	    	location.href="beans_price_up.do"
 	    	
 	    } else{
 	    	location.href="bean_list.do"
 	    }
 	    
 	  }); 

}); 












<%--
 $(function(){

 	$(document).on("click", ".heart_btn", function(){
 		 let no ='<%=session.getAttribute("member_num")%>';
 		
 		console.log("원두 번호 >> "+ $(this).val());
 		console.log("세션번호 >> " + no);
 		if(no == "null"){
 			alert('로그인 후 이용가능합니다.');
 		}else{
 		
 		$.ajax({
			type : "post",
			url : "heart_insert.do",
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			data : {
					member_num : no,
					coffee_heart : 0,
					beans_num : $(this).val()
					},
			datatype : "text",
			success: function(data){
						
				<%-- 하트 색깔 변경을 나중에... 모르겠음..^^.. 
				console.log("찜");

			},
				
		});  
 		}
	});
}); 
--%>


</script>

</body>
</html>