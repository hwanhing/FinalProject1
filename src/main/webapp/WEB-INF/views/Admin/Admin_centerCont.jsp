<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.easing/1.3/jquery.easing.1.3.js"></script>
<style>
textarea{
resize: none;
}
.first{
 margin-left: 380px;
	margin-top: 100px;
}

.second{
	width: 75%;
	margin-left: 50px;
}


.line{
width: 1600px;
color:#734338;
}
.span1{
color: #a66b56;
}
.h11{
color: #734338;
}
/*부트스트랩  */
.form-control {
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border-radius: 0.375rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.a_btn{
		margin-top:50px;
		float: right;
		border-radius: 10px;
		border: none;
		font-size: 17px;
		background-color: #D9CEC1;
		width: 60px;
		height: 35px;
	}
</style>
</head>
<body>

<jsp:include page="../layout/Admin_header2.jsp"  /> 
<c:set value="${centerCont }" var="dto" />
<form action="<%=request.getContextPath()%>/admin_center_ok.do" method="post">
 	<input type="hidden" name="board_num" value="${dto.getBoard_num() }"> 
	<div class="first">
			<h1 class="h11"><span class="span1">고객센터</span> 답변페이지</h1>
			<hr class="line" style="height: 10px;">
		<div class="second">
			<div class="mb-3">
				  <label for="exampleFormControlInput1" class="form-label">작성자</label>
				  <input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.getMember_id()}" readonly>
				  <div>
				  	  <label for="exampleFormControlInput1" class="form-label">작성일 :</label>
				  	<span>${dto.getBoard_date().substring(0,10) }</span>
				  </div>
				</div>
				<div class="mb-3">
				  <label for="exampleFormControlTextarea1" class="form-label">문의내용</label>
				  <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" readonly>${dto.getBoard_cont() }</textarea>
				</div>
				
				<div  class="mb-3">
						<h2>답변</h2>
					<div>
						  <textarea class="form-control" id="exampleFormControlTextarea1" rows="6" name="reply_cont"></textarea>
						  
					</div>
						<button type="submit" class="a_btn">답변</button>
				</div>
				
		</div>
	</div>
</form>
</body>
</html>