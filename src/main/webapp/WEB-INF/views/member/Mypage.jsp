<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
<script type="text/javascript">

let noimage =
	  "https://www.google.com/imgres?imgurl=https%3A%2F%2Fimweb.me%2Fcommon%2Fimg%2Fdefault_profile.png&imgrefurl=https%3A%2F%2Fimweb.me%2Fmysite&tbnid=Vd7XhdBNSjYZIM&vet=12ahUKEwiT85qFiPv7AhUODpQKHbROD2QQMygDegUIARC8AQ..i&docid=3sDQ3orzKXesmM&w=200&h=200&itg=1&q=%ED%8E%98%EC%9D%B4%EC%8A%A4%EB%B6%81%20%ED%94%84%EB%A1%9C%ED%95%84%EC%9D%B4%EB%AF%B8%EC%A7%80%20%EC%97%86%EC%9D%8C&hl=ko&ved=2ahUKEwiT85qFiPv7AhUODpQKHbROD2QQMygDegUIARC8AQ";

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

</script>


<style>
.zero{
	margin-top: 200px;
	margin-left:350px;
	
	width:75%;
	height: 100px;

	
}
.nav-tabs {
    --bs-nav-tabs-border-width: 1px;
    --bs-nav-tabs-border-color: #dee2e6;
    --bs-nav-tabs-border-radius: 0.375rem;
    --bs-nav-tabs-link-hover-border-color: #e9ecef #e9ecef #dee2e6;
    --bs-nav-tabs-link-active-color: #c67501;;
    --bs-nav-tabs-link-active-bg: #fff;
    --bs-nav-tabs-link-active-border-color: #dee2e6 #dee2e6 #fff;
    width: 1300px;
    border-bottom: var(--bs-nav-tabs-border-width) solid var(--bs-nav-tabs-border-color);
}
.nav {
    --bs-nav-link-padding-x: 1rem;
    --bs-nav-link-padding-y: 0.5rem;
    --bs-nav-link-font-weight: ;
    --bs-nav-link-color: var(--bs-link-color);
    --bs-nav-link-hover-color: var(--bs-link-hover-color);
    --bs-nav-link-disabled-color: #6c757d;
    display: flex;
    flex-wrap: wrap;
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
}

.tabbable-panel {
  margin-top: 100px;
}

.tabbable-line > .nav-tabs {
  border: none;
  margin: 0px;
}
.tabbable-line > .nav-tabs > li {
  margin-right: 50px;
  font-size: 15px;
  width: 400px;
  text-align: center;

}
.tabbable-line > .nav-tabs > li > a {
  border: 0;
  margin-right: 0;
  color: #737373;
  font-size: 20px;

}
.tabbable-line > .nav-tabs > li > a > i {
  color: #c14d0f;
  width: 60%;
}
.tabbable-line > .nav-tabs > li.open, .tabbable-line > .nav-tabs > li:hover {
  border-bottom: 1px solid #c67501;
}
.tabbable-line > .nav-tabs > li.open > a, .tabbable-line > .nav-tabs > li:hover > a {
  border: 0;
  background: none;
   color: #c67501;
}
.tabbable-line > .nav-tabs > li.open > a > i, .tabbable-line > .nav-tabs > li:hover > a > i {
  color: #ba6c25;
}

.tabbable-line > .nav-tabs > li.open .dropdown-menu, .tabbable-line > .nav-tabs > li:hover .dropdown-menu {
  margin-top: 0px;
}
.tabbable-line > .nav-tabs > li.active {
  border-bottom: 4px solid #c67501;
  width: 350px;
  text-align: center;
}
.tabbable-line > .nav-tabs > li > a{
color: #ae0a0a;
text-align: center;
}

.tabbable-line > .nav-tabs > li.active > a {
  border: 0;
  color:#c67501;
}

.tabbable-line > .nav-tabs > li.active > a > i {
  color: #404040;
}
.tabbable-line > .tab-content {
  margin-top: -3px;
  background-color: #fff;
  border: 0;
  border-top: 1px solid #eee;
  padding: 15px 0;
}
.portlet .tabbable-line > .tab-content {
  padding-bottom: 0;
}

.first-span{
	font-style: italic;
	font-family:bold;
	font-size: 30px;
	
}
img{		
margin-left:50px;
border: 1px solid black;
border-radius: 100%;
height: 200px;
width: 200PX;
 }
        
