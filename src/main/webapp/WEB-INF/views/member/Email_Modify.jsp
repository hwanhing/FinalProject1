<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	function CheckEmail(str){                                                 
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
     if(!reg_email.test(str)) {                            

          return false;         

     }                            

     else {                       

          return true;         

     }                            

}                                



로그인 버튼을 클릭했을 때 실행되는 함수                                 

function GoToEnroll()                

{                                          

	var obEmail  = document.getElementById("email");

	if (!obEmail.value) {             

		alert("이메일을 입력하세요!");

		obEmail.focus();	

		return;

	}               

	else   {          

		if(!CheckEmail(obEmail.value))	{

			alert("이메일 형식이 잘못되었습니다");

			obEmail.focus();

			return;

		}                

	}                      

}                           
</script>
                   

         <form action="<%=request.getContextPath() %>/Email_Modify_ok.do" method="post">
		<input type="hidden" value="${member_num } " name="member_num">
		
		<input type="text" id = "email" name = "member_email" placeholder="coffee@email.com">
	<button type="submit" OnClick = "javascript:GoToEnroll()">이메일수정</button>

		</form>
</body>
</html>