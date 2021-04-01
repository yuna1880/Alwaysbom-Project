<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>소품샵 상세페이지</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="/static/css/item/detail.css">
</head>
<body>
    <%@ include file="../main/header.jspf"%>
    <div id="container" class="mx-auto">
        <h1>소품샵 상세페이지</h1>
    </div>

    <span>${productVo.subheader}</span>
    <span>${productVo.name}</span>
    <span>${productVo.category}</span>
    <span>${productVo.price}</span>
    <span>${productVo.discountRate}</span>
    <span>${productVo.content}</span>

    <button type="button" onclick="javascript:location.href='/admin/productAddForm'">수정</button>


    <%@ include file="../main/footer.jspf"%>

</body>
</html>
