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

        .btnColor {
            color: white;
            text-decoration: none;
        }

        .btnColor:hover {
            color: white;
        }

        .classes {
            padding: 0 0 0 30px;
        }

        .class-li-wrap, .branch-li {
            margin: 50px 0;
        }

        .branch-li-wrap {
            list-style: none;
        }

        .scale-up:hover {
            transition-duration: 0.2s;
            transform: scale(1.1);
        }
    </style>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="d-flex mx-auto">
    <div class="col-2 d-flex justify-content-center">
        <div class="branch-li p-4 d-flex flex-column align-items-center">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">지점</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="branch" items="${branchList}">
                <tr>
                        <th>${branch.name}</th>
                </tr>
                    </c:forEach>
            </table>
            <button type="button" class="btn btn-success">
                <a class="btnColor" href="/admin/fclass/branch">지점관리</a>
            </button>
        </div>
    </div>
    <div class="col-10 bg-gradient">
        <div class="class-li-wrap">
            <h3 class="classes">One-day class</h3>
            <h3 class="classes">원데이클래스</h3>
            <ul class="d-flex flex-wrap">
                <c:forEach var="fclass" items="${classList}">
                    <c:if test="${fclass.category eq '원데이클래스'}">
                        <li class="col-4 card p-4">
                            <div>
                                <a href="/admin/fclass/detail?idx=${fclass.idx}">
                                    <input type="hidden" name="idx" value="${fclass.idx}">

                                    <div class="overflow-hidden">
                                        <img src="/static/upload/fclass/class/${fclass.image1}" alt="꽃"
                                             class="card-img-top scale-up">
                                    </div>
                                </a>
                            </div>
                            <div>${fclass.name}</div>
                            <div>${fclass.discountRate}</div>
                            <div>${fclass.price}</div>
                            <div>${fclass.category}</div>
                        </li>
                    </c:if>
                </c:forEach>
                <li class="col-4 card p-4" style="height: 439.88px;">
                    <a class="w-100 h-100 btn btn-outline-secondary d-flex align-items-center justify-content-center"
                       href="/admin/fclass/addClass">
                        <i class="fa fa-plus h1"></i>
                    </a>
                </li>
            </ul>
        </div>
        <div class="class-li-wrap">
            <h3 class="classes">Florist class</h3>
            <h3 class="classes">플로리스트 클래스</h3>
            <ul class="d-flex flex-wrap">
                <c:forEach var="fclass" items="${classList}">
                    <c:if test="${fclass.category eq '플로리스트'}">
                        <li class="col-4 card p-4">
                            <div>
                                <a href="/admin/fclass/detail?idx=${fclass.idx}">
                                    <div class="overflow-hidden">
                                        <img src="/static/upload/fclass/class/${fclass.image1}" alt="꽃"
                                             class="card-img-top  scale-up">
                                    </div>
                                </a>
                            </div>
                            <div>${fclass.name}</div>
                            <div>${fclass.discountRate}</div>
                            <div>${fclass.price}</div>
                            <div>${fclass.category}</div>
                        </li>
                    </c:if>
                </c:forEach>
                <li class="col-4 card p-4" style="height: 439.88px;">
                    <a class="w-100 h-100 btn btn-outline-secondary d-flex align-items-center justify-content-center"
                       href="/admin/fclass/addClass">
                        <i class="fa fa-plus h1"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<%@ include file="../main/footer.jspf" %>
</body>
</html>
