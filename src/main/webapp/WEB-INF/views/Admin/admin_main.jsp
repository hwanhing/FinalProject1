<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<style>

</style>
</head>
<body>
<div>
	<jsp:include page="../layout/Admin_header2.jsp"  />
	
	
	<div align="center">
	<h1>${admin_num }
		${admin_id }
		${admin_name }</h1>
	</div>
	
</div>
</body>
</html>