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
        <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb fs-6 mb-xxl-5">
                <li class="breadcrumb-item"><a href="/admin/main">관리자 홈</a></li>
                <li class="breadcrumb-item"><a href="/admin/flower">꽃다발 관리</a></li>
                <li class="breadcrumb-item active" aria-current="page">상품 등록</li>
            </ol>
        </nav>

        <subtitle class="fs-5 p-1 mb-3 mt-5 d-block">
            1. 상품 이미지 등록
        </subtitle>
        <imgs>
            <li class="card overflow-hidden img-card" onclick="this.children.file.click()">
                <a href="#"
                   class="w-100 h-100 btn btn-outline-dark d-flex align-items-center justify-content-center">
                    <i class="fa fa-plus h1"></i>
                </a>
                <input type="file" name="file" class="d-none" id="file1" onchange="preview(this, 'img1')">
                <img src="" alt="사진" class="m-0 p-0 card-img-overlay d-none" id="img1">
            </li>

        </imgs>
jjj



        <!-- 파일 -->
        <div class="col-8 d-flex">
            <div class="card col-4">
                <div class="card-header mb-3">
                    <input type="file" name="file" class="form-control" id="file1" onchange="preview(this, 'img1')">
                    <%--                        <label class="input-group-text" for="file1">File 1</label>--%>
                </div>
                <img src="" alt="사진" class="card-img-bottom d-none" id="img12">
            </div>
            <div class="card col-4">
                <div class="card-header mb-3">
                    <input type="file" name="file" class="form-control" id="file2" onchange="preview(this, 'img2')">
                    <%--                        <label class="input-group-text" for="file2">File 2</label>--%>
                </div>
                <img src="" alt="사진" class="card-img-bottom d-none" id="img2">
            </div>
            <div class="card col-4">
                <div class="card-header mb-3">
                    <input type="file" name="file" class="form-control" id="file3" onchange="preview(this, 'img3')">
                    <%--                        <label class="input-group-text" for="file3">File 3</label>--%>
                </div>
                <img src="" alt="사진" class="card-img-bottom d-none" id="img3">
            </div>
        </div>





        <subtitle class="fs-5 p-1 mb-3 mt-5 d-block">2. 주요 정보</subtitle>

        <subtitle class="fs-4 p-1 mb-3 mt-5 d-block">3. 상품 상세페이지 등록</subtitle>


    </div>

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
