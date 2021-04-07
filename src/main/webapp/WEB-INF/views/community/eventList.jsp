<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>이벤트</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="../../../static/css/item/list.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../main/header.jspf" %>

<!-- 배너 이미지와 글귀 -->
<div class="banner-wrap d-flex align-items-center justify-content-center">
    <div class="w-1280 mx-auto">
        <img src="../../../static/image/product/product_banner_1280.jpg" alt="이벤트배너" class="col-12">
    </div>
    <div class="banner-text w-1280 position-absolute mx-auto">
        <div class="banner-title fw500 mb-4 ms-2">새늘봄 이벤트</div>
        <div class="banner-summary fw-light ms-2">
            인생을 꽃같이<br>만들어 줄 이벤트를 만나보세요.
        </div>
    </div>
</div>

<!-- 컨테이너 -->
<div id="container" class="mx-auto">
    <div class="p-subtitle fs-4 d-flex align-items-center">
        현제 진행중인 이벤트에요!
    </div>
    <div class="row row-cols-3">
        <c:forEach var="event" items="${eventList}">
            <div class="col mb-8em">
                <div class="overflow-hidden mb-3">
                    <a href="/community/event/${event.idx}">
                        <img src="${event.thumb}" class="col-12 scale-up" alt="소품샵 썸네일">
                    </a>
                </div>
                <div class="ps-1">
                    <div class="item-name">
                        <a href="/product/${event.idx}">${event.name}</a></div>
                    <div class="price-wrap">
                        <div class="mb-2">
                                <span class="final-price">
                               ${event.startDate} ~ ${event.endDate}</span>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div> <!-- #container 닫음 -->
<%@ include file="../main/footer.jspf" %>

</body>
</html>