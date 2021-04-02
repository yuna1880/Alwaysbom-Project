<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>꽃 정기구독</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="/static/css/item/list.css">
    <style>
        #sub_btn1, #sub_btn2 {
            font-size: 25px;
            margin: 20px 100px 50px 100px;
            border: none;
            background-color: white;
            color: black;
        }
    </style>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div class="banner-img d-flex justify-content-center align-items-center">
    꽃 정기구독 배너 이미지
</div>
    <div class="container" class="mx-auto">

    <!-- 상품 버튼 -->
    <div class="d-flex justify-content-center my-5">
            <div class="row">
                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                    <label class="btn btn-outline-primary" id="sub_btn1" for="btnradio1">정기구독 상품
                    </label>

                    <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                    <label class="btn btn-outline-primary" id="sub_btn2" for="btnradio2">이용 방법
                    </label>
                </div>
            </div>
    </div>

    <!-- 정기구독 상품 4개 리스트 -->
    <div class="row my-5">
        <div class="col-5">
            <a href="#">
                <img src="/static/image/flower/flower1.jpg" alt="꽃 구독S" class="w-100"/>
            </a>
        </div>
        <div class="col-7">
            <h3>내 공간이 꽃이 되는 좋은 시작</h3>
            <h2>딱 좋은 S 꽃구독</h2>
            <h2>26,900원 ~</h2>
            <p>
                2주에 한 번, 내 공간이 꽃이 되는 좋은 시작
                한 손에 가득 차는 꽃다발로 그 계절 가장 예쁜 꽃을 담았어요.
                책상 위, 침대 옆에 두고 더욱 커지는 일상의 행복을 느껴보세요.
            </p>
            <span class="badge rounded-pill bg-light text-dark">무료배송</span>
        </div>
    </div>
    <hr>
    <div class="row my-5">
        <div class="col-7">
            <h3>내 공간이 꽃이 되는 좋은 시작</h3>
            <h2>딱 좋은 M 꽃구독</h2>
            <h2>26,900원 ~</h2>
            <p>
                2주에 한 번, 내 공간이 꽃이 되는 좋은 시작
                한 손에 가득 차는 꽃다발로 그 계절 가장 예쁜 꽃을 담았어요.
                책상 위, 침대 옆에 두고 더욱 커지는 일상의 행복을 느껴보세요.
            </p>
            <span class="badge rounded-pill bg-light text-dark">무료배송</span>
        </div>
        <div class="col-5">
            <a href="#">
                <img src="/static/image/flower/flower1.jpg" alt="꽃 구독M" class="w-100"/>
            </a>
        </div>
    </div>
    <hr>


    </div>


<%@ include file="../main/footer.jspf" %>

</body>
</html>
