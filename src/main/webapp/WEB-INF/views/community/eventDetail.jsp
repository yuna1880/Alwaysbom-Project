<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
    <head>
        <title>이벤트</title>
        <%@ include file="../main/import.jspf"%>
        <link rel="stylesheet" href="../../../static/css/item/list.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            .big-image{
                width: 100vw;
                background-color: #0a53be;
            }
        </style>
    </head>
<body>
<%@ include file="../main/header.jspf" %>
<div class="big-image">
    <img src="${eventVo.image1}" alt="이벤트배너" class="col-12">
</div>

<div id="container" class="mx-auto mt-3">

    <div id="detail-area" class="mb-5 col-12">
        <div class="w-auto overflow-auto d-flex flex-column justify-content-center">${eventVo.content}</div>
    </div>

    <!-- Reply Form {s} -->
    <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
        <form name="form" id="form" role="form" modelAttribute="replyVO" method="post">
            <form path="bid" id="bid"/>
            <div class="row">
                <div class="col-sm-10">
                    <textarea path="content" id="content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></textarea>
                </div>
                <div class="col-sm-2">
                    <input path="reg_id" class="form-control" id="reg_id" placeholder="댓글 작성자"></input>
                    <button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>
                </div>
            </div>
        </form>
    </div>
    <!-- Reply Form {e} -->
    <!-- Reply List {s}-->
    <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
        <h6 class="border-bottom pb-2 mb-0">Reply list</h6>
        <div id="replyList"></div>
    </div>
    <!-- Reply List {e}-->
</div>
<%@ include file="../main/footer.jspf" %>
</body>
<style>

</style>
</html>
<%--width: 100vw; height: 800~1000px;--%>


