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
    <script type="text/javascript" src="/static/js/biginteger_javascript/rsa.js"></script>
    <script type="text/javascript" src="/static/js/biginteger_javascript/jsbn.js"></script>
    <script type="text/javascript" src="/static/js/biginteger_javascript/prng4.js"></script>
    <script type="text/javascript" src="/static/js/biginteger_javascript/rng.js"></script>
</head>
<body>
<%@ include file="../main/b_header.jspf"%>
<div id="container" class="mx-auto d-flex flex-column m-0 p-0">

    <input type="hidden" id="rsaModulus" value="${publicModulus}">
    <input type="hidden" id="rsaExponent" value="${publicExponent}">
    <form class="col-4 mx-auto my-auto border border-secondary bg-dark rounded-3 d-flex flex-column">
        <div class="p-3">
            <input type="text" class="form-control" autocomplete="off" name="idText" id="idText" placeholder="아이디">
        </div>
        <div class="p-3">
            <input type="password" class="form-control" autocomplete="off" name="passwordText" id="passwordText" placeholder="비밀번호">
        </div>
        <hr class="bg-primary p-0 m-0">
        <div class="p-3 col-6 align-self-center">
            <button type="button" class="col-12 btn btn-primary" onclick="login(this.form)">로그인</button>
        </div>
    </form>

    <form id="securedForm" action="/admin/login" method="post" class="d-none">
        <input type="hidden" name="id">
        <input type="hidden" name="password">
    </form>
</div>
<%@ include file="../main/b_footer.jspf"%>
<script>
    function login(form) {
        const rsaModulus = document.querySelector("#rsaModulus").value;
        const rsaExponent = document.querySelector("#rsaExponent").value;

        const rsaKey = new RSAKey();
        rsaKey.setPublic(rsaModulus, rsaExponent);

        const securedId = rsaKey.encrypt(form.idText.value);
        const securedPassword = rsaKey.encrypt(form.passwordText.value);

        let securedForm = document.querySelector("#securedForm");
        securedForm.querySelector("[name=id]").value = securedId;
        securedForm.querySelector("[name=password]").value = securedPassword;
        securedForm.submit();
    }
</script>
</body>
</html>
