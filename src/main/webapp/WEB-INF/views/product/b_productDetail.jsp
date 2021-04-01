<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>소품샵 상세페이지</title>
    <%@ include file="../main/b_import.jspf"%>
    <link rel="stylesheet" href="/static/css/item/b_addForm.css">
    <link rel="stylesheet" href="/static/css/item/list.css">
</head>
<body>
<%@ include file="../main/b_header.jspf"%>
<div id="container" class="mx-auto">
    <!-- 메뉴 이동 경로 -->
    <nav id="bread-nav" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <a class="breadcrumb mb-8em">
            <li class="breadcrumb-item"><a href="/admin/main">관리자 홈</a></li>
            <li class="breadcrumb-item"><a href="/admin/product">소품샵 관리</a></li>
            <li class="breadcrumb-item><a href="/admin/productList">상품 조회/수정/삭제</a></li>
            <li class="breadcrumb-item active" aria-current="page">  </li>
        </ol>
    </nav>

    <!-- 화병 썸네일 -->
    <div class="p-subtitle fs-4 d-flex align-items-center">
        꽃을 더 아름답게 즐길 수 있는, 화병
    </div>
    <div class="row row-cols-4">
        <c:forEach var="productVo" items="${vase}">
        <c:if test="${not empty productVo}">
        <div class="col mb-8em">
            <div class="overflow-hidden mb-3">
                <a href="/product/${productVo.idx}">
                    <img src="${productVo.image1}" class="col-12 scale-up" alt="소품샵 썸네일">
                </a>
            </div>
            <div class="ps-1">
                <div class="item-name">
                    <a href="/product/${productVo.idx}">${productVo.name}</a></div>
                <div class="price-wrap">
                <c:if test="${not empty productVo.discountRate && productVo.discountRate > 0}">
                <span class="discount-rate">${productVo.discountRate}%</span>
                <span class="original-price">
                    <fmt:formatNumber value="${productVo.price}" pattern="#,###원 >"/>
                </span>
                </c:if>
                <span class="final-price">
                    <fmt:formatNumber value="${productVo.finalPrice}" pattern="#,###원"/>
                </span>
                </div>
                <c:if test="${not empty productVo.fsize}">
                <div class="fit-size">
                    <span class="badge rounded-pill bg-secondary size-unit">${productVo.fsize}</span>
                    <span class="item-size">size꽃과 잘어울려요!</span>
                </div>
                </c:if>
            </div>
        </div>
        </c:if>
        </c:forEach>
    </div>

    <!-- 굿즈 썸네일 -->
    <div class="p-subtitle fs-4 d-flex align-items-center">
        꽃과 함께하면 더 좋은, 굿즈
    </div>
    <div class="row row-cols-4">
        <c:forEach var="productVo" items="${goods}">
        <c:if test="${not empty productVo}">
        <div class="col mb-8em">
            <div class="overflow-hidden mb-3">
                <a href="/product/${productVo.idx}">
                    <img src="${productVo.image1}" class="col-12 scale-up" alt="소품샵 썸네일">
                </a>
            </div>
            <div class="ps-1">
                <div class="item-name">
                    <a href="/product/${productVo.idx}">${productVo.name}</a></div>
                <div class="price-wrap">
                <c:if test="${not empty productVo.discountRate && productVo.discountRate > 0}">
                <span class="discount-rate">${productVo.discountRate}%</span>
                <span class="original-price">
                    <fmt:formatNumber value="${productVo.price}" pattern="#,###원 >"/>
                </span>
                </c:if>
                <span class="final-price">
                    <fmt:formatNumber value="${productVo.finalPrice}" pattern="#,###원"/>
                </span>
                </div>
            </div>
        </div>
        </c:if>
        </c:forEach>
    </div> <!-- .row 닫음 -->
</div>

<%@ include file="../main/b_footer.jspf"%>

</body>
</html>
