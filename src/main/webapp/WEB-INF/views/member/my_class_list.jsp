<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <h1 class="hanadul">내 주문내역입니다</h1>
    <h1>heheheheh</h1>
    <hr>
    <ul>
        <c:forEach var="oclass" items="${list}">
            <li class="d-flex p-2 border">
                <div class="col-3"><img src="${oclass.fclassImage}" alt="이미지" class="col-3"></div>
                <div class="col-2">${oclass.payType}</div>
                <div class="col-2">${oclass.regCount}</div>
                <div class="col-2">${oclass.discountTotalPrice}</div>
                <div class="col-3">${oclass.status}</div>
            </li>
        </c:forEach>
    </ul>
</div>