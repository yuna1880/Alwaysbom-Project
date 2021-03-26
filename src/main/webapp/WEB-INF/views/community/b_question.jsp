<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>새늘봄
        |1 vs 1</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%@ include file="../main/b_import.jspf" %>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>

    </script>
</head>


<body>
<%@ include file="../main/b_header.jspf" %>
<div class="d-flex justify-content-center">
    <div id="container">
        <h2>1:1 다이다이</h2>
        <div>
            <form method="post">
                <div class="row row-cols-4">
                    <span class="text-center">번호</span>
                    <span class="text-center">작성일</span>
                    <span class="text-center">제목</span>
                    <span class="text-center">상태</span>
                </div>
                <ul class="nav row table">
                    <c:forEach var="quList" items="${questlist}">
                    <li class="list ">
                        <div class="row row-cols-4">
                            <span class="text-center">${quList.idx}</span>
                            <span class="text-center">작성일</span>
                            <span class="text-center">${quList.name}</span>
                            <span class="text-center">${quList.content}</span>
                        </div>
                        <img src="/static/upload/community/question/${quList.image}">
                    </li>
                </c:forEach>
                </ul>
            </form>
        </div>
    </div>
</div>

<%@ include file="../main/b_footer.jspf"%>
</body>
</html>