.profile{
margin-top: 50px;
}
.fa-cogs:before, .fa-gears:before {
    content: "\f085";
    font-size: 60px;
    margin-bottom: 30px;
	position: absolute;
	float: right;
}

</style>
</head>
<body>
<jsp:include page="../layout/header.jsp" />


<c:set var="dto" value="${Mypage }" />

<div>
	
	

<div class="zero">
<br>
<br>
<h1>계정 관리</h1>
<div class="logout">
<span>로그아웃을 하고 싶으신가요? <a href="#exampleModal" data-bs-toggle="modal">로그아웃</a>
</span>
	</div>
</div>
</div>
<br><br>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Logout</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        로그아웃 하시겟습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Back</button>
        <button type="button" class="btn btn-primary" onclick="location.href='member_logout.do'">Logout</button>
      </div>
    </div>
  </div>
</div>



<div class="container">
  <div class="row">
    <div class="col-md-12">
			<div class="tabbable-panel">
				<div class="tabbable-line">
					<ul class="nav nav-tabs ">
						<li class="active">
							<a href="#tab_default_1" data-toggle="tab">계정</a>
						</li>
						<li>
							<a href="#tab_default_2" data-toggle="tab">주소 </a>
						</li>
						<li>
							<a href="#tab_default_3" data-toggle="tab">설정 </a>
						</li>

					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab_default_1">
							<div>				
								<div class="field">
									<div class="profile">
							 		  <span class="first-span">프로필사진</span>
							 		 <br><br>
							 		 </div>
							             <label for="image"></label>
							        <a href="<%=request.getContextPath()%>/imgchang.do?num=${dto.getMember_num()}&img=${dto.getMember_img()}"><img alt="이미지없음" id="img-preview1" class="img_no" src="${dto.getMember_img()}" /></a>										
							       
											<%-- 	<a href="<%=request.getContextPath()%>/imgchang.do?num=${dto.getMember_num()}"><i class="fa-solid fa-gears"></i></a> --%>
										<br><br>	
										<div>
										
										</div>
							        </div>
										<hr width="1280px" color="gray">
								  <div>
				  
								  <div>
								  <span class="first-span">개인정보</span>
								  
								
								</div>
								<div>
									<br><br>
									<span>${dto.getMember_name() }</span>
								</div>
								<div>
								<br>
									<span>${dto.getMember_birth().substring(0,10) }</span>
								</div>
								<br>
									
								</div>
								
								<hr width="1280px" color="gray">
								
								<div>
								<div>
									<span class="first-span">연락처</span>
										<a class="modify" href="<%=request.getContextPath() %>/member_Phone_Modify.do?num=${dto.getMember_num()}&phone=${dto.getMember_phone()}" style="margin-left:1120px;">수정</a>
								</div>
								<div>
								<br>
									<span>${dto.getMember_phone() }</span>
								</div>
								</div>
								
								
								
								
								<!-- 이메일 -->
								<hr width="1280px" color="gray">
								<div>
								<div>
									<span class="first-span">이메일</span>
										<a class="modify" href="<%=request.getContextPath() %>/member_Email_Modify.do?num=${dto.getMember_num()}" style="margin-left:1120px;">수정</a>
								</div>
								<div>
								<br>
									<span>${dto.getMember_email() }</span>
								</div>
								</div>
								
								<hr width="1280px" color="gray">
								<!-- 비밀번호탭 -->
								<div>
								<div>
									<span class="first-span">비밀번호</span>
										<a class="modify" href="<%=request.getContextPath() %>/member_Pwd_Modify.do?num=${dto.getMember_num()}" style="margin-left:1090px;">수정</a>
								</div>
								<div>
								<br>
									<span ><c:if test="${dto.getMember_pwd().length() != 0 }">
								                     <c:forEach begin="1" end="${dto.getMember_pwd().length() }">
								                        *
								                     </c:forEach>
								                  </c:if>
								                  </span>
								</div>
								</div>
								
								<hr width="1280px" color="gray">
								</div>
								</div>
															
						<div class="tab-pane" id="tab_default_2">
							<div>
								<div>	
								<span class="first-span">주소1</span>
								
								</div>
						
								<div>
								<span>${dto.getMember_addr() }</span>
								</div>
								<c:if test="${dto.getMember_addr() ne '주소를 넣어주세요' }">
								<a href="<%=request.getContextPath() %>/addr_modify.do?num=${dto.getMember_num()}" style="margin-left:1120px;">수정</a>
								</c:if>
								
								<c:if test="${dto.getMember_addr() == '주소를 넣어주세요' }">
								<a href="<%=request.getContextPath() %>/addr_modify.do?num=${dto.getMember_num()}" style="margin-left:1120px;">추가</a>
								</c:if>
								</div>	
								<hr width="1280px" color="gray">  
								
							
							
							
								<div>
								<div>	
								<span class="first-span">주소2</span>
								
								</div>
						
								<div>
								<span>${dto.getMember_addr2() }</span>
								</div>
								<c:if test="${dto.getMember_addr2() ne '주소를 넣어주세요' }">
								<a href="<%=request.getContextPath() %>/addr_modify2.do?num=${dto.getMember_num()}" style="margin-left:1120px;">수정</a>
								</c:if>
								
								<c:if test="${dto.getMember_addr2() == '주소를 넣어주세요' }">
								<a href="<%=request.getContextPath() %>/addr_modify2.do?num=${dto.getMember_num()}" style="margin-left:1120px;">추가</a>
								</c:if>
								</div>	
								<hr width="1280px" color="gray">  
								
						
								 <div>
								<div>
								<span class="first-span">주소3</span>
								
								</div>
								<div>
								
								
								</div>
								
								
								<div>
								<span>${dto.getMember_addr3() }</span>
								</div>
								<c:if test="${dto.getMember_addr3() ne '주소를 넣어주세요' }">
								<a href="<%=request.getContextPath() %>/addr_modify3.do?num=${dto.getMember_num()}" style="margin-left:1120px;">수정</a>
								</c:if>
								
								<c:if test="${dto.getMember_addr3() == '주소를 넣어주세요' }">
								<a href="<%=request.getContextPath() %>/addr_modify3.do?num=${dto.getMember_num()}" style="margin-left:1120px;">추가</a>
								</c:if>
								</div>
								<hr width="1280px" color="gray">  
								
								 <div>
								<div>
								<span class="first-span">주소4</span>
								
								</div>
						
								<div>
								<span>${dto.getMember_addr4() }</span>
								</div>
							<c:if test="${dto.getMember_addr4() ne '주소를 넣어주세요' }">
								<a href="<%=request.getContextPath() %>/addr_modify4.do?num=${dto.getMember_num()}" style="margin-left:1120px;">수정</a>
								</c:if>
								
								<c:if test="${dto.getMember_addr4() == '주소를 넣어주세요' }">
								<a href="<%=request.getContextPath() %>/addr_modify4.do?num=${dto.getMember_num()}" style="margin-left:1120px;">추가</a>
								</c:if>
								</div>
								<hr width="1280px" color="gray">  
								
								 <div>
								<div>
								<span class="first-span">주소5</span>
								
								</div>
						
								<div>
								<span>${dto.getMember_addr5() }</span>
								</div>
								<c:if test="${dto.getMember_addr5() ne '주소를 넣어주세요' }">
								<a href="<%=request.getContextPath() %>/addr_modify5.do?num=${dto.getMember_num()}" style="margin-left:1120px;">수정</a>
								</c:if>
								
								<c:if test="${dto.getMember_addr5() == '주소를 넣어주세요' }">
								<a href="<%=request.getContextPath() %>/addr_modify5.do?num=${dto.getMember_num()}" style="margin-left:1120px;">추가</a>
								</c:if>
								</div>
								<hr width="1280px" color="gray">  
						
						 
						</div>
						<div class="tab-pane" id="tab_default_3">
						<div>
								  <div>
								 <h2>회원탈퇴</h2>
								<span class="profile__text-block">커퍼 커피 를 더 이상 이용하지 않는다면 언제든 탈퇴할 수 있습니다. 단, 회원 정보 및 구매 내역이 함께 삭제된다는 점을 참고해주세요.
								</span><a rel="noopener noreferrer" href="<%=request.getContextPath()%>/user_delete.do?num=${dto.getMember_num()}">계정을 삭제하시겠어요?
								</a>
								
									</div><!-- 부트스트랩 div 끝 -->
								  		</div>
									</div>
								</div>		
							</div>
						</div>
					</div>
			    </div>
			  </div>


<jsp:include page="../layout/footer.jsp" />
</body>
</html>