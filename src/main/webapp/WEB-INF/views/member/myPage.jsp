<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이페이지</title>
    <%@ include file="../main/import.jspf"%>
    <link href="/static/css/member/myPage.css" rel="stylesheet">
</head>
<body>
    <%@ include file="../main/header.jspf" %>
    <div id="container" class="mx-auto">
        <div class="my_header">
            <p class="grade">
                <span class="row">
                    <strong class="th">회원 등급</strong>
                    <span class="td">WHITE</span>
                </span>
                <span class="row" ::before>
                    <strong class="th">포인트</strong>
                    <span class="td">1000</span>
                </span>
                <span class="row" ::before>
                    <strong class="th">보유 쿠폰</strong>
                    <span class="td">0장</span>
                </span>
            </p>
        </div>
        <div class="alert_wrap">

        </div>
        <!-- left -->
        <div class="cont_left">
            <!-- My navigation -->
            <div class="my_navigation_wrap">
                <ul class="my_navigation">
                    <li class="item ">
                        <a href="" class="dp1">
                            <span>주문 내역</span>
                        </a>
                    </li>
                    <li class="item ">
                        <a href="" class="dp1">
                            <span>정기 구독</span>
                        </a>
                    </li>
                    <li class="item ">
                        <a href="" class="dp1">
                            <span>수강 내역</span>
                        </a>
                    </li>
                    <li class="item ">
                        <a href="/community/goFaq" class="dp1">
                            <span>자주 묻는 질문</span>
                        </a>
                    </li>
                    <li class="item ">
                        <a href="/question/create" class="dp1">
                            <span>1:1 문의</span>
                        </a>
                    </li>
                    <li class="item ">
                        <a href="" class="dp1">
                            <span>상품 후기</span>
                        </a>
                    </li>
                    <li class="item ">
                        <a href="" class="dp1">
                            <span>회원 등급</span>
                        </a>
                    </li>
                    <li class="item ">
                        <a href="" class="dp1">
                            <span>포인트</span>
                        </a>
                    </li>
                    <li class="item ">
                        <a href="" class="dp1">
                            <span>회원 정보 관리</span>
                        </a>
                    </li>
                    <li class="item ">
                        <a href="" class="dp1">
                            <span>회원 탈퇴</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- right -->
        <div class="cont_right">
            <div class="my_anniversary">
                <h4 class="hello">
                    <span class="name">이다솜</span>
                    님, 오늘도 꽃 같은 날이에요-
                </h4>
                <div class="calendar_ui">
                    <img src="../image/flower/flower1.jpg">
                </div>
            </div>
        </div>
        <%@ include file="../main/footer.jspf"%>
    </div>
</body>
</html>
