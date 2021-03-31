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
    <div class="d-flex justify-content-center align-items-center">
        <img src="static/image/main/main_sample.jpg" alt="메인이미지 샘플" class="main-img">
    </div>
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
