<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>fclass mainView</title>
    <%@ include file="../main/import.jspf" %>
    <style>
        header {
            z-index: 10;
        }
    </style>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="d-flex mx-auto">
    <div class="col-2 d-flex flex-column align-items-center">
        <p>지점</p>
        <ul>
            <c:forEach var="branch" items="${branchList}">
                <li>${branch.name}</li>
            </c:forEach>
        </ul>
        <button type="button"><a href="/admin/fclass/branch">지점관리</a></button>
    </div>
    <div class="col-10 bg-gradient">
        <ul class="d-flex flex-wrap">
            <c:forEach var="fclass" items="${classList}">
            <li class="col-4 card p-4">
                <div>
                    <a href="/admin/fclass/detail?idx=${fclass.idx}">
                        <img src="/static/upload/fclass/class/${fclass.image1}" alt="꽃" class="card-img-top">
                    </a>
                </div>
                <div>${fclass.name}</div>
                <div>${fclass.discountRate}</div>
                <div>${fclass.price}</div>
                <div>${fclass.category}</div>
            </li>
            </c:forEach>
            <li class="col-4 card p-4">
                <a class="w-100 h-100 btn btn-outline-secondary d-flex align-items-center justify-content-center" href="/admin/fclass/addClass">
                    <i class="fa fa-plus h1"></i>
                </a>
            </li>
        </ul>
    </div>
</div>
<%@ include file="../main/footer.jspf" %>
</body>
</html>
