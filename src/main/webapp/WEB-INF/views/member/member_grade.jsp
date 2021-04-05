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
            font-size: 15px;
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
    <%@ include file="../member/mypage_header.jspf" %>
    <div class="d-flex h-5">
        <div class="col-2"></div>
        <div class="col-10 d-flex justify-content-center px-5 pt-4">
        </div>
    </div>
    <div class="h-85 d-flex">
        <%@ include file="../member/mypage_menu.jspf" %>
        <div class="col-10 border-info d-flex justify-content-center p-4">
            <div class="col-12">
                <div class="h5 col-12 d-flex flex-column text-secondary">
                    <div class="d-flex">
                        <span class="fw-bold name-color">${sessionScope.member.name}</span>
                        <span>님의 회원등급</span>
                        <hr>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../main/footer.jspf" %>
</body>
</html>
