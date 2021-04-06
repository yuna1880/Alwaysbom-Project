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
            <li class="breadcrumb-item"><a href="/admin/subs">정기구독 관리</a></li>
            <li class="breadcrumb-item active" aria-current="page">정기구독 상품 조회/수정/삭제</li>
        </ol>
    </nav>
    <div class="subs_list justify-content-center">
        <!-- 정기구독 상품 4개 리스트 -->
        <c:forEach var="subsVo" items="${subsList}" varStatus="status">

            <c:if test="${empty subsVo}">
                <h3>판매중인 정기구독 상품이 없습니다.</h3>
            </c:if>

            <c:if test="${not empty subsVo}">

                <c:if test="${status.index == 0 || status.index == 2}">
                    <div class="row my-5 align-middle">
                        <div class="col-6">
                            <!-- 이미지 클릭시, 백오피스 상품 상세페이지로 이동 -->
                            <a href="/admin/subs/${subsVo.idx}">
                                <img src="${subsVo.image1}" alt="${subsVo.name}" class="w-100" height="580px"/>
                            </a>
                        </div>
                        <div class="col-6" id="subs_infos">
                            <h4 class="fw-normal text-secondary">${subsVo.subheader}</h4>
                            <h2 class="py-2">${subsVo.name}</h2>
                            <h2 class="py-3">${subsVo.price} ~</h2>
                            <div class="w-95">
                                <h5 class="py-3 fw-lighter lh-lg">${subsVo.content}</h5>
                            </div>
                            <h5 class="py-3"><span class="badge rounded-pill bg-light text-dark">무료배송</span></h5>
                        </div>
                    </div>
                    <hr>
                </c:if>
                <c:if test="${status.index == 1 || status.index == 3}">
                    <div class="row my-5 text-end">
                        <div class="col-6" id="subs_infos2">
                            <h4 class="fw-normal text-secondary">${subsVo.subheader}</h4>
                            <h2 class="py-2">${subsVo.name}</h2>
                            <h2 class="py-3">${subsVo.price} ~</h2>
                            <div class="w-110">
                                <h5 class="py-3 fw-lighter lh-lg">${subsVo.content}</h5>
                            </div>
                            <h5 class="py-3"><span class="badge rounded-pill bg-light text-dark">무료배송</span></h5>
                        </div>
                        <div class="col-6">
                            <a href="/subs/${subsVo.idx}">
                                <img src="${subsVo.image1}" alt="${subsVo.name}" class="w-100" height="580px"/>
                            </a>
                        </div>
                    </div>
                    <hr>
                </c:if>
            </c:if>
        </c:forEach>
    </div>
</div>

<%@ include file="../main/b_footer.jspf"%>

</body>
</html>
