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
    <div id="container" class="mx-auto p-3">
        <nav id="bread-nav" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb mb-xxl-5">
                <li class="breadcrumb-item"><a href="/admin/main">관리자 홈</a></li>
                <li class="breadcrumb-item"><a href="/admin/flower">꽃다발 관리</a></li>
                <li class="breadcrumb-item active" aria-current="page">상품 등록</li>
            </ol>
        </nav>

        <form method="post">
            <div class="fs-5 p-1 mb-3 mt-5 d-block border-bottom border-secondary">
                1. 상품 이미지 등록
                <span class="description">
                    * 상품 사진은 가능하다면 고화질의 정방형 이미지로 올려주십시오.
                </span>
            </div>
            <div class="imgs d-flex justify-content-center">
                <li class="card overflow-hidden img-card" onclick="this.children.file.click()">
                    <a href="#" class="w-100 h-100 btn btn-outline-dark
                                       d-flex flex-column align-items-center justify-content-center">
                        <i class="fa fa-plus h1"></i>
                        <div>대표 이미지(필수)</div>
                    </a>
                    <input type="file" name="file" class="d-none" id="file1" onchange="preview(this, 'img1')">
                    <img src="" alt="사진" class="m-0 p-0 card-img-overlay d-none" id="img1">
                </li>
                <li class="card overflow-hidden img-card" onclick="this.children.file.click()">
                    <a href="#" class="w-100 h-100 btn btn-outline-dark
                                       d-flex flex-column align-items-center justify-content-center">
                        <i class="fa fa-plus h1"></i>
                        <div>서브 이미지(선택)</div>
                    </a>
                    <input type="file" name="file" class="d-none" id="file2" onchange="preview(this, 'img2')">
                    <img src="" alt="사진" class="m-0 p-0 card-img-overlay d-none" id="img2">
                </li>
                <li class="card overflow-hidden img-card" onclick="this.children.file.click()">
                    <a href="#" class="w-100 h-100 btn btn-outline-dark
                                       d-flex flex-column align-items-center justify-content-center">
                        <i class="fa fa-plus h1"></i>
                        <div>서브 이미지(선택)</div>
                    </a>
                    <input type="file" name="file" class="d-none" id="file3" onchange="preview(this, 'img3')">
                    <img src="" alt="사진" class="m-0 p-0 card-img-overlay d-none" id="img3">
                </li>
            </div>

            <div class="fs-5 p-1 mb-3 mt-5 d-block border-bottom border-secondary">
                2. 주요 정보
            </div>

            <div class="fs-5 p-1 mb-3 mt-5 d-block border-bottom border-secondary">
                3. 상품 상세페이지 등록
            </div>

            <div class="d-flex justify-content-center my-lg-5">
                <input type="button" value="등록하기" class="btn btn-lg btn-dark py-lg-3 px-lg-5" onclick="insert(this.form)">
                <input type="button" value="이전으로" class="btn btn-lg btn-secondary py-lg-3 px-lg-5 ms-3" onclick="history.back()">
            </div>
        </form>
    </div>  <!-- container 닫기 -->

    <%@ include file="../main/b_footer.jspf"%>
</body>
<script>
    function preview(file, id) {
        let img = document.querySelector("#" + id);

        let reader = new FileReader();
        reader.onload = function(e) {
            img.setAttribute("src", e.target.result.toString());
            img.classList.remove("d-none");
        }
        reader.readAsDataURL(file.files[0]);
    }


</script>
</html>
