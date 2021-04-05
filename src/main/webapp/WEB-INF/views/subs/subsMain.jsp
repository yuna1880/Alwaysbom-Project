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
            box-shadow: none;
        }
    </style>
</head>
<body>
<%@ include file="../main/header.jspf" %>
    <div class="banner-wrap d-flex align-items-center justify-content-center">
        <div class="w-1280 mx-auto">
            <img src="/static/image/flower/flower_banner_1280.jpg" alt="꽃다발배너" class="col-12">
        </div>
        <div class="banner-text w-1280 position-absolute mx-auto">
            <div class="banner-title fw500 mb-4 ms-2">새늘봄 꽃 정기구독</div>
            <div class="banner-summary fw-light ms-2">
                2주에 한 번, 매번 새로운 꽃으로 당신의 일상을 행복으로 채울게요.
            </div>
        </div>
    </div>

<!-- 컨테이너 -->
<div id="container" class="mx-auto">
    <!-- 상품 버튼 -->
    <div class="d-flex justify-content-center my-5">
        <div class="row">
            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked onclick="subsList()">
                <label class="btn btn-outline-primary" id="sub_btn1" for="btnradio1">정기구독 상품
                </label>

                <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="subsInfo()">
                <label class="btn btn-outline-primary" id="sub_btn2" for="btnradio2">이용 방법
                </label>
            </div>
        </div>
    </div>

    <div class="subs_list">
    <!-- 정기구독 상품 4개 리스트 -->
    <c:forEach var="subsVo" items="${subsList}" varStatus="status">

        <c:if test="${empty subsVo}">
            <h3>등록된 정기구독 상품이 없습니다. 상품을 등록해주세요.</h3>
        </c:if>
        <c:if test="${not empty subsVo}">

            <c:if test="${status.index == 0 || status.index == 2}">
                <div class="row my-5">
                           <div class="col-5">
                        <a href="/subs/${subsVo.idx}">
                            <img src="${subsVo.image1}" alt="꽃 구독S" class="w-100"/>
                        </a>
                    </div>
                    <div class="col-7">
                        <h3>${subsVo.subheader}</h3>
                        <h2>${subsVo.name}</h2>
                        <h2>${subsVo.price} ~</h2>
                        <p>${subsVo.content}</p>
                        <span class="badge rounded-pill bg-light text-dark">무료배송</span>
                    </div>
                </div>
                <hr>
            </c:if>
            <c:if test="${status.index == 1 || status.index == 3}">
                <div class="row my-5">
                    <div class="col-7">
                        <h3>${subsVo.subheader}</h3>
                        <h2>${subsVo.name}</h2>
                        <h2>${subsVo.price} ~</h2>
                        <p>${subsVo.content}</p>
                        <span class="badge rounded-pill bg-light text-dark">무료배송</span>
                    </div>
                    <div class="col-5">
                        <a href="/subs/${subsVo.idx}">
                            <img src="${subsVo.image1}" alt="꽃 구독M" class="w-100"/>
                        </a>
                    </div>
                </div>
                <hr>
            </c:if>
        </c:if>
    </c:forEach>
    </div>

    <div class="subs_info">
        <h3>인포인포메이션</h3>
    </div>




    </div>

<%@ include file="../main/footer.jspf" %>
<script>
    window.onload = function () {
        subsList();
    }
    function subsList() {
        document.querySelector('.subs_list').style.display = 'block';
        document.querySelector('.subs_info').style.display = 'none';
    }
    function subsInfo() {
        document.querySelector('.subs_list').style.display = 'none';
        document.querySelector('.subs_info').style.display = 'block';
    }


</script>
</body>
</html>
