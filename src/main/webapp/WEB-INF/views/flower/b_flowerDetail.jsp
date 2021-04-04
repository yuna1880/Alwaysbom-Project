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

    <h1>꽃다발 상세페이지 백오피스</h1>
    <div>${flowerVo.subheader}</div>
    <div>${flowerVo.name}</div>
    <div>${flowerVo.price}</div>
    <div>${flowerVo.discountRate}</div>
    <div>${flowerVo.content}</div>

    <input type="submit" value="수정하기">
    <input type="hidden" value="${flowerVo.idx}" name="idx">
    <input type="button" value="삭제" onclick="goDelete(this.form)">



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
