<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
 <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="./resources/orderimg/coffeebean04.png">
        <title>장바구니</title>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/frame.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/cart.css">
        <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
        <style>
        	.blank{
        		height: 120px;
        		
        	}
        </style>
    </head>
      <body>
        <%-- 해더 --%>
        <jsp:include page="../layout/header.jsp" />
        <div class="blank"></div>
         <!-- 컨텐츠 부분 -->
        <section class="content">
            <section class="order_wrap">
                <section class="order_top">
                    <!-- 홈 > 장바구니 > 주문서작성 > 결제완료 > 주문완료 -->
                    <section class="order_path">
                        <ul class="list order_path_list">
                            <li>
                                <a href="#" class="a order_path_a">홈</a>
                            </li>
                            <li>
                                <a href="./01_cart.html" class="a last order_path_a"><b>장바구니</b></a>
                            </li>
                            <!-- <li>
                                <a href="#" class="a order_path_a">주문서작성</a>
                            </li>
                            <li>
                                <a href="#" class="a order_path_a">결제완료</a>
                            </li>
                            <li>
                                <a href="#" class="a order_path_a">주문완료</a>
                            </li> -->
                        </ul>
                    </section>
                </section>
                <!-- 장바구니 목록 컨텐츠 -->
                <section class="order_main cart_row_section">
                    <!-- 장바구니 담겨져있는 상품 row -->
                    <div class="order_main_left rows_area">
                        <form method="post" action="02_order_2format.html">
                            <!-- ----------------------------------- -->
                            <!-- for each 로 돌아갈 예정  -->
                            <div class="row_area">
                                <!-- 상품 이미지 -->
                                <div class="row_img_area">
                                    <div class="row_img">
                                        <a href="#" class="img_a">
                                            <img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file">
                                        </a>
                                    </div>
                                </div>
                                <!-- 상품정보 -->
                                <div class="row_cont_area">
                                    <div class="product_name">
                                        <h3>가나 원두</h3>
                                        <p>다크 / 200g</p>
                                        <p><span class="row_price">13000</span> 원</p>
                                    </div>
                                    <div class="product_cnt_delete">
                                        <div class="cnt_updown">
                                            <input type="number" min="1" max="20" class="input input_cnt" value="1" name="cart_cnt" readonly>
                                            <div class="btn_area">
                                                <button type="button" class="btn btn_up"><i class="fa-solid fa-caret-up"></i></button>
                                                <button type="button" class="btn btn_down"><i class="fa-solid fa-caret-down"></i></button>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn_dh btn_delete" onclick="deleteRow(0)">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                        <button type="button" class="btn btn_dh btn_coffee_heart">
                                            <i class="fa-solid fa-heart heart_active"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- 상품가격 -->
                                <div class="row_price_area">
                                    <div class="price_txt row_price_txt">
                                        <h3><span class="row_total">10000</span> 원</h3>
                                        <input type="hidden" class="row_total_hidden" name="row_total_hidden">
                                    </div>
                                </div>
                            </div>
                            <div class="hr_div hr_content"></div>

                            <!-- ----------------------------------- -->
                            <!-- for each 로 돌아갈 예정  -->
                            <div class="row_area">
                                <!-- 상품 이미지 -->
                                <div class="row_img_area">
                                    <div class="row_img">
                                        <a href="#" class="img_a">
                                            <img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file">
                                        </a>
                                    </div>
                                </div>
                                <!-- 상품정보 -->
                                <div class="row_cont_area">
                                    <div class="product_name">
                                        <h3>브라질 원두</h3>
                                        <p>다크 / 200g</p>
                                        <p><span class="row_price">10000</span> 원</p>
                                    </div>
                                    <div class="product_cnt_delete">
                                        <div class="cnt_updown">
                                            <input type="number" min="1" max="20" class="input input_cnt" value="1" name="cart_cnt" readonly>
                                            <div class="btn_area">
                                                <button type="button" class="btn btn_up"><i class="fa-solid fa-caret-up"></i></button>
                                                <button type="button" class="btn btn_down"><i class="fa-solid fa-caret-down"></i></button>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn_dh btn_delete" onclick="deleteRow(1)">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                        <button type="button" class="btn btn_dh btn_coffee_heart">
                                            <i class="fa-solid fa-heart heart_active"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- 상품가격 -->
                                <div class="row_price_area">
                                    <div class="price_txt row_price_txt">
                                        <h3><span class="row_total">10000</span> 원</h3>
                                        <input type="hidden" class="row_total_hidden" name="row_total_hidden">
                                    </div>
                                </div>
                            </div>
                    </div>
                    <!-- 총 금액 -->
                    <div class="order_main_right total_price_area1">
                        <div class="order_main_right_in total_price_area2">
                            <!-- 총 주문가격 -->
                            <div class="total_price_txt_area">
                                <h3>주문내역</h3>
                                <div class="total total_price_txt">
                                    <h4>상품가격</h4> 
                                    <div class="price_txt">
                                        <h3><span class="total_price">10000</span> 원</h3>
                                        <input type="hidden" class="total_price_hidden" name="total_price_hidden">
                                    </div>
                                </div>
                                <div class="total total_delivery">
                                    <h4>전체배송비</h4> 
                                    <h4 class="h4_not"><span>무료배송</span></h4>
                                </div>
                                <div class="hr_div hr_price"></div>
                                <!-- 상품가격 + 배송비 -->
                                <div class="total all_price">
                                    <h4>총 주문금액</h4> 
                                    <div class="price_txt">
                                        <h3><span class="all_total_price">10000</span> 원</h3>
                                    </div>
                                </div>
                                <div class="total all_t_point">
                                    <h5>적립 포인트</h5> 
                                    <div class="price_txt">
                                        <h5><span class="all_point">10000</span> 원</h5>
                                        <input type="hidden" class="all_point_hidden" name="all_point_hidden">
                                    </div>
                                </div>
                            </div>
                            <!-- 결제하기 버튼 구역 -->
                            <div class="total_price_button_area">
                                <button type="submit" class="btn total_price_button">
                                    <h2 class="total_price_button_in">결제하기</h2>
                                    <div class="total_price_button_in">
                                        <i class="fa-solid fa-arrow-right"></i>
                                    </div>
                                </button>
                            </div>
                        </div>
                    </div>
                    </form>
                </section>
                <div class="hr_div"></div>
                <!-- 추천제품 -->
                <section class="order_bottom recommend_products_section">
                    <h3>추천제품</h3>
                    <div class="recommend_products_section2">
                        <div id="slider" class="recommend_products">
                            <!-- 추후 foreach 로 계속 돌 예정 : 추천 상품 8가지-->
                            <!-- ------------------------------ -->
                            <!-- 추천상품 -->
                            <div class="recommend_product">
                                <div class="recommend_product_area">
                                    <!-- 추천상품이미지 -->
                                    <div class="recommend_img_area">   
                                        <div class="recommend_img">
                                            <a href="#" class="img_a"><img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file"></a>
                                        </div>
                                    </div>
                                    <!-- 추천상품가격 -->
                                    <div class="recommend_price_heart">
                                        <h3><span>10000</span>원</h3>
                                        <button class="btn btn_coffee_heart">
                                            <i class="fa-solid fa-heart"></i>
                                        </button>
                                    </div>
                                    <!-- 별점 -->
                                    <div class="recommend_star">
                                        <i class="fa-solid fa-star star"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- ------------------------------ -->
                            <!-- 추천상품 -->
                            <div class="recommend_product">
                                <div class="recommend_product_area">
                                    <!-- 추천상품이미지 -->
                                    <div class="recommend_img_area">   
                                        <div class="recommend_img">
                                            <a href="#" class="img_a"><img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file"></a>
                                        </div>
                                    </div>
                                    <!-- 추천상품가격 -->
                                    <div class="recommend_price_heart">
                                        <h3><span>10000</span>원</h3>
                                        <button class="btn btn_coffee_heart">
                                            <i class="fa-solid fa-heart"></i>
                                        </button>
                                    </div>
                                    <!-- 별점 -->
                                    <div class="recommend_star">
                                        <i class="fa-solid fa-star star"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- ------------------------------ -->
                            <!-- 추천상품 -->
                            <div class="recommend_product">
                                <div class="recommend_product_area">
                                    <!-- 추천상품이미지 -->
                                    <div class="recommend_img_area">   
                                        <div class="recommend_img">
                                            <a href="#" class="img_a"><img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file"></a>
                                        </div>
                                    </div>
                                    <!-- 추천상품가격 -->
                                    <div class="recommend_price_heart">
                                        <h3><span>10000</span>원</h3>
                                        <button class="btn btn_coffee_heart">
                                            <i class="fa-solid fa-heart"></i>
                                        </button>
                                    </div>
                                    <!-- 별점 -->
                                    <div class="recommend_star">
                                        <i class="fa-solid fa-star star"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- ------------------------------ -->
                            <!-- 추천상품 -->
                            <div class="recommend_product">
                                <div class="recommend_product_area">
                                    <!-- 추천상품이미지 -->
                                    <div class="recommend_img_area">   
                                        <div class="recommend_img">
                                            <a href="#" class="img_a"><img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file"></a>
                                        </div>
                                    </div>
                                    <!-- 추천상품가격 -->
                                    <div class="recommend_price_heart">
                                        <h3><span>10000</span>원</h3>
                                        <button class="btn btn_coffee_heart">
                                            <i class="fa-solid fa-heart"></i>
                                        </button>
                                    </div>
                                    <!-- 별점 -->
                                    <div class="recommend_star">
                                        <i class="fa-solid fa-star star"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- ------------------------------ -->
                            <!-- 추천상품 -->
                            <div class="recommend_product">
                                <div class="recommend_product_area">
                                    <!-- 추천상품이미지 -->
                                    <div class="recommend_img_area">   
                                        <div class="recommend_img">
                                            <a href="#" class="img_a"><img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file"></a>
                                        </div>
                                    </div>
                                    <!-- 추천상품가격 -->
                                    <div class="recommend_price_heart">
                                        <h3><span>10000</span>원</h3>
                                        <button class="btn btn_coffee_heart">
                                            <i class="fa-solid fa-heart"></i>
                                        </button>
                                    </div>
                                    <!-- 별점 -->
                                    <div class="recommend_star">
                                        <i class="fa-solid fa-star star"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- ------------------------------ -->
                            <!-- 추천상품 -->
                            <div class="recommend_product">
                                <div class="recommend_product_area">
                                    <!-- 추천상품이미지 -->
                                    <div class="recommend_img_area">   
                                        <div class="recommend_img">
                                            <a href="#" class="img_a"><img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file"></a>
                                        </div>
                                    </div>
                                    <!-- 추천상품가격 -->
                                    <div class="recommend_price_heart">
                                        <h3><span>10000</span>원</h3>
                                        <button class="btn btn_coffee_heart">
                                            <i class="fa-solid fa-heart"></i>
                                        </button>
                                    </div>
                                    <!-- 별점 -->
                                    <div class="recommend_star">
                                        <i class="fa-solid fa-star star"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- ------------------------------ -->
                            <!-- 추천상품 -->
                            <div class="recommend_product">
                                <div class="recommend_product_area">
                                    <!-- 추천상품이미지 -->
                                    <div class="recommend_img_area">   
                                        <div class="recommend_img">
                                            <a href="#" class="img_a"><img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file"></a>
                                        </div>
                                    </div>
                                    <!-- 추천상품가격 -->
                                    <div class="recommend_price_heart">
                                        <h3><span>10000</span>원</h3>
                                        <button class="btn btn_coffee_heart">
                                            <i class="fa-solid fa-heart"></i>
                                        </button>
                                    </div>
                                    <!-- 별점 -->
                                    <div class="recommend_star">
                                        <i class="fa-solid fa-star star"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- ------------------------------ -->
                            <!-- 추천상품 -->
                            <div class="recommend_product">
                                <div class="recommend_product_area">
                                    <!-- 추천상품이미지 -->
                                    <div class="recommend_img_area">   
                                        <div class="recommend_img">
                                            <a href="#" class="img_a"><img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file"></a>
                                        </div>
                                    </div>
                                    <!-- 추천상품가격 -->
                                    <div class="recommend_price_heart">
                                        <h3><span>10000</span>원</h3>
                                        <button class="btn btn_coffee_heart">
                                            <i class="fa-solid fa-heart"></i>
                                        </button>
                                    </div>
                                    <!-- 별점 -->
                                    <div class="recommend_star">
                                        <i class="fa-solid fa-star star"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                        <i class="fa-solid fa-star star_empty"></i>
                                    </div>
                                </div>
                            </div>   
                        </div>
                        <!-- <div id="indicator">
                            <div id="indi_bar"></div>
                        </div> -->
                    </div>
                </section>
            </section>
        </section>
         <!-- 푸터 -->
        <jsp:include page="../layout/footer.jsp" />
        <script src="<%=request.getContextPath() %>/resources/js/cartAndOrderJs/cart.js"></script>
    </body>
</html>