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
                <div class="form-floating mb-4">
                    <input type="text" name="category" class="form-control" id="category" placeholder="category">
                    <label for="category">Category</label>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" name="name" class="form-control" id="name" placeholder="name">
                    <label for="name">Name</label>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" name="subheader" class="form-control" id="subheader" placeholder="subheader">
                    <label for="subheader">Subheader</label>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" name="price" class="form-control" id="price" placeholder="price">
                    <label for="price">Price</label>
                </div>
                <div class="form-floating">
                    <input type="text" name="discountRate" class="form-control" id="discountRate"
                           placeholder="discountRate">
                    <label for="discountRate">Discount Rate</label>
                </div>
            </div>
            <!-- 파일 -->
            <div class="col-8 d-flex">
                <div class="card col-4">
                    <div class="card-header mb-3">
                        <input type="file" name="file1" class="form-control" id="file1" onchange="preview(this, 'img1')">
<%--                        <label class="input-group-text" for="file1">File 1</label>--%>
                    </div>
                    <img src="" alt="사진" class="card-img-bottom d-none" id="img1">
                </div>
                <div class="card col-4">
                    <div class="card-header mb-3">
                        <input type="file" name="file2" class="form-control" id="file2" onchange="preview(this, 'img2')">
<%--                        <label class="input-group-text" for="file2">File 2</label>--%>
                    </div>
                    <img src="" alt="사진" class="card-img-bottom d-none" id="img2">
                </div>
                <div class="card col-4">
                    <div class="card-header mb-3">
                        <input type="file" name="file3" class="form-control" id="file3" onchange="preview(this, 'img3')">
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
