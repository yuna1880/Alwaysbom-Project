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
    <!-- 메뉴 영역 -->
    <div class="col-12 d-flex justify-content-between align-items-center p-3">
        <!-- 라디오 버튼(전체/사용/미사용) -->
        <div class="col-3 d-flex bg-info">
            <label class="col-4">
                <input type="radio" name="showType" class="d-none" checked="">
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
        <div class="col-3 d-flex align-items-center">
            <input type="text" class="rounded-3 border-1 p-3" aria-label="searchId" name="searchId" id="searchId">
            <button class="border-1 rounded-3 btn btn-secondary p-3 flex-grow-1 shadow-none">
                <i class="fa fa-search"></i>
            </button>
        </div>
    </div>

    <!-- 리스트 영역 -->
    <div class="col-12 p-3 bg-secondary d-flex flex-column">
        <!-- 리스트 헤더 -->
        <div class="col-12 d-flex text-center">
            <div class="col-2 p-2 border">쿠폰번호</div>
            <div class="col-2 p-2 border">유저</div>
            <div class="col-2 p-2 border">사용여부</div>
            <div class="col-2 p-2 border">발행일</div>
            <div class="col-2 p-2 border">포인트</div>
            <div class="col-2 p-2 border">기능</div>
        </div>

        <!-- 리스트 내용 -->
        <ul class="col-12 d-flex flex-column text-center list-unstyled m-0 p-0">
            <li class="col-12 d-flex">
                <div class="col-2 p-2 border">1</div>
                <div class="col-2 p-2 border">cothis</div>
                <div class="col-2 p-2 border">사용</div>
                <div class="col-2 p-2 border">2021-03-16</div>
                <div class="col-2 p-2 border">3,500</div>
                <div class="col-2 p-2 border d-flex justify-content-around">
                    <button>삭제</button>
                    <button>수정</button>
                </div>
            </li>
            <li class="col-12 d-flex">
                <div class="col-2 p-2 border">2</div>
                <div class="col-2 p-2 border">2damyoung</div>
                <div class="col-2 p-2 border">미사용</div>
                <div class="col-2 p-2 border">2021-03-15</div>
                <div class="col-2 p-2 border">2,500</div>
                <div class="col-2 p-2 border d-flex justify-content-around">
                    <button>삭제</button>
                    <button>수정</button>
                </div>
            </li>
        </ul>
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