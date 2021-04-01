<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>새늘봄 / 쿠폰</title>
    <%@ include file="../main/b_import.jspf"%>
</head>
<body>
<%@ include file="../main/b_header.jspf"%>
<div id="container" class="d-flex flex-column align-items-center mx-auto">
    <!-- 메뉴 영역 -->
    <div class="col-12 d-flex justify-content-between p-3 bg-warning">
        <!-- 라디오 버튼(전체/사용/미사용) -->
        <div class="col-3 d-flex bg-info">
            <label class="col-4">
                <input type="radio" name="showType" class="d-none">
                <span class="d-block text-center p-3 btn-show">전체</span>
            </label>
            <label class="col-4">
                <input type="radio" name="showType" class="d-none">
                <span class="d-block text-center p-3 btn-show">사용</span>
            </label>
            <label class="col-4">
                <input type="radio" name="showType" class="d-none">
                <span class="d-block text-center p-3 btn-show">미사용</span>
            </label>
        </div>

        <!-- 아이디 검색 -->
        <div class="col-3 d-flex">

        </div>
    </div>

    <!-- 리스트 영역 -->
    <div class="col-12 p-3 bg-danger">
        <!-- 리스트 헤더 -->

        <!-- 리스트 내용 -->
    </div>

    <!-- 버튼 영역 -->
    <div class="col-12 p-3 bg-info d-flex justify-content-end">
        <button class="col-2 p-3 btn btn-primary">추가</button>
    </div>
</div>
<%@ include file="../main/b_footer.jspf"%>
</body>
</html>
<style>
    .btn-show {
        background-color: #bbbbbb;
        color: #030303;
        border: 1px solid rgba(0,0,0,0.25);
        cursor: pointer;
    }

    .btn-show:hover {
        background-color: #5A5A5A;
        color: #FFFFFF;
    }

    input[type=radio]:checked + .btn-show {
        background-color: #3a3a3a;
        color: #FFFFFF;
    }
</style>