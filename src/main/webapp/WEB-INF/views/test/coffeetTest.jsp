<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% long time = System.currentTimeMillis(); %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>나만의 커피 취향 테스트</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/recommand.js"> </script>
</head>
<body>
<div class="container test-container">
    <form action="">

        <div class="test-wrapper">
            <div class="test-center">
                <div class="test-content">


                    <div class="test-header">
                        <div class="header-wrapper">
                            <div class="header-bar">
                            <button>X</button>
                            </div>
                        </div>
                    </div>


                    <div class="main-content">
                        <h1>커피를 어떻게 내려드시나요?</h1>
                        <div class="main-list">

                            <div class="list-wrapper">


                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>에스프레소 머신</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>핸드드립</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>모카포트</span>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>




        <div class="test-wrapper">
            <div class="test-center">
                <div class="test-content">


                    <div class="test-header">
                        <div class="header-wrapper">
                            <div class="header-bar">
                            <button>X</button>
                            </div>
                        </div>
                    </div>


                    <div class="main-content">
                        <h1>어떤 커피를 즐기시나요?</h1>
                        <div class="main-list">

                            <div class="list-wrapper">


                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>블랙 그대로</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>우유를 더한 라떼</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>설탕을 넣어 마셔요</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>시럽을 넣어 마셔요</span>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>




        <div class="test-wrapper">
            <div class="test-center">
                <div class="test-content">


                    <div class="test-header">
                        <div class="header-wrapper">
                            <div class="header-bar">
                            <button>X</button>
                            </div>
                        </div>
                    </div>


                    <div class="main-content">
                        <h1>디카페인도 준비되어있어요.<br>어떻게 추천해드릴까요?</h1>
                        <div class="main-list">

                            <div class="list-wrapper">


                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>카페인은 필수!</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>디카페인이 좋아요</span>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>


        <div class="test-wrapper">
            <div class="test-center">
                <div class="test-content">


                    <div class="test-header">
                        <div class="header-wrapper">
                            <div class="header-bar">
                            <button>X</button>
                            </div>
                        </div>
                    </div>


                    <div class="main-content">
                        <h1>어느 스타일을 즐기시나요?</h1>
                        <div class="main-list">

                            <div class="list-wrapper">


                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>원두 본연의 맛을 즐겨요</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>커피스러운 커피맛이 좋아요</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>조화로운 맛이 좋아요</span>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>




        <div class="test-wrapper">
            <div class="test-center">
                <div class="test-content">


                    <div class="test-header">
                        <div class="header-wrapper">
                            <div class="header-bar">
                            <button>X</button>
                            </div>
                        </div>
                    </div>


                    <div class="main-content">
                        <h1>어떤 맛을 원하시나요?</h1>
                        <div class="main-list">
                            <div class="list-wrapper">


                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>상큼한 과일과 화사한 꽃향기</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>농익은 과일의 묵직한 달콤함</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>고소한 견과류의 향긋한 밸런스</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>쌉쌀한 다크 초콜릿의 바디감</span>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>




        <div class="test-wrapper">
            <div class="test-center">
                <div class="test-content">


                    <div class="test-header">
                        <div class="header-wrapper">
                            <div class="header-bar">
                            <button>X</button>
                            </div>
                        </div>
                    </div>

                    


                    <div class="main-content">
                        <h1>어느 정도 가격대로 추천해드릴까요?</h1>
                        <div class="main-list">

                            <div class="list-wrapper">


                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>모든 가격대</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>20,000원 이하</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>16,000원 이하</span>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>




        <div class="test-wrapper">
            <div class="test-center">
                <div class="test-content">


                    <div class="test-header">
                        <div class="header-wrapper">
                            <div class="header-bar">
                            <button>X</button>
                            </div>
                        </div>
                    </div>


                    <div class="main-content">
                        <h1>마지막입니다.<br>원두를 갈아드릴까요?</h1>
                        <div class="main-list">
                            <div class="list-wrapper">



                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>직접 갈게요</span>
                                    </div>
                                </div>

                                <div class="list-type">
                                    <div class="list-img">
                                        <img src="" alt="">
                                        <span>도구에 맞게 갈아주세요</span>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>





    </form>
</div>
</body>
</html>