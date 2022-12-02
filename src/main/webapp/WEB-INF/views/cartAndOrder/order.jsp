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
       <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/order.css">
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
                                <a href="./01_cart_2안.html" class="a order_path_a">장바구니</a>
                            </li>
                            <li>
                                <a href="./02_order_2format.html" class="a last order_path_a"><b>주문서작성</b></a>
                            </li>
                            <!--<li>
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
                    <!-- 왼쪽 -->
                    <div class="order_main_left">
                       <div class="order_main_left_in">
                            <!-- 배송정보 -->
                            <div class="deliver_info">
                                <!-- 상단 -->
                                <div class="deliver_info_top">
                                    <h3>배송정보</h3>
                                </div>
                                <!-- 메인 -->
                                <!-- 배송 정보 입력 -->
                                <div>
                                    <form method="post" action="">
                                        <!-- 배송 정보 입력 -->
                                        <table class="order_info_text">
                                            <!-- 배송지 -->
                                            <tbody>
                                                <tr>
                                                    <th>배송지</th>
                                                    <!-- <td>
                                                        <button type="button" class="btn delivery_addr_btn" type="button">주소입력</button>
                                                    </td> -->
                                                    <td>
                                                        <input class="input delivery_input input_long">
                                                    </td>
                                                </tr>
                                                <!-- 받으시는분 -->
                                                <tr>
                                                    <th>받으시는 분</th>
                                                    <td>
                                                        <!-- member_name -->
                                                        <input class="input delivery_input">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>휴대전화</th>
                                                    <td class="flex_row">
                                                        <input type="number" class="input delivery_input">
                                                        <span class="span"> - </span>
                                                        <input type="number" class="input delivery_input">
                                                        <span class="span"> - </span>
                                                        <input type="number" class="input delivery_input">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>이메일</th>
                                                    <td class="flex_row">
                                                        <input class="input delivery_input">
                                                        <span class="span">@</span>
                                                        <input class="input delivery_input">
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tbody>
                                                <tr>
                                                    <th rowspan="2">포인트</th>
                                                    <td>
                                                        <input type="number" class="input delivery_input input_use_point"> 
                                                        <span>원 (총 사용 가능 포인트 : <span class="can_use_point">1000</span>원)</span>
                                                    </td>
                                                </tr>
                                                <tr class="except_tr">
                                                    <td class="list">
                                                        <ul class="use_point_txt">
                                                            <li class="pointText">- 적립금은 최소 1,000원 이상일때 결제 가능합니다.</li>
                                                            <li>- 최대 사용금액은 제한이 없습니다.</li>
                                                            <li>- 적립금으로만 결제할 경우 결제 금액이 0으로 보여지는 것은 정상이며
                                                            <br>&nbsp;&nbsp;[결제하기] 버튼을 누르면 주문이 완료됩니다.
                                                            </li>
                                                        </ul>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="pay_btn_area">
                                            <button type="submit" class="btn pay_btn total_price_button">
                                                <h2>결제하기</h2>
                                                <div>
                                                    <i class="fa-solid fa-arrow-right"></i>
                                                </div>
                                            </button>
                                        </div> 
                                    </form>
                                </div>
                            </div>
                       </div>
                    </div>
                    <!-- 오른쪽 -->
                    <div class="order_main_right">
                        <div class="order_main_right_in">
                            <!-- 주문 요약 -->
                            <div class="summary_order">
                                <!-- 주문정보 -->
                                <div class="detail_order_btn">
                                    <h3>주문 정보</h3>
                                    <!-- 버튼 -->
                                    <button class="btn detail_btn" onclick="showDetail()">
                                        <i class="fa-solid fa-arrow-right"></i>
                                    </button>
                                </div>
                                <!-- 주문 이미지 간략 & 버튼 -->
                                <div class="summary_order_img_btn">
                                    <!-- 이미지 구역 -->
                                    <div class="summary_order_img">
                                        <div class="summary_order_img_in">
                                            <!-- for_each로 돌아갈 예정 -->
                                            <!-- 한줄에 4개 -->
                                            <div class="row_img_area">
                                                <div class="row_img">
                                                    <a href="#" class="img_a">
                                                        <img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="row_img_area">
                                                <div class="row_img">
                                                    <a href="#" class="img_a">
                                                        <img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="row_img_area">
                                                <div class="row_img">
                                                    <a href="#" class="img_a">
                                                        <img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="row_img_area">
                                                <div class="row_img">
                                                    <a href="#" class="img_a">
                                                        <img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="row_img_area">
                                                <div class="row_img">
                                                    <a href="#" class="img_a">
                                                        <img src="./resources/orderimg/coffeebean.png" alt="상품1" class="product_img_file">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                                <!-- 주문내역 -->
                                <div class="summary_order_price">
                                    <!-- 총 주문가격 -->
                                    <div class="total_price_txt_area">
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
                                        <div class="total use_point">
                                            <h5>사용 포인트</h5> 
                                            <h5 class="h4_not"><span class="total_use_point">0</span>원</h5>
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
                                </div>
                            </div>
                           <!-- ----------------------------------- -->
                           <!-- 주문상세 -->
                           <div class="offCanvas">
                                <div class="detail_order_btn">
                                    <h3>주문 정보</h3>
                                    <button class="btn detail_btn" onclick="hideDetail()">
                                        <i class="fa-solid fa-arrow-right"></i>
                                    </button>
                                </div>
                                <div class="rows_area">
                                    <!-- foreach 로 돌아갈 예정 -->
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
                                                <p>수량 : <span class="fin_row_cnt">1</span></p>
                                            </div>
                                        </div>
                                        <div class="row_price_area">
                                            <div class="price_txt row_price_txt">
                                                <h3><span class="row_total">10000</span> 원</h3>
                                            </div>
                                        </div>
                                    </div>
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
                                                <p>수량 : <span class="fin_row_cnt">1</span></p>
                                            </div>
                                        </div>
                                        <div class="row_price_area">
                                            <div class="price_txt row_price_txt">
                                                <h3><span class="row_total">10000</span> 원</h3>
                                            </div>
                                        </div>
                                    </div>
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
                                                <p>수량 : <span class="fin_row_cnt">1</span></p>
                                            </div>
                                        </div>
                                        <div class="row_price_area">
                                            <div class="price_txt row_price_txt">
                                                <h3><span class="row_total">10000</span> 원</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="total_price_area1">
                                    <div class="total_price_area2">
                                        <!-- 총 주문가격 -->
                                        <div class="total_price_txt_area">
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
                                            <div class="total use_point">
                                                <h5>사용 포인트</h5> 
                                                <h5 class="h4_not"><span>0</span>원</h5>
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
                                    </div>
                                </div> 
                            </div> 
                        </div>
                    </div>
                </section>
            </section>
        </section>
        
        <!-- 푸터 -->
        <jsp:include page="../layout/footer.jsp" />
        <script src="<%=request.getContextPath() %>/resources/js/cartAndOrderJs/cart.js"></script>
		<script src="<%=request.getContextPath() %>/resources/js/cartAndOrderJs/order.js"></script>

</body>
</html>