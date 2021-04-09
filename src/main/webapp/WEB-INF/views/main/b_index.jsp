<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>백 오피스 메인</title>
    <%@ include file="b_import.jspf"%>
    <style>
        .square-2x1 {
            position: relative;
        }

        .square-2x1::after {
            content: "";
            display: block;
            padding-bottom: 50%;
        }

        .square-2x1 > .inner {
            position: absolute;
            width: 100%;
            height: 100%;
        }

        .inner > img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
</head>
<body>
<%@ include file="b_header.jspf" %>
<div id="container" class="mx-auto bg-warning d-flex flex-column">
    <div>
        <h2 class="m-0 p-0">메인 페이지 관리</h2>
    </div>
    <form enctype="multipart/form-data" class="d-flex flex-column">
        <div class="d-flex">
            <div class="col-2 p-3">메인 이미지 등록</div>
            <ul class="col-10 list-unstyled m-0 p-0 d-flex flex-wrap">
                <c:forEach var="index" begin="0" end="5" varStatus="status">
                <li class="col-6 p-3">
                    <div class="square-2x1 d-flex">
                        <div class="inner">
                            <img class="inner-img" alt="..." src="/static/image/homeimg.jpg">
                        </div>
                    </div>
                </li>
                </c:forEach>
            </ul>
        </div>
        <div class="d-flex">
            <div class="col-2 p-3">
                <div>플라워 클래스</div>
            </div>
            <div class="col-10 p-3 d-flex">
                <div class="d-flex flex-column">
                    <label for="thumb_bg">썸네일 대형</label>
                    <select class="form-select" id="thumb_bg">
                        <option selected disabled>썸네일 대형</option>
                    </select>
                </div>
                <div class="d-flex flex-column">
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
<%@ include file="b_footer.jspf"%>

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
