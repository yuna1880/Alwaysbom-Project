<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>꽃다발 관리 인덱스</title>
    <%@ include file="../main/b_import.jspf"%>
    <link rel="stylesheet" href="../static/css/b_management.css">
</head>
<body>
    <%@ include file="../main/b_header.jspf"%>
    <div id="container" class="mx-auto p-3">
        <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb mb-xxl-5">
                <li class="breadcrumb-item"><a href="/admin/main">관리자 홈</a></li>
                <li class="breadcrumb-item active" aria-current="page">꽃다발 관리</li>
            </ol>
        </nav>
        <div class="d-flex justify-content-center">
            <div class="btn-circle d-flex justify-content-center align-items-center">
                배너 등록/수정
            </div>
            <div class="btn-circle d-flex justify-content-center align-items-center"
            onclick="location.href='/admin/flower_insert'">
                상품 등록
            </div>
            <div class="btn-circle d-flex justify-content-center align-items-center">
                상품 조회/수정/삭제
            </div>
        </div>
        <div class="d-flex justify-content-center">
        </div>
        <div class="d-flex justify-content-center">
        </div>



    </div>

    <%@ include file="../main/b_footer.jspf"%>
</body>
</html>
