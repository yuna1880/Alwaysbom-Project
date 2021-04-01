<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>detailTemp</title>
    <%@ include file="../main/import.jspf"%>
</head>
<body>
<%@ include file="../main/header.jspf"%>
<h1>상세 페이지입니다</h1>
<hr>
<c:forEach var="schedule" items="${scheduleList}">
    <div>
        <a href="/fclass/payment?scheduleIdx=${schedule.idx}&regCount=3">${schedule.sdate} : ${fclassVo.name}, ${branchVo.name}</a>
    </div>
</c:forEach>
<%@ include file="../main/footer.jspf"%>
</body>
</html>
