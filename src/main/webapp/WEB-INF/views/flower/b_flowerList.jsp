<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>꽃다발 상품 조회</title>
    <%@ include file="../main/b_import.jspf"%>
    <link rel="stylesheet" href="/static/css/item/b_addForm.css">
    <link rel="stylesheet" href="/static/css/item/flowerList.css">
</head>
<body>
    <%@ include file="../main/b_header.jspf"%>
    <div id="container" class="mx-auto">
        <nav id="bread-nav" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb mb-xxl-5">
                <li class="breadcrumb-item"><a href="/admin/main">관리자 홈</a></li>
                <li class="breadcrumb-item"><a href="/admin/flower">꽃다발 관리</a></li>
                <li class="breadcrumb-item active" aria-current="page">상품 조회/수정/삭제</li>
            </ol>
        </nav>

        <div class="row row-cols-4">
            <c:forEach var="flowerVo" items="${list}">
            <c:if test="${not empty flowerVo}">
            <div class="col f-col">
                <a href="#">
                    <img src="/static/upload/${flowerVo.image1}" class="f-col-img" alt="꽃다발 썸네일">
                </a>
                <div class="f-col-text">
                    <div class="subheader">${flowerVo.subheader}</div>
                    <div class="flower-name">
                        <a href="#">${flowerVo.name}</a></div>
                    <div>
                        <c:if test="${not empty flowerVo.discountRate && flowerVo.discountRate > 0}">
                        <span class="discount-rate">${flowerVo.discountRate}%</span>
                        <span class="original-price">${flowerVo.price}원 ></span>
                        </c:if>
                        <span class="final-price">${flowerVo.finalPrice}원</span>
                    </div>
                    <div class="last-line">
                        <span class="badge rounded-pill bg-warning size-unit">${flowerVo.fsize}</span>
                        <span class="f-col-size">size</span>
                        <c:if test="${flowerVo.freeDelivery > 0}">
                        <span class="badge rounded-pill bg-secondary delivery-unit">${flowerVo.freeDeliveryMessage}</span>
                        </c:if>
                    </div>
                </div>
            </div>
            </c:if>
            </c:forEach>
        </div>
    </div>

    <%@ include file="../main/b_footer.jspf"%>

</body>
</html>
