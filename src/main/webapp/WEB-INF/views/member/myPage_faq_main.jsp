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
            background-color: #f5b0cf;
        }
        .name-color {
            color: #d869db;
        }
        .bannerName-color {
            color: #f7ebf1;
        }
        a {
            text-decoration: none;
        }
        hr {
            color: white;
        }
        .list-group-item {
            border: none;
        }
        .btn-warning {
            width: 200px;
            height: 60px;
            color: #2c3034;
        }
    </style>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="mx-auto d-flex flex-column h-100 user-select-none">
    <div class="h-10 d-flex bg-pink bannerName-color p-3">
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
        <div class="col-10 d-flex justify-content-center px-5 pt-4">
        </div>
    </div>
    <div class="h-85 d-flex">
        <div class="col-2 border-warning d-flex flex-column p-4 ps-5">
            <ul class="d-flex flex-column list-unstyled fs-6 list-group m-0">
                <li>
                    <hr>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">주문 내역</a>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">정기 구독</a>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">수강 내역</a>
                </li>
                <li>
                    <hr>
                </li>
                <li class="list-group-item">
                    <a href="/community/goFaq" class="link-secondary">자주 묻는 질문</a>
                </li>
                <li class="list-group-item">
                    <a href="/myPage_faq_main" class="link-secondary">1:1 문의</a>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">상품 후기</a>
                </li>
                <li>
                    <hr>
                </li>
                <li class="list-group-item">
                    <a href="/member_grade" class="link-secondary">회원 등급</a>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">포인트</a>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">회원 정보 관리</a>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">회원 탈퇴</a>
                </li>
            </ul>
        </div>
        <div class="col-10 border-info d-flex justify-content-center p-4">
            <div class="col-12">
                <div class="h5 col-12 d-flex flex-column text-secondary">
                    <div class="d-flex">
                        <span class="fw-bold name-color">${sessionScope.member.name}</span>
                        <span>님의 문의 내역입니다.</span>
                        <hr>
                    </div>
                    <span>- 1:1 문의 게시판 운영 시간 : 월 ~ 금 10:00 ~18:00</span>
                    <span>- 운영 시간 내에는 2시간 이내에 답변을 드리나, 문의가 많을 때는 다소 지연될 수 있습니다.</span>
                </div>
                <div class="btn">
                    <button type="button" class="btn btn-warning" onclick="location.href='/community/goFaq'">자주 묻는 질문</button>
                    <button type="button" class="btn btn-warning" onclick="location.href='/question/create'">1:1 문의하기</button>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">작성일</th>
                        <th scope="col">제목</th>
                        <th scope="col">상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>2021.03.29</td>
                        <td>안녕하세요^^</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>2021.03.29</td>
                        <td>궁금합니다.</td>
                        <td>확인중</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>2021.03.30</td>
                        <td>주문 수정 문의합니다.</td>
                        <td>확인중</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<%@ include file="../main/footer.jspf" %>
</body>
</html>
