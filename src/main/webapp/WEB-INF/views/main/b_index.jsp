<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>타이틀임다</title>
    <%@ include file="import.jspf"%>
    <style>
        #container {
            width: 1280px;
            display: flex;
            margin: 0 auto;
            flex-direction: column;
            align-items: flex-start;
            color: #404040;
        }

        .form {
            width: 100%;
        }

        .form-row {
            margin: 0;
            border: none;
            border-top: 1px solid black;
            display: flex;
            width: 100%;
            font-size: 11pt;
        }

        .form-row:last-child {
            border-bottom: 1px solid black;
        }

        .form-row .form-header {
            flex-basis: 15%;
            background-color: #DDDDDD;
            padding: 10px;

        }

        .form-row .form-content {
            flex-basis: 85%;
            padding: 10px;

        }

        .image-ul {
            list-style: none;
            display: flex;
            flex-wrap: wrap;
            margin: 0;
            padding: 0;
        }

        .image-ul-item {
            flex-basis: 33.33%;
            padding: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .right-top-buttons {
            position: absolute;
            right: 10px;
            top: 10px;
            color: #aaaaaa;
        }

        .b6 {
            color: #bbbbbb;
        }

        .my-box {
            width: 100%;
            height: 100px;
        }

        .my-icon {
            font-size: 24pt;
        }

        .p-10px {
            padding: 0 10px;
        }

        .btn {
            color: #888888;
        }

    </style>
</head>
<body>
<%@ include file="header.jspf" %>
<div id="container">
    <h2>메인 페이지 관리</h2>
    <form enctype="multipart/form-data" class="form d-flex flex-column align-items-center">
        <div class="form-row">
            <div class="form-header">
                <div>메인 이미지 등록</div>
            </div>
            <div class="form-content">
                <ul class="image-ul">
                    <c:forEach var="index" begin="0" end="5" varStatus="status">
                    <li class="image-ul-item">
                        <div class="btn btn-outline-secondary my-box">
                            <%--<div class="${empty images ? "d-none" : ""} exist w-100 h-100 position-relative">
                                <img src="" alt="사진" width="100%" height="100%">
                                <div class="right-top-buttons">
                                    <button type="button" class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#myModal" onclick="loadData(${})">연결페이지</button>
                                    <input type="hidden" name="link">
                                    <button type="button" class="btn btn-light btn-sm" onclick="deleteImage(${status.index + 1})">삭제</button>
                                </div>
                            </div>
                            <div class="${empty images ? "" : "d-none"} empty w-100 h-100 d-flex flex-column align-items-center justify-content-center"
                                 onclick="this.children.file.click()">
                                <i class="fa fa-plus my-icon"></i>
                                <span>이미지 추가</span>
                                <input type="file" class="d-none" name="file" onchange="changeImage(this, ${status.index + 1})">
                            </div>--%>
                        </div>
                        <span class="b6">${status.count}</span>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="form-row">
            <div class="form-header">
                <div>꽃다발 상품 썸네일</div>
                <div>정렬 기준</div>
            </div>
            <div class="form-content d-flex align-items-center">
                <div class="p-10px">
                    <input class="form-check-input" type="radio" name="orderStandard" id="r1" checked>
                    <label class="form-check-label" for="r1">
                        누적 판매량이 높은 순
                    </label>
                </div>
                <div class="p-10px">
                    <input class="form-check-input" type="radio" name="orderStandard" id="r2">
                    <label class="form-check-label" for="r2">
                        최근 한 달간 판매량이 높은 순
                    </label>
                </div>
                <div class="p-10px">
                    <input class="form-check-input" type="radio" name="orderStandard" id="r3">
                    <label class="form-check-label" for="r3">
                        최신 등록 순
                    </label>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-header">
                <div>플라워 클래스</div>
                <div>수업 선택</div>
            </div>
            <div class="form-content d-flex align-items-center">
                <div class="d-flex flex-column col-md-3 me-3 p-10px">
                    <label for="thumb_bg">썸네일 대형</label>
                    <select class="form-select" id="thumb_bg">
                        <option selected disabled>썸네일 대형</option>
                    </select>
                </div>
                <div class="d-flex flex-column col-md-3 p-10px">
                    <label for="thumb_sm">썸네일 소형</label>
                    <select class="form-select" id="thumb_sm">
                        <option selected disabled>썸네일 소형</option>
                    </select>
                </div>
            </div>
        </div>
        <button type="button" class="btn btn-secondary gap-2 col-4 mt-3 align-self-center text-white">변경사항 저장</button>
    </form>
</div>

<div class="modal fade" id="myModal" data-bs-backdrop="static"
     data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">해당 이미지 클릭시 이동할 메뉴 페이지 지정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="link" id="ra1" value="/subs/" checked>
                    <label class="form-check-label" for="ra1">꽃 정기구독</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="link" id="ra2" value="/flower/">
                    <label class="form-check-label" for="ra2">꽃다발</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="link" id="ra3" value="/">
                    <label class="form-check-label" for="ra3">main</label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary text-white" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary text-white" data-bs-dismiss="modal">Understood</button>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jspf"%>

<script>
    function deleteImage(current) {
        let box = document.querySelector(".image-ul-item:nth-child(" + current + ") .my-box");
        let file = box.querySelector("input[type='file']");
        file.value = "";

        let img = box.querySelector("img");
        img.removeAttribute("src");

        let exist = box.querySelector(".exist");
        exist.classList.add("d-none");

        let empty = box.querySelector(".empty");
        empty.classList.remove("d-none");

        box.classList.add("btn");
        box.classList.add("btn-outline-secondary");

    }

    function changeImage(file, current) {
        let fileReader = new FileReader();
        let box = document.querySelector(".image-ul-item:nth-child(" + current + ") .my-box");
        console.log(box);


        fileReader.onload = function (e) {
            let img = box.querySelector("img");
            img.setAttribute("src", e.target.result.toString());

            let exist = box.querySelector(".exist");
            exist.classList.remove("d-none");

            let empty = box.querySelector(".empty");
            empty.classList.add("d-none");

            box.classList.remove("btn");
            box.classList.remove("btn-outline-secondary");
        }

        fileReader.readAsDataURL(file.files[0])
        console.log(current);
    }
</script>
</body>
</html>
