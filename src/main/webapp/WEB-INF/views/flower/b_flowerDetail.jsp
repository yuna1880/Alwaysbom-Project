<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>꽃다발 상세페이지</title>
    <%@ include file="../main/b_import.jspf"%>
    <link rel="stylesheet" href="/static/css/item/b_detail.css">
</head>
<body>
<%@ include file="../main/b_header.jspf"%>
<div id="container" class="mx-auto">
<form action="/admin/flowerUpdateForm">

    <!-- 메뉴 이동 경로 -->
    <nav id="bread-nav" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb mb-8em">
            <li class="breadcrumb-item"><a href="/admin/main">관리자 홈</a></li>
            <li class="breadcrumb-item"><a href="/admin/flower">꽃다발 관리</a></li>
            <li class="breadcrumb-item"><a href="/admin/flowerList">상품 조회</a></li>
            <li class="breadcrumb-item active" aria-current="page">${flowerVo.name}</li>
        </ol>
    </nav>

    <div class="d-flex justify-content-between thumb-order">
        <!-- 사진 썸네일 -->
        <div class="thumbnails d-flex flex-column justify-content-start">
            <div class="mb-4">
                <img src="${flowerVo.image1}" alt="대표 썸네일" class="col-12">
            </div>
            <div class="d-flex">
                <img src="${flowerVo.image1}" alt="썸네일1" class="col-4 pe-3">
                <c:if test="${not empty flowerVo.image2}">
                    <img src="${flowerVo.image2}" alt="썸네일2" class="col-4 ps-2 pe-2">
                </c:if>
                <c:if test="${not empty flowerVo.image3}">
                    <img src="${flowerVo.image3}" alt="썸네일3" class="col-4 ps-3">
                </c:if>
            </div>
        </div>

        <!-- 주문 정보 -->
        <div class="order-info d-flex flex-column">
            <span class="subheader">${flowerVo.subheader}</span>
            <span class="item-name">${flowerVo.name}</span>

            <!-- 가격 정보 -->
            <div class="d-flex justify-content-start align-items-center">
                <c:if test="${not empty flowerVo.discountRate && flowerVo.discountRate > 0}">
                <span class="discount-rate text-danger pe-2">${flowerVo.discountRate}%</span>
                <span class="original-price text-decoration-line-through pe-2">
                    <fmt:formatNumber value="${flowerVo.price}" pattern="#,###원 >"/>
                </span>
                </c:if>
                <c:if test="${empty flowerVo.discountRate || flowerVo.discountRate <= 0}">
                <span class="discount-rate text-danger pe-2">할인율 0% </span>
                </c:if>
                <span class="fs-3 fw500" data-flower-finalPrice>
                    <fmt:formatNumber value="${flowerVo.finalPrice}" pattern="#,###원"/>
                </span>
            </div>
        </div> <!-- 주문 정보 닫기 -->
    </div> <!-- 상품 썸네일 & 주문 정보 닫기 -->

    <div id="detail-area" class="overflow-auto d-flex justify-content-center mb-5">
        <div class="w-auto">${flowerVo.content}</div>
    </div>


    <input type="submit" class="main-button" value="수정하기">
    <input type="hidden" value="${flowerVo.idx}" name="idx">
    <input type="button" class="main-button" value="삭제" onclick="goDelete(this.form)">



</form>
</div>

<%@ include file="../main/b_footer.jspf"%>

<script>
    function goDelete(frm) {
        // 정말 삭제하시겠냐 모달창 띄우고 예 누르면 삭제, 아니면 모달창 끄기
        frm.action="/admin/deleteFlower";
        frm.submit();
    }

</script>

</body>
</html>
