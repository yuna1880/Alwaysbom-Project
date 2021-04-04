<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>클래스 수강내역</title>
    <%@ include file="../main/b_import.jspf" %>
</head>
<body>
<%@ include file="../main/b_header.jspf" %>
<div id="container" class="mx-auto">
    <div class="d-flex justify-content-center align-items-center pt-5">
        <span class="fs-2 fw-bold">클래스 등록 조회</span>
    </div>
    <div class="d-flex row-cols-3 p-5">
        <div>
            <select id="branchSelect" class="form-select form-select-lg mb-3" onchange="searchByBranch()">
                <option selected>지점으로 조회</option>
                <option value="지점1">지점1</option>
                <option value="지점2">지점2</option>
                <option value="지점3">지점3</option>
            </select>
        </div>
        <div class="px-2">
            <select class="form-select form-select-lg mb-3">
                <option selected>입금상태로 조회</option>
                <option value="1">전체</option>
                <option value="2">입금대기</option>
                <option value="3">결제완료</option>
            </select>
        </div>
        <div>
            <div class="input-group mb-3" style="height: 47.6px;">
                <input type="text" class="form-control" placeholder="회원명으로 조회">
                <button class="btn btn-outline-secondary" type="button">검색</button>
            </div>
        </div>
    </div>



</div>
<%@ include file="../main/b_footer.jspf" %>
<script>
    async function searchByBranch() {
        let branch = document.querySelector("#branchSelect").value();
        let response = await fetch("admin/fclass/api/searchByBranch?branchName=" + branch);
        let result = await response.text();
        console.log(result);
    }
</script>
</body>
</html>
