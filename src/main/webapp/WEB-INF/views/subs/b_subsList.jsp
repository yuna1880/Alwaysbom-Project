<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>정기구독 상품 조회</title>
    <%@ include file="../main/b_import.jspf"%>
    <link rel="stylesheet" href="/static/css/item/b_addForm.css">
    <link rel="stylesheet" href="/static/css/item/list.css">
</head>
<body>
<%@ include file="../main/b_header.jspf"%>
<div id="container" class="mx-auto">
    <nav id="bread-nav" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb mb-8em">
            <li class="breadcrumb-item"><a href="/admin/main">관리자 홈</a></li>
            <li class="breadcrumb-item"><a href="/admin/subs">꽃다발 관리</a></li>
            <li class="breadcrumb-item active" aria-current="page">상품 조회/수정/삭제</li>
        </ol>
    </nav>

    <!-- 정기구독 상품 4개 리스트 -->
    <c:forEach var="subsVo" items="${subsList}" varStatus="status">

    <c:if test="${empty subsVo}">
        <h3>등록된 정기구독 상품이 없습니다. 상품을 등록해주세요.</h3>
    </c:if>
    <c:if test="${not empty subsVo}">

        <c:if test="${status.index == 0 || status.index == 2}">
            <div class="row my-5">
                <div class="col-5">
                    <a href="#">
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
                    <a href="#">
                        <img src="${subsVo.image1}" alt="꽃 구독M" class="w-100"/>
                    </a>
                </div>
            </div>
            <hr>
        </c:if>
    </c:if>
    </c:forEach>
</div>

<%@ include file="../main/b_footer.jspf"%>

</body>
</html>
