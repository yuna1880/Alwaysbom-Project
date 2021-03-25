<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>새늘봄 / 장바구니</title>
    <%@ include file="../main/import.jspf"%>
</head>
<body>
    <%@ include file="../main/header.jspf"%>

    <div id="container" class="mx-auto d-flex flex-column align-items-center">
        <h1>장바구니</h1>
        <ul id="basket" class="list-group list-group-flush w-100">
            <li class="list-group-item bg-dark text-white d-flex text-center">
                <div class="col-1">체크</div>
                <div class="col-6">상품정보</div>
                <div class="col-3">추가상품</div>
                <div class="col-2">합계 금액</div>
            </li>
            <c:forEach var="cart" items="${list}">
            <li class="list-group-item bg-white text-primary d-flex text-center">
                <div class="col-1">체크</div>
                <div class="col-6 d-flex">
                    <div class="card-img">
                        <!-- 카테고리에 따라서 이미지 찾는 경로가 달라짐-->
                        <c:if test="category eq '꽃다발'">
                            <img src="/static/image/flower/" alt="꽃다발">
                        </c:if>
                        <img src="/static/image/${}"
                    </div>
                </div>
                <div class="col-3">추가상품</div>
                <div class="col-2">합계 금액</div>
            </li>
            </c:forEach>
        </ul>
    </div>

    <%@ include file="../main/footer.jspf"%>
</body>
</html>
