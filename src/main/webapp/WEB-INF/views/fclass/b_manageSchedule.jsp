<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>클래스 일정 관리</title>
    <%@ include file="../main/b_import.jspf"%>
</head>
<body>
<%@ include file="../main/b_header.jspf"%>
<div id="container" class="mx-auto d-flex">
<%--    <h2>${category}</h2>
    <h2>${classIdx}</h2>
    <h2>${branchIdx}</h2>--%>
    <div class="col-8 bg-secondary justify-content-between">
        <div class="bg-primary d-flex p-5">
            <select class="form-select me-3">
                <option selected>클래스 '월' 선택</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
            <select class="form-select">
                <option selected>클래스 '일' 선택</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
        </div>
        <div class="bg-success p-5">
            <table class="table">
                <thead class="table-dark">
                <tr>
                    <th scope="col" class="col-8">#</th>
                    <th scope="col" class="col-1">First</th>
                    <th scope="col" class="col-1">Last</th>
                    <th scope="col" class="col-2">Handle</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td colspan="2">Larry the Bird</td>
                    <td>@twitter</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-4 bg-warning d-flex justify-content-center align-items-center">

    </div>
</div>
<%@ include file="../main/b_footer.jspf"%>
</body>
</html>
