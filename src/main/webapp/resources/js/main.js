<link href="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.min.js" rel="stylesheet"/>

$(document).ready(function(){
    //원두 추천 

    var recomSwiper = new Swiper(".main-recom .recom-wrap ",{
        effect: "slide",
        slidesPerView: 3,
        spaceBetween: 0,
        speed: 300,
        loop: true,
        touchEnabled: false,
        autoplay: {
            delay: 2000
        }

    });

});