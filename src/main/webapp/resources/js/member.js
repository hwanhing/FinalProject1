
/******************************/
/*******  로그인      ***********/
/******************************/


// 로그인 모달 팝업 
$('.login-pop').click(function(){
    $('.log-modal').fadeIn()
});

// 로그인 모달 팝업 닫기
$('.icon-close').click(function(){
    $('.log-modal').fadeOut()
    
});


//영역 밖 클릭 시 로그인 모달 창 꺼짐
$(document).on('click', function(e){
    if($('.log-modal').is(e.target)) {
     $('.log-modal').css({
         display:"none"
     });
    }
 });
 

// 회원가입 버튼 클릭 시 회원가입 모달 팝업
$('.mf-join').click(function() {
    $('.join-modal').fadeIn()
});


/******************************/
/*******  계정찾기    ***********/
/******************************/


// 게정 분실 버튼 클릭 시 계정 분실 모달 팝업 
$('.mf-find').click(function(){
    $('.find-modal').fadeIn()
});

// 계정찾기 모달 닫기
$('#fd-close').click(function(){
    $('.find-modal').fadeOut()
});

//영역 밖 클릭 시 계정찾기 모달 창 꺼짐
$(document).on('click', function(e){
    if($('.find-modal').is(e.target)) {
     $('.find-modal').css({
         display:"none"
     });
    }
 });


// 라디오버튼 선택 시 input 양식 변경 

$(function(){
    $('.find-modal .fd-select ')
});

/******************************/
/******* 회원가입     ***********/
/******************************/


// 회원가입 모달 팝업 
$('.join-pop').click(function(){
    $('.join-modal').fadeIn()
});

$('.icon-close').click(function(){
    $('.join-modal').fadeOut()
});


// 회원가입 정규식 확인 

    $.ajaxSetup({
        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
        type : "post",
        cache: "false"
    });

    $("#join-id").focusout(function(e){

        let joinId = $("#join-id").val();
        let id_pattern = /^[a-zA-Z0-9]{5,}$/g;
        let id_length = joinId.length;

        console.log("dddd"+joinId);
 
        if(id_length==0) {
            $(".id-error").html("아이디는 필수입력 항목입니다.").show();
            $("#join-id").val("");
            $("#join-id").focus();

        } else if(!id_pattern.test(joinId)) { 
            $(".id-error").html("영문, 숫자 조합 최소 5자 이상").show();
            $("#join-id").val("");
            $("#join-id").focus();

        } else {  

        $.ajax({
            url: "<%=request.getContextPath()%>/member_Id_check.do",
            type: "post",
            data: {
                member_id: joinId
            },

            success: function(result) {
                if (result==1) {
                    $("#id-error").html("이미 사용 중인 아이디입니다.").show();
                    $("#join-id").val("");
                    $("#join-id").focus();
                    } else {
                    $("#id-error").html("사용 가능한 아이디입니다.").show();
                }
            } 

            
        });

    }

    });           

    // 비밀번호 확인
$("#join-pw").focusout(function() {

    let joinPwd = $("#join-pw").val().trim();
    let join_rePwd = $("#join-pw-check").val().trim();

    let pwd_pattern1 = /[a-zA-Z]/;
    let pwd_pattern2 = /[0-9]/;
    let pwd_pattern3 = /[~!@\#$%<>^&*]/;     // 원하는 특수문자 추가 제거
    let pwd_pattern4 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,}$/;

    console.log(joinPwd)


        // 비밀번호 일치 쌍방 체크 필요
        if(joinPwd.length > 0 && join_rePwd.length > 0) {

            if(joinPwd == join_rePwd) {
                $(".pw-error").html("비밀번호가 일치합니다").show();

            }else if(joinPwd != join_rePwd) {
                $(".pw-error").html("비밀번호가 일치하지 않습니다").show();
                return false;
            }
        }

        // 비밀번호 조건 안 맞는 경우
        if(pwd_pattern1.test(joinPwd)) {
            $(".pw-error").html("잘못된 형식의 비밀번호입니다.").show();
        }else {
            $(".pw-error").hide();
        }
        if(pwd_pattern2.test(joinPwd)) {
            $(".pw-error").html("잘못된 형식의 비밀번호입니다.").show();        
        }else {
            $(".pw-error").hide();
        }
        if(pwd_pattern3.test(joinPwd)) {
            $(".pw-error").html("잘못된 형식의 비밀번호입니다.").show();        
        }else {
            $(".pw-error").hide();   
        }
        if(joinPwd.length >= 8 && joinPwd.length <= 20){
            $(".pw-error").html("잘못된 형식의 비밀번호입니다.").show();
        }else {
            $(".pw-error").hide();
        }
        if(pwd_pattern4.test(joinPwd)) {
            $(".pw-error").html("잘못된 형식의 비밀번호입니다.").show();
        }

        
    });

    // 비밀번호 일치 여부 확인
    $("#join-id-check").focusout(function() {
        let join_rePwd = $("#join-pw-check").val().trim();
        let joinPwd = $("#join-pw").val().trim();
                
        if(joinPwd.length > 0 && join_rePwd.length > 0){
        if(joinPwd == join_rePwd) {
        $(".pw-error").hide();
    
        }else if(joinPwd != join_rePwd) {
        $(".pw-error").html("비밀번호가 일치하지 않습니다").show();
        return false;
            }  
        }
    
    });


