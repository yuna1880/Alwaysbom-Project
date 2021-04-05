<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>꽃다발 상품 조회</title>
    <%@ include file="../main/b_import.jspf"%>
    <link rel="stylesheet" href="../../../static/css/item/b_addForm.css">
    <link rel="stylesheet" href="../../../static/css/item/list.css">
</head>
<body>
<%@ include file="../main/b_header.jspf"%>
<div id="container" class="mx-auto">
<form>
    <!-- 브레드크럼 (유저 이동 경로) -->
    <nav id="bread-nav" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb mb-8em">
            <li class="breadcrumb-item" onclick="location.href='/admin/main'">관리자 홈</li>
            <li class="breadcrumb-item" onclick="location.href='/admin/flower'">꽃다발 관리</li>
            <li class="breadcrumb-item active" aria-current="page">상품 조회</li>
        </ol>
    </nav>

    <div class="row row-cols-4">
        <c:forEach var="flowerVo" items="${list}">
        <c:if test="${not empty flowerVo}">
        <div class="col mb-8em">
            <div class="position-relative d-flex flex-column justify-content-start align-items-end"
                 onmouseover="showBtn(this)" onmouseout="showBtn(this)">
                <button type="button" class="btn-close-style d-none" onclick="deleteItem(this.form)">DELETE</button>
                <input type="hidden" name="idx" value="${flowerVo.idx}">
                <div class="overflow-hidden">
                    <a href="/admin/flowerUpdateForm/${flowerVo.idx}">
                        <img src="${flowerVo.image1}" class="col-12" alt="꽃다발 썸네일">
                    </a>
                </div>
            </div>
            <div class="ps-1">
                <div class="subheader">${flowerVo.subheader}</div>
                <div class="item-name">
                    <a href="/admin/flowerUpdateForm/${flowerVo.idx}">${flowerVo.name}</a></div>
                <div>
                    <c:if test="${not empty flowerVo.discountRate && flowerVo.discountRate > 0}">
                    <span class="discount-rate">${flowerVo.discountRate}%</span>
                    <span class="original-price">${flowerVo.price}원 ></span>
                    </c:if>
                    <span class="final-price">${flowerVo.finalPrice}원</span>
                </div>
                <div class="size-delivery">
                    <span class="badge rounded-pill bg-warning size-unit">${flowerVo.fsize}</span>
                    <span class="item-size">size</span>
                    <c:if test="${flowerVo.freeDelivery > 0}">
                    <span class="badge rounded-pill bg-secondary delivery-unit">${flowerVo.freeDeliveryMessage}</span>
                    </c:if>
                </div>
            </div>
        </div>
        </c:if>
        </c:forEach>
    </div>
</form>
</div>
<%@ include file="../main/b_footer.jspf"%>
<script>
    function deleteItem(frm) {
        frm.action = "/admin/deleteFlower";
        frm.submit();
    }

    function showBtn(div) {
        div.firstElementChild.classList.toggle("d-none");
    }
</script>
</body>
</html>
