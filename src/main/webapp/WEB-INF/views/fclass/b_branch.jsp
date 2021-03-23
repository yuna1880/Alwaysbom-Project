<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Managing branch</title>
    <link rel="stylesheet" href="/static/bootstrap-5.0.0/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"></script>
    <script src="/static/bootstrap-5.0.0/js/bootstrap.bundle.min.js"></script>
    <style>
        #container {
            width: 1280px;
            margin: 0 auto;
        }

        .branchList-wrap {
            flex : auto;
            flex-direction: row;
            flex-wrap: wrap;
            display: flex;
            justify-content: center;
            width: 1280px;
            border: 1px solid black;
        }

        .file-wrap {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .btn-secondary, .btn-outline-danger {
            margin: 15px 0;
        }
        .imageBox {
            margin-bottom: 5px;
        }
        a {
            color: white;
            text-decoration: none;
        }
        .btn-dark:hover {
            color: white;
            background-color: gray;
            text-decoration: none;

        }
        .invisible {
            display: none;
        }


    </style>
</head>
<body>
<div id="container">
    <button type="button" class="btn btn-dark"><a href="/admin/fclass/classList">이전페이지</a></button>
    <h2>지점 리스트</h2>
    <%--<c:forEach var="branch" items="${list}">
    <form enctype="multipart/form-data">
        <div class="list-wrap">
            <input type="text" name="name"  value="${branch.name}"/><br>
            <input type="text" name="color" value="${branch.color}"><br>
            <input type="text" name="addr" value="${branch.addr}"><br>
            <img src="/static/upload/fclass/branch/${branch.mapImage}" width="300px">
            <input type="hidden" name="mapImage" value="${branch.mapImage}">
            <br>지도선택<br>
            <input type="file" name="file" class="bmap"/><br>
            <button type="button" onclick="goUpdate(this.form, ${branch.idx})">수정</button>
            <button type="button" onclick="goDelete(${branch.idx})">삭제</button>
        </div>
    </form>
    </c:forEach>--%>
    <div class="branchList-wrap">
        <c:forEach var="branch" items="${list}">
            <form enctype="multipart/form-data">
                <div class="card" style="width: 25rem; height: 39rem;">
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="formGroupExampleInput" class="form-label">지점명</label>
                            <input type="text" name="name" value="${branch.name}" class="form-control"
                                   id="formGroupExampleInput" placeholder="Example input placeholder">
                        </div>
                        <div class="mb-3">
                            <label for="formGroupExampleInput2" class="form-label">지점컬러</label>
                            <input type="text" name="color" value="${branch.color}" class="form-control"
                                   id="formGroupExampleInput2" placeholder="Another input placeholder">
                        </div>
                        <div class="mb-3">
                            <label for="formGroupExampleInput3" class="form-label">지점위치</label>
                            <input type="text" name="addr" value="${branch.addr}" class="form-control"
                                   id="formGroupExampleInput3" placeholder="Another input placeholder">
                        </div>
                    </div>
                    <div class="file-wrap">
                        <img src="/static/upload/fclass/branch/${branch.mapImage}" width="300px" class="imageBox">
                        <input type="hidden" name="mapImage" value="${branch.mapImage}">
                        <input type="file" name="file" class="bmap" onchange="preview(this)"/>
                        <div>
                            <button type="button" class="btn btn-secondary"
                                    onclick="goUpdate(this.form, ${branch.idx})">수정
                            </button>
                            <button type="button" class="btn btn-outline-danger"
                                    onclick="goDelete(this.form, ${branch.idx})">삭제
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </c:forEach>
    </div>

    <form enctype="multipart/form-data">
        <h2>지점추가</h2>
        <div class="card branchList-wrap" style="width: 25rem; height: 39rem;">
            <div class="card-body">
                <div class="mb-3">
                    <label for="formGroupExampleInput" class="form-label">지점명</label>
                    <input type="text" name="name"  class="form-control"
                           class="formGroupExampleInput" placeholder="추가할 지점명을 입력하세요">
                </div>
                <div class="mb-3">
                    <label for="formGroupExampleInput" class="form-label">지점컬러</label>
                    <input type="text" name="color"  class="form-control"
                           class="formGroupExampleInput" placeholder="지점컬러">
                </div>
                <div class="mb-3">
                    <label for="formGroupExampleInput" class="form-label">지점위치</label>
                    <input type="text" name="addr"  class="form-control"
                           class="formGroupExampleInput" placeholder="추가할 지점주소를 입력하세요">
                </div>
                <div class="file-wrap">
                    <img src="/static/upload/fclass/branch/${branch.mapImage}" width="300px" height="225px" class="imageBox">
                    <input type="file" name="file" class="bmap" onchange="preview(this)"/>
                    <button type="button" class="btn btn-secondary" onclick="branchUpload(this.form)">추가합니다</button>
                </div>
            </div>

<%--
        <input type="text" name="name" class="bname" value="지점명"/><br>
        <input type="text" name="color" value="#eeeeee"><br>
        <input type="text" name="addr" value="수원시"><br>
        <input type="file" name="file" class="bmap"/><br>
        <button type="button" class="btn btn-secondary" onclick="branchUpload(this.form)">추가합니다</button>

--%>

        </div>
    </form>
</div>
<script>
    async function branchUpload(branch) {
        let formData = new FormData(branch);
        let option = {
            method: "post",
            body: formData
        };
        let response = await fetch("/admin/fclass/api/addBranch", option);
        let result = await response.json();
        console.log(result);
        alert("추가되었습니다");
    }

    async function goUpdate(form, idx) {
        let formData = new FormData(form);
        formData.append("idx", idx);

        let option = {
            method: "post",
            body: formData
        }
        let response = await fetch("/admin/fclass/api/updateBranch", option);
        let result = await response.json();
        console.log(result);
        alert("수정되었당");
    }

    async function goDelete(form, idx) {
        let formData = new FormData(form);
        formData.append("idx", idx);

        let option = {
            method: "post",
            body: formData
        }
        let response = await fetch("/admin/fclass/api/deleteBranch", option);
        let result = await response.json();
        console.log(result);
        alert("삭제되었당");
        form.remove();
    }

    function preview(image) {
        let img = document.querySelector("img");

        let reader = new FileReader();
        reader.onload = function(e) {
            img.setAttribute("src", e.target.result.toString());
            img.classList.remove("invisible");
        }
        reader.readAsDataURL(image.files[0]);
    }
</script>
</body>
</html>
