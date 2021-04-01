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
    <style>
        .bottom-line{
            border-bottom:1px solid silver;
        }
    </style>
    <script>

    </script>

</head>


<body>
<%@ include file="../main/b_header.jspf" %>
<div class="d-flex justify-content-center">
    <div id="container">
        <h2>1:1 관리자 문의 게시판 입니다.</h2>
        <div class="mx-5">
            <form method="post">
                <div class="row row-cols-6 mx-auto bottom-line">
                    <span class="text-center col-2">번호</span>
                    <span class="text-center col-2">작성일</span>
                    <span class="text-center col-6">제목</span>
                    <span class="text-center col-2">상태</span>
                </div>
                <ul class="nav row table mx-auto">
                    <c:forEach var="quList" items="${questlist}">
                        <li class="list">
                        <div class="row row-cols-4 mx-auto bottom-line">
                            <span class="text-center col-2">${quList.idx}</span>
                            <span class="text-center col-2">작성일</span>
                            <span class="text-center col-6">${quList.name}</span>
                            <span class="text-center col-2">${quList.content}</span>
                        </div>
                        <div class="row mx-auto bottom-line text-center">
                            <div class="col-6 mx-auto">
                                <img src="${quList.image}" class="rounded- mx-auto" alt="star" title="별">
                            </div>
                            <div class="col-6 mx-auto">
                                내용내용내용내용내용질문내용
                            </div>
                        </div>
                        <div>
                            <div>
                                <div class="row row-cols-4 bottom-line">
                                    <span class="text-center">답변 번호</span>
                                    <span class="text-center">작성일</span>
                                    <span class="text-center">답변ㅇㅇㅇㅇ</span>
                                    <span class="text-center"></span>
                                </div>
                            </div>
                            <div class="bottom-line">
                                <div>
                                    <div>
                                        답변내용답변내용답변내용답변내용답변내용답변내용답변내용답변내용답변내용
                                    </div>
                                </div>
                            </div>
                        </div>
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

