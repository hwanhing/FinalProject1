
// 로그인 모달 팝업 
$('.login-pop').click(function(){
    $('.log-modal').fadeIn()
});

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

// 회원가입 모달 팝업 
$('.join-pop').click(function(){
    $('.join-modal').fadeIn()
});

$('.icon-close').click(function(){
    $('.join-modal').fadeOut()
});

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

