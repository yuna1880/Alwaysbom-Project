<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>꽃다발 상품 등록</title>
    <%@ include file="../main/b_import.jspf"%>
    <link rel="stylesheet" href="../static/css/b_insert.css">
</head>
<body>
    <%@ include file="../main/b_header.jspf"%>
    <div class="d-flex justify-content-center">
        <div id="container">
            <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/admin/main">관리자 홈</a></li>
                    <li class="breadcrumb-item"><a href="/admin/flower">꽃다발 관리</a></li>
                    <li class="breadcrumb-item active" aria-current="page">상품 등록</li>
                </ol>
            </nav>

            <div class="insert-subtitle">
                1. 상품 이미지 등록
            </div>



            <div class="insert-subtitle">
                2. 주요 정보
            </div>

            <div class="insert-subtitle">
                3. 상품 상세페이지 등록
            </div>


        </div>
    </div>

    <%@ include file="../main/b_footer.jspf"%>
</body>
</html>
