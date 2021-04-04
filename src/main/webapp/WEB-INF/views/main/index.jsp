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

<!-- 컨테이너 -->
<div id="container" class="mx-auto">
    <h1>Main</h1>
    <h1>담영 열작업중!!!!</h1>
    메인 컨테이너입니다. (width: 1280px)<br>
    모두들 이 가로 사이즈에 맞게 작업해주세요.
    <br><br>
    메뉴 네비게이션 바 a 태그 href 에 각자 자기 페이지 컨트롤러 주소를 입력하세요!
    <hr>
    백오피스 페이지 링크는 푸터에 있습니다.
</div>


<%@ include file="footer.jspf"%>
</body>
</html>
