<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>회원 목록</title>
    <%@ include file="../main/b_import.jspf"%>
    <link rel="stylesheet" href="/static/css/item/b_itemManager.css">
</head>
<body>
<%@ include file="../main/b_header.jspf"%>
<div id="container" class="mx-auto">
        <table id="b_memList">
            <thead>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>생일</th>
                <th>성별</th>
                <th>휴대폰번호</th>
                <th>회원등급</th>
                <th>포인트</th>
                <th>탈회여부</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${b_memList }">
                <tr>
                    <td>${b_memList.id }</td>
                    <td>${b_memList.name }</td>
                    <td>${b_memList.birth }</td>
                    <td>${b_memList.gender }</td>
                    <td>${b_memList.phone }</td>
                    <td>${b_memList.grade }</td>
                    <td>${b_memList.point }</td>
                    <td>${b_memList.quit_status }</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<%@ include file="../main/b_footer.jspf"%>
</body>
</html>
