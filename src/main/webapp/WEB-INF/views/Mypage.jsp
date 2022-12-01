<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<style>
body {
	
	display: block;
	margin: 8px;
}

.nav{
max-width:1300px;
margin-right:50px;
--bs-nav-link-padding-x: 188px;
--bs-nav-link-color: #ff9600;
--bs-nav-link-hover-color: #ba6c25;
color: yellow;
}

.nav-tabs {
 	--bs-nav-tabs-border-width: 1px;
    --bs-nav-tabs-border-color: #ba6c25;
    --bs-nav-tabs-border-radius: 0.375rem;
    --bs-nav-tabs-link-hover-border-color: #e9ecef #e9ecef #red;
    --bs-nav-tabs-link-active-color: #d76872;
    --bs-nav-tabs-link-active-bg:#fff;
    --bs-nav-tabs-link-active-border-color: #ffffff #ffffff #fff;
    border-bottom: var(--bs-nav-tabs-border-width) solid var(--bs-nav-tabs-border-color);
    margin-bottom: 50px;
	width: 1232px;
    
}

.zero{

}

.first{
	margin-top:200px;
	margin-left:383px; 
	
}

.first-span{
	font-style: italic;
	font-family:bold;
	font-size: 30px;
	
}







</style>
</head>
<body>

<div>
<div class="zero">
<h1>계정 관리</h1>
<span >로그아웃을 하고 싶으신가요? <a href="#exampleModal" data-bs-toggle="modal" >로그아웃</a>
</span>
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


<!-- 탭버튼 -->
<div class="first">



<ul class="nav nav-tabs" id="myTab" role="tablist" width=750>
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">계정</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">주소</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">설정</button>
  </li>
</ul>



<!-- 탭버튼 첫번째 -->
<div class="tab-content" id="myTabContent"><!-- 부트스트랩 시작 -->

  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
  
   <div>
  <div>
  <div>
  <span class="first-span">개인정보</span>
  
<a href="#" style="margin-left:1090px;">수정</a>
</div>
<div>
	<span>김홍기</span>
</div>
<div>
<br>
	<span>1996년 01월 14일</span>
</div>
<br>
	<span>남성</span>
</div>

<hr width="1280px" color="gray">

<div>
<div>
	<span class="first-span">연락처</span>
		<a href="#" style="margin-left:1120px;">수정</a>
</div>
<div>
<br>
	<span>+82 10 9131 6130</span>
</div>
</div>




<!-- 이메일 -->
<hr width="1280px" color="gray">
<div>
<div>
	<span class="first-span">이메일</span>
		<a href="#" style="margin-left:1120px;">수정</a>
</div>
<div>
<br>
	<span>imnestea38@gmail.com</span>
</div>
</div>

<hr width="1280px" color="gray">
<!-- 비밀번호탭 -->
<div>
<div>
	<span class="first-span">비밀번호</span>
		<a href="#" style="margin-left:1090px;">수정</a>
</div>
<div>
<br>
	<span >••••••••</span>
</div>
</div>

<hr width="1280px" color="gray">
</div>
</div>

</div><!-- 부트스트랩 div 끝 -->
  
  <!--첫탭 끝 -->
  
  <!-- 2번째 탭 -->
  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
  
  <div>
<div>
<span>주소</span>
<a href="#" style="margin-left:1197px;">수정</a>
</div>
<div>
<span>서울특별시 성동구 청계천로 10나길 27-30</span>
</div>
</div>
<hr width="1280px" color="gray">  


  <div>
    <div>
		<span>주소추가</span>
	</div>
	<div>
	<span></span>

	</div>
	<hr width="1280px" color="gray">  
	<a href="">새 주소 추가</a>
 	</div>

  </div>
 
 
  <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
    
 <div >
 <div >
 <h2>회원탈퇴</h2>
 <span class="profile__text-block">를 더 이상 이용하지 않는다면 언제든 탈퇴할 수 있습니다. 단, 회원 정보 및 구매 내역이 함께 삭제된다는 점을 참고해주세요.
</span><a rel="noopener noreferrer" href="#" >계정을 삭제하시겠어요?
</a>
</div>
</div>


 </div>
</div>
</body>
</html>