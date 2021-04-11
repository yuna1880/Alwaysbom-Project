<%--
  Created by IntelliJ IDEA.
  User: minho
  Date: 2021-04-11
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>로그인</title>
    <%@ include file="../main/b_import.jspf"%>
</head>
<body>
<%@ include file="../main/b_header.jspf"%>
<div id="container" class="mx-auto d-flex flex-column">
    <form action="/admin/login" method="post">
        <div class="p-3">
            <input type="text" class="form-control" name="id" id="id">
        </div>
        <div class="p-3">
            <input type="text" class="form-control" name="password" id="password">
        </div>
        <div class="p-3">
            <button type="submit" class="btn btn-primary">로그인</button>
        </div>
    </form>
</div>
<%@ include file="../main/b_footer.jspf"%>
</body>
</html>
