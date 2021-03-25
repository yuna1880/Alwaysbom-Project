<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>클래스 추가</title>
    <%@ include file="../main/import.jspf"%>
</head>
<body>
    <%@ include file="../main/header.jspf"%>
    <form id="container" class="mx-auto p-5" action="/admin/fclass/addClass" method="post" enctype="multipart/form-data">
        <div class="h5 text-secondary mb-4">클래스 추가</div>
        <div class="d-flex mb-4">
            <div class="col-4 pe-5 d-flex flex-column justify-content-between">
                <%--<div class="form-floating mb-4">
                    <input type="text" name="category" class="form-control" id="category" placeholder="category">
                    <label for="category">Category</label>
                </div>--%>

                <div class="btn-group mb-4" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" name="category" value="원데이클래스" id="btnradio1" autocomplete="off" checked>
                    <label class="btn btn-outline-primary" for="btnradio1">원데이클래스</label>
                    <input type="radio" class="btn-check" name="category" value="플로리스트" id="btnradio2" autocomplete="off">
                    <label class="btn btn-outline-primary" for="btnradio2">플로리스트</label>
                </div>


                <div class="form-floating mb-4">
                    <input type="text" name="name" class="form-control" id="name" placeholder="name">
                    <label for="name">클래스명</label>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" name="subheader" class="form-control" id="subheader" placeholder="subheader">
                    <label for="subheader">부가설명</label>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" name="price" class="form-control" id="price" placeholder="price">
                    <label for="price">클래스 가격</label>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" name="discountRate" class="form-control" id="discountRate"
                           placeholder="discountRate">
                    <label for="discountRate">할인율</label>
                </div>
                <div class="form-floating">
                    <input type="text" name="count" class="form-control" id="count"
                           placeholder="count">
                    <label for="count">클래스 횟수</label>
                </div>
            </div>
            <!-- 파일 -->
            <div class="col-8 d-flex">
                <div class="card col-4">
                    <div class="card-header mb-3">
                        <input type="file" name="file" class="form-control" id="file1" onchange="preview(this, 'img1')">
<%--                        <label class="input-group-text" for="file1">File 1</label>--%>
                    </div>
                    <img src="" alt="사진" class="card-img-bottom d-none" id="img1">
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
        </div>

        <div class="col-12 mb-4">
            <label class="form-label" for="content">내용</label>
            <textarea class="form-control" name="content" id="content"></textarea>
        </div>

        <div class="col-12 mb-4 text-center">
            <button type="button" class="btn btn-danger btn-lg col-4" onclick="history.back()">취소</button>
            <button type="submit" class="btn btn-info btn-lg col-4">추가</button>
        </div>
    </form>


    <%@ include file="../main/footer.jspf"%>
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
</body>
</html>
