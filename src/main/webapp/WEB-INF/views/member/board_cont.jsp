<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#table_1{
		
	}
	
	
	
	#con_1{
		margin-left: 23%;
		margin-top: 200px;
		margin-bottom: 50px;
		border: 1px solid #c6c6c6;
		width: 55%;
		padding: 40px 30px 30px 30px;
		border-radius: 10px;
	}
	
	#content{
		resize: none;
		border: none;
		outline: none;
	}

	
	
	#re_writer{
		border: none;
		pointer-events: none;
		font-weight: bold;
		width: 500px;
	}	
	
	#re_content{    
		width: 100%;
	    border: none;
	    resize: none;
	    outline: none;
	}
	
	#replyBtn{
		border: none;
	    font-size: 15px;
	    border-radius: 6px;
	    text-align: center;
	    background-color: white;
	    float: right;
	}
	
	#con_2{
		border: 1px solid #c6c6c6;
		border-radius: 10px;
		padding: 25px 10px 25px 25px;
		background-color: #F0F0F0;
	}
	
	#con_3{
		padding: 10px;
	}
	
	#pro_img{
	
		width: 35px;
		height: 35px; 
		margin: 0; 
		float: left; 
		margin-top: 10px;
		margin-left: 10px; 
		margin-right: 10px;
	}
	
	#tag_1{
		font-weight: bold; 
		color: #000; 
		text-decoration: none;
	}
	
	#tit_btn{
		border: none;
		font-size: 18px;
		font-weight: bold;
		float: right;
		background-color: #fff;
		margin-right: 2%;
	}
		.zero{
	
	


	
}
	
</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="zero">
	<div id="con_1">
			<c:set var="dto" value="${board_cont }" />
			<c:set var="dto1" value="${admin_reply}"/>		
				<div>
				<h2>${dto.getBoard_title() }
					${dto1.getReply_cont() }
				</h2>
							
				<br>
		
				<div>
					<b style="font-size: 19px;"> ${dto.getBoard_title() } </b>
					<br>
					
				</div>	
				</div>
				<hr>
				
		
			<div id="con_2">
				<p>
				π’ λ³Έ κ²μνμ λ¬Έμ κ²μνμλλ€.<br>
				π’ κΆκΈνμ  λ΄μ©μ΄λ λΆνΈν μ μ μμ λ‘­κ² λ¬Έμν΄ μ£ΌμΈμ.</p>
				
				λ¬Έμνμ  λ΄μ©μ κ³ κ°μΌν°μμ νμΈ ν μμμΌ κΈ°μ€ 1~3μΌ μ΄λ΄μ λ΅λ³ λλ¦¬λλ‘ νκ² μ΅λλ€.<br>
				* μ΄μ μκ°: νμΌ (μ ~ κΈ) 10:00 ~ 18:00
			</div>
			<br>
			<div id="con_3">
			
				<p>${dto.getBoard_cont() }</p>
			
			</div>
			
			
			<br>
			
			<hr style="width: 100%;">
			
			
			<%-- μ¬κΈ°μ κ΄λ¦¬μκ° λ΅λ³μ μ£Όμλ€λ©΄ κ΄λ¦¬μ λ΅λ³λ ν¨κ» λμμ£Όκ³  / λ΅λ³μ΄ μλ€λ©΄ nullμ΄λΌλ©΄ μ½νμΈ λ§ λμμ€λ€. --%>
		<div>
			
				<c:if test="${dto.getBoard_reply() eq dto1.getReply_num()}">
					<table id="table_1">
						<tr>
							<th style="font-size: 20px;">β³ λ΅λ³</th>
						</tr>
						<tr>
							<td><br><span style="font-weight: bold; font-style: italic; font-size: 23px;">Cuppa Coffee</span><br>
								μλνμΈμ. μ»€νΌ μ»€νΌμλλ€.<br><br>
								${dto1.getReply_cont() }<br><br>
								κΆκΈνμ  λ΄μ©μ λν΄ λμμ΄ λμ¨κΈΈ λ°λλλ€.<br><br>
								κ°μ¬ν©λλ€.π<br>
							</td>
						</tr>
					</table>
				
				</c:if>
			
			</div>  -

		</div>
</div>
</body>
</html>