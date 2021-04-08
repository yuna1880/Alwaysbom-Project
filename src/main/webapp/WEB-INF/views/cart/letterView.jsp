<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

    <h1>letter View입니다</h1>
    <hr>
    <div>
    <c:forEach var="letter" items="${list}">
        <div><p>${letter.idx}</p>
        <div><p>${letter.name}</p></div>
        <div><p>${letter.content}</p></div>
        <hr>
    </c:forEach>
    </div>

