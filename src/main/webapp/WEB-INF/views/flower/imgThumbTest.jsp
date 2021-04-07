<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="../main/import.jspf"%>
</head>
<body>
<div id="container" class="mx-auto">
<%--    <div class="thumbnails d-flex flex-column justify-content-start">--%>
<%--        <div class="w-100 overflow-hidden">--%>
<%--            <div class="mb-4 d-inline-flex">--%>
<%--                <img src="/static/image/flower/vase3-1.jpg" alt="대표 썸네일" class="col-12">--%>
<%--                <img src="/static/image/flower/vase3-2.jpg" alt="썸네일2" class="col-12">--%>
<%--                <img src="/static/image/flower/vase3-3.jpg" alt="썸네일2" class="col-12">--%>
<%--                <img src="/static/image/flower/vase3-1.jpg" alt="썸네일3" class="col-12">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="d-flex">--%>
<%--            <img src="/static/image/flower/vase3-1.jpg" alt="썸네일1" class="col-4 pe-3">--%>
<%--            <img src="/static/image/flower/vase3-2.jpg" alt="썸네일2" class="col-4 ps-2 pe-2">--%>
<%--            <img src="/static/image/flower/vase3-3.jpg" alt="썸네일3" class="col-4 ps-3">--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="h-100"></div>

    <div id="carouselExampleIndicators" class="carousel slide" data-bs-interval="false">
        <ol class="carousel-indicators">
            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1">
                <img src="/static/image/flower/vase3-1.jpg" class="d-block w-100" alt="...">
            </li>
            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2">
                <img src="/static/image/flower/vase3-1.jpg" class="d-block w-100" alt="...">
            </li>
            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3">
                <img src="/static/image/flower/vase3-1.jpg" class="d-block w-100" alt="...">
            </li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/static/image/flower/vase3-1.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/static/image/flower/vase3-2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/static/image/flower/vase3-3.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>








</div>
</body>
</html>
<style>
    #container {
        width: 1280px;
        background-color: #ffe881;
    }
    .thumbnails {
        width: 45%;
    }

</style>