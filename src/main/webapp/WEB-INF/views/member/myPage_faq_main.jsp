<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>1:1문의</title>
    <%@ include file="../main/import.jspf" %>
    <style>
        .h-5 {
            height: 5% !important;
        }

        .h-10 {
            height: 10% !important;
        }

        .h-85 {
            height: 85% !important;
        }

        .bg-pink {
            background-color: #f56c62;
        }
    </style>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="mx-auto d-flex flex-column h-100 user-select-none">
    <div class="h-10 d-flex bg-pink text-white p-3">
        <div class="col-4 d-flex flex-column justify-content-center align-items-center position-relative p-2">
            <span class="position-absolute top-0 align-self-baseline">회원 등급</span>
            <span class="h4">WHITE</span>
        </div>
        <div class="col-4 d-flex flex-column justify-content-center align-items-center position-relative p-2
                    border-secondary border border-bottom-0 border-top-0">
            <span class="position-absolute top-0 align-self-baseline">포인트</span>
            <span class="h4">1000</span>
        </div>
        <div class="col-4 d-flex flex-column justify-content-center align-items-center position-relative p-2">
            <span class="position-absolute top-0 align-self-baseline">보유 쿠폰</span>
            <span class="h4">0장</span>
        </div>
    </div>
    <div class="d-flex h-5">
        <div class="col-2"></div>
        <div class="col-10 d-flex justify-content-center px-3 pt-4">
            <span class="h3 col-11 d-flex justify-content-start text-secondary">
                <span class="name">이다솜</span>
                님의 문의 내역입니다.<br>
                - 1:1 문의 게시판 운영 시간 : 월 ~ 금 10:00 ~18:00 <br>
                - 운영 시간 내에는 2시간 이내에 답변을 드리나, 문의가 많을 때는 다소 지연될 수 있습니다.
            </span>
            <div class="col-1"></div>

        </div>
    </div>
    <div class="h-85 d-flex">
        <div class="col-2 border-warning d-flex flex-column p-4 ps-5">
            <ul class="d-flex flex-column list-unstyled fs-6 list-group m-0">
                <li class="list-group-item list-group-item-white">
                    <a href="" class="link-secondary">주문 내역</a>
                </li>
                <li class="list-group-item list-group-item-white">
                    <a href="" class="link-secondary">정기 구독</a>
                </li>
                <li class="list-group-item list-group-item-white">
                    <a href="" class="link-secondary">수강 내역</a>
                </li>
                <li>
                    <hr>
                </li>
                <li class="list-group-item list-group-item-white">
                    <a href="/community/goFaq" class="link-secondary">자주 묻는 질문</a>
                </li>
                <li class="list-group-item list-group-item-white">
                    <a href="/question/create" class="link-secondary">1:1 문의</a>
                </li>
                <li class="list-group-item list-group-item-white">
                    <a href="" class="link-secondary">상품 후기</a>
                </li>
                <li>
                    <hr>
                </li>
                <li class="list-group-item list-group-item-white">
                    <a href="" class="link-secondary">회원 등급</a>
                </li>
                <li class="list-group-item list-group-item-white">
                    <a href="" class="link-secondary">포인트</a>
                </li>
                <li class="list-group-item list-group-item-white">
                    <a href="" class="link-secondary">회원 정보 관리</a>
                </li>
                <li class="list-group-item list-group-item-white">
                    <a href="" class="link-secondary">회원 탈퇴</a>
                </li>
            </ul>
        </div>
        <div class="col-10 border-info d-flex justify-content-center p-4">
            <div class="col-12">
                <img src="/static/image/mypageMain_flower.jpg" alt="메인페이지 꽃 사진" class="w-100">
            </div>
        </div>
    </div>
</div>
<%@ include file="../main/footer.jspf" %>
</body>
</html>
