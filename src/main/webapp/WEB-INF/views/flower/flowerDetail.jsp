<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>꽃다발 상세페이지</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="/static/css/flower/flower.css">
    <style>
        .scale-up:hover {
            transform: scale(1.1);
            transition-duration: 0.1s;
        }
    </style>
</head>
<body>
    <%@ include file="../main/header.jspf"%>

    <div id="container" class="mx-auto">
        <h1>꽃다발 상세페이지</h1>
        <div id="flower" class="d-flex flex-column">
            <span>${flowerVo.name}</span>
            <span>${flowerVo.subheader}</span>
            <span>${flowerVo.freeDeliveryMessage}</span>
            <div style="width: 200px;" class="overflow-hidden rounded-circle shadow border border-3 border-secondary">
                <img src="/static/upload/${flowerVo.image1}" alt="꽃다발" class="w-100 scale-up">
            </div>
            <div>
                <span class="text-danger">${flowerVo.discountRate}</span>
                <span class="text-decoration-line-through">${flowerVo.price}</span>
                <span>${flowerVo.finalPrice}</span>
            </div>
        </div>
    </div>

    <%@ include file="../main/footer.jspf"%>
<script>
    <%--
    async function getDetail() {
        let response = await fetch("/flower/${idx}/get");
        let result = await response.json();
        makeDetail(result);
    }

    fetch("/flower/${idx}/get")
        .then(function (response) {
            console.log(response);
            response.json().then(function (result) {
                console.log(result);
                makeDetail(result);
            });
        })
        .catch(function (err) {
            alert(err);
        });

    function makeDetail(vo) {
        let mainFlower = document.querySelector("#flower");
        let html = "<span>" + vo.name + "</span>";
        html += "<span>" + vo.subheader + "</span>";
        html += "<img src='/static/upload/"+ vo.image1+ "'>";

        mainFlower.innerHTML = html;
    }
    --%>
</script>
</body>
</html>