// 이메일 정규식 확인

$("#join-email").focusout(function(){

        const email = $("#join-id").val().trim();
        const exp = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,}$/;
        const emailLength = email.length;
        console.log(emailLength);

        if(emailLength == 0){
            $(".email-error").html("이메일은 필수입력 항목입니다.").show();
            $("#join-email").val("");
            $("#join-email").focus();

         }else if(!email.match(exp)){
            $(".email-error").html("잘못된 형식의 이메일입니다.").show();
            $("#join-email").val("");
            $("#join-email").focus();
            return false;
         }
        
        else if(email.match(exp)) {
        $.ajax({

            type:"post",
            url:"<%=request.getContextPath() %>/member_Email_check.do",
            data:{
                member_email:email
            },
            dataType : 'text',
            success : function(result) {
                if (result == 1) {            
                    $(".email-error").html("이미 사용 중인 이메일입니다.").show();
                    $("#join-email").val("");
                    $("#join-email").focus();
                } else {
                    $(".email-error").html("사용 가능한  이메일입니다.").show();
                    $("#join-email").val("");
                    $("#join-email").focus();
                }
            },
           error : function() {
              console.log('오류 발생');
           }

        });
     }

});

function valiForm(form) {
    
    let joinId = $("#join-id").val().trim();
    let error = true;

    let id_pattern = /^[a-zA-Z0-9]{6,}$/g;
    if(!id_pattern.test(joinId)) {
        alert("아이디 작성 조건에 부합하지 않습니다. 다시 확인해주세요.");
        $("#join-id").focus();
        $("#join-id").val("");
        return false;
    }

    if(joinId.length > 0) {
        $.ajax({
            type : "post",
            url : "<%=request.getContextPath()%>/member_Id_check.do",
            data: {
                member_id: joinId
            },
            dataType : "text",
            async : false,
    
            success : function(result) {
                if(result > 0) {
                    alert("중복된 아이디입니다. 다시 확인해주세요.");
                    error = false;
                    form.join_id.focus();
                    form.join_id.value = "";                        
                }else {
                    error = true;
                }
            },
            error : function(e){
                alert("Error : " + e.status);
            }
        });        
        return error;
    }

    // ========== 비밀번호 유효성 검사 ===========
    let pwd_pattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,}$/;
    if(!pwd_pattern.test($("#join-pw").val())){
    alert("잘못된 비밀번호 형식입니다. 다시 확인해주세요.");
    $("#join-pw").focus();
    $("#join-pw").val("");
    $("#join-pw-check").val("");
            $(".pw-error").html("잘못된 형식의 비밀번호입니다.").show();
            return false;
        }
}


// $("#join-email").on("input", function(){
//     let joinEmail = $("#join-email").val();
//     let email_pattern = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
    
//     if(!email_pattern.test(joinEmail)) {
//         $(".email-error").show();

//     } else {
//         $(".email-error").hide();
//         $.ajax({
//             url: "<%=request.getContextPath()%>/member_login_check.do",
//             data: { paramId : "joinEmail "},
//             type: "get",
//             success : function(result) {
//                 if(result>0) {
//                     $("#join-email").show.html("사용할 수 없는 아이디입니다."); 
//                 } else {
//                     $("join-email").show.html("사용 가능한 아이디입니다.");
//                 }
//             }, error : function() {
//                 alert("에러가 발생했습니다.");
//             }
//         });
//     } 


// 회원가입 약관 전체 동의시 전체 checked 

$('#check-all').on('click', function() {
    var checked = $(this).is(':checked');

    if(checked){
        $(this).closest('.join-agr').find('input').prop('checked', true); 
    }else {
        $(this).closest('.join-agr').find('input').prop('checked', false);
    }
});



//영역 밖 클릭 시 회원가입 모달 창 꺼짐

$(document).on('click', function(e){
   if($('.join-modal').is(e.target)) {
    $('.join-modal').css({
        display:"none"
    });
}

});
