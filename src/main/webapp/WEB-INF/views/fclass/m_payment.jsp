<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>플라워클래스 결제</title>
    <%@ include file="../main/import.jspf"%>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="d-flex flex-column align-items-center mx-auto bg-white p-2">

    <!-- 결제 단계 아이콘 -->
    <div class="rounded-circle h6 d-flex flex-column align-items-center justify-content-center"
         style="height: 130px; width: 130px; color: #6e6e6e; background-color: #e8e8e8">
        <span class="h5">1</span>
        <span class="fw-light">결제</span>
    </div>

    <!-- 상품 헤더 -->
    <div class="col-12 py-2 border-top border-2 border-dark d-flex text-center">
        <div class="col-3">수강일</div>
        <div class="col-6">클래스</div>
        <div class="col-3">수강료</div>
    </div>

    <!-- 상품 -->
    <div class="col-12 d-flex border-1 border-top" style="height: 170px">
        <!-- 수강일 -->
        <div class="col-3 d-flex align-items-center justify-content-center">
            <span>2021-03-31</span>
        </div>

        <!-- 클래스 내용 -->
        <div class="col-6 d-flex align-items-center">
            <div>
                <img src="/static/image/oitem/0_1.png" alt="이미지" style="width:160px; height:130px">
            </div>
            <div class="d-flex flex-column ps-2">
                <span>[ 1호점 ] 플로리스트_8주과정</span>
                <span>수강인원 : 3</span>
                <span>수강시간 : 10:00</span>
            </div>
        </div>

        <!-- 수강료 -->
        <div class="col-3 d-flex align-items-center justify-content-center">
            <span class="text-secondary">560,000</span>
        </div>
    </div>

    <!-- 적립금 -->
    <div class="col-12 py-4 d-flex align-items-center border-1 border-top border-bottom">
        <span class="fw-bold me-1">적립금</span>
        <input type="number" class="mx-1 ps-3 border border-secondary btn-outline-white rounded-3">
        <button type="button" class="btn btn-sm btn-warning mx-1">적용</button>
        <span class="mx-1">* 사용 가능 포인트: 1,000</span>
    </div>

    <!-- 결제 금액 -->
    <div class="col-12 py-4 ps-3 pe-2 d-flex flex-column border-1 border-bottom">
        <div class="d-flex justify-content-between py-2">
            <span>포인트할인</span>
            <span>-0 원</span>
        </div>
        <div class="d-flex justify-content-between py-2">
            <span>등급할인</span>
            <span>-0 원</span>
        </div>
        <div class="d-flex justify-content-between py-2 h4 text-warning m-0">
            <span>총 결제금액</span>
            <span>1,680,000 원</span>
        </div>
    </div>

    <!-- 결제 수단 -->
    <div class="col-12 py-4 d-flex flex-column border-1 border-bottom">
        <span>결제 수단 선택</span>
        <div class="d-flex">
            <label class="pay-button-group col-3">
                <input type="radio" name="pay-type" autocomplete="off" checked>
                <span>신용카드</span>
            </label>
            <label class="pay-button-group col-3">
                <input type="radio" name="pay-type" autocomplete="off">
                <span>신용카드(직접입력)</span>
            </label>
            <label class="pay-button-group col-3">
                <input type="radio" name="pay-type" autocomplete="off">
                <span>무통장입금</span>
            </label>
            <label class="pay-button-group col-3">
                <input type="radio" name="pay-type" autocomplete="off">
                <span>카카오페이</span>
            </label>
        </div>
        <div>내용</div>
    </div>

</div>
<%@ include file="../main/footer.jspf"%>
</body>
</html>
<style>
    .pay-button-group input[type="radio"] {
        display: none;
    }

    .pay-button-group input[type="radio"] + span {
        display: block;
        padding: 16px 0;
        background-color: white;
        border: 1px solid #dfdfdf;
        text-align: center;
        cursor: pointer;
    }

    .pay-button-group input[type="radio"]:checked + span {
        background-color: #3A3A3A;
        color: #FFFFFF;
    }

    .pay-button-group input[type="radio"] + span:hover {
        background-color: #5A5A5A;
        color: #FFFFFF;
    }
</style>