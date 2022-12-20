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
<script src="https://code.jquery.com/jquery-3.4.1.js"
integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
crossorigin="anonymous"></script>
<link href="<%=request.getContextPath()%>/resources/css/admin_member_cont.css" rel="stylesheet" />
</head>
<script type="text/javascript">
	function readURL(input) {
	console.log(input.files);
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#img-preview1").attr("src", e.target.result);
		};

		reader.readAsDataURL(input.files[0]);
	} else {
		$("#img-preview1").attr("src", noimage);
	}
}

</script>
<body>
	<jsp:include page="../layout/Admin_header2.jsp"  />
	<c:set var="dto" value="${member_cont }" />
		<div class="contanior">
		<h1>회원 상세보기</h1>
		<hr class="line" style="height: 10px;">
			<div class="warp">
				<div class="content">
					<div>
							<div class="navi">
							<img alt="이미지없음" id="img-preview1" class="img_no" src="<%=request.getContextPath() %>/resources/res/img/${dto.getMember_img()}" />
						<div>	
						
						  <input type="file" accept="image/*" onchange="readURL(this)" class="image_gallery"  name="file1"/>
						  </div>
							  <div class="user_id">
							  <span class="first-span">ID</span>
							  <input type="text" name="member_id" value="${dto.getMember_id() }">
							  </div>
						</div>
					  
							
						</div>
				</div>
			</div>
		</div>
</body>
</html>