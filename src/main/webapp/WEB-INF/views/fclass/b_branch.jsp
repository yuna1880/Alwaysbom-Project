<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Managing branch</title>
</head>
<body>
<button><a href="/admin/fclass/list">이전페이지</a></button>
<h2>지점</h2>
<form method="post" action="/admin/fclass/upload" enctype="multipart/form-data">
    <div>
        <input type="text" name="bname" id="bname" value="지점명"/>
        <button type="button">수정</button>
        <button type="button">삭제</button>
    </div>
    <div>
        <input type="file" name="file" class="bmap"/>
        <button type="button">지도선택</button>
    </div>
</form>

<form enctype="multipart/form-data">
<h2>지점추가</h2>
    <input type="text" name="name" class="bname" value="지점명"/><br>
    <input type="text" name="color" value="#eeeeee"><br>
    <input type="text" name="addr" value="수원시"><br>
    <input type="file" name="file" class="bmap"/><br>
    <button type="button" onclick="branchUpload(this.form)">추가합니다</button>
</form>

<script>
    async function branchUpload(branch) {
        let formData = new FormData(branch);
        let option = {
            method: "post",
            body: formData
        };
        let response = await fetch("/admin/fclass/api/addbranch", option);
        let result = await response.json();
        console.log(result);
    }
</script>
</body>
</html>
