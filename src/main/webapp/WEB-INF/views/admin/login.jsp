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
<div id="container" class="mx-auto d-flex flex-column m-0 p-0">

    <form action="/admin/login" method="post"
          class="col-4 mx-auto my-auto border border-secondary bg-dark rounded-3 d-flex flex-column">
        <div class="p-3">
            <input type="text" class="form-control" name="id" id="id" placeholder="아이디">
        </div>
        <div class="p-3">
            <input type="text" class="form-control" name="password" id="password" placeholder="비밀번호">
        </div>
        <hr class="bg-primary p-0 m-0">
        <div class="p-3 col-6 align-self-center">
            <button type="submit" class="col-12 btn btn-primary">로그인</button>
        </div>
    </form>
</div>
<%@ include file="../main/b_footer.jspf"%>
</body>
</html>
