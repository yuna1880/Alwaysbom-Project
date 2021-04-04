<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>시작페이지(메인)</title>
    <%@ include file="import.jspf"%>
    <link rel="stylesheet" href="static/css/main.css">
</head>
<body>
<%@ include file="header.jspf"%>
<!-- 메인 슬라이드 이미지 -->
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="/static/image/main/main_sample2.jpg" class="d-block w-100 main-img" alt="메인배너">
        </div>
        <div class="carousel-item">
            <img src="/static/image/main/main_sample.jpg" class="d-block w-100 main-img" alt="메인배너">
        </div>
        <div class="carousel-item">
            <img src="/static/image/main/main_sample3.jpg" class="d-block w-100 main-img" alt="메인배너">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- 새늘봄 꽃 정기구독 -->
<div class="w-1280 mx-auto mt-100 mb-5 d-flex justify-content-between">
    <div class="col-4 d-flex flex-column pt-2 ps-4">
        <span class="fs-3 ts-narrower ps-3">2주에 한번, 나를 위한 행복</span>
        <span class="fs-3 fw-bolder ts-narrower ps-3">새늘봄 꽃 정기구독</span>
        <span class="mt-3 mb-2 fs-19 fw-light ts-narrower ps-3">
            이 계절 가장 이쁜 꽃으로 구성된 구독 꽃이예요!
        </span>
        <span class="my-2 ps-3">M size M size M size M size</span>
        <button type="button" class="mt-4 py-3 subs-btn col-8">정기구독 더 알아보기</button>
    </div>
    <div class="col-7 d-flex justify-content-end">
        <div class="me-2 thumbnails"></div>
        <div class="ms-3 thumbnails"></div>
    </div>
    <div class="col-1 d-flex align-items-center justify-content-center">
        <i class="fas fa-chevron-right fs-1 next-btn"></i>
    </div>
</div>

<!-- 새늘봄 꽃다발 -->
<div class="mt-100 flower-wrap">
    <div class="w-1280 mx-auto">
        <div class="ps-4">
            <span class="fs-3 ts-narrower ps-3">꽃이 필요한 순간,</span>
            <span class="fs-3 fw-bolder ts-narrower ps-3">새늘봄 꽃다발</span>
        </div>
    </div>
</div>

<!-- 새늘봄 플라워클래스 -->
<div class="fclass-wrap">
    <div class="w-1280 mx-auto">
        <div class="ps-4">
            <span class="fs-3 ts-narrower ps-3">꽃과 함께 하는 일상,</span>
            <span class="fs-3 fw-bolder ts-narrower ps-3">플라워클래스</span>
        </div>
    </div>
</div>
<!-- 새늘봄 소품샵 -->



<%@ include file="footer.jspf"%>
</body>
</html>
