<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>fclass mainView</title>
</head>
<body>
<h2>여기는 메인뷰입니다</h2>
<div>
    <p>지점</p>
    <ul>
    <c:forEach var="branch" items="${branchList}">
        <li>${branch.name}</li>
    </c:forEach>
    </ul>
    <button type="button"><a href="/admin/fclass/branch">지점관리</a></button>
    <c:forEach var="fclass" items="${classList}">
    <div>
        <ul>
            <li class="list-wrap">
                <div>
                    <a><img src="/static/upload/fclass/class/${fclass.image1}" alt="꽃" class="image" width="350px"></a>
                </div>
                <div>${fclass.name}</div>
                <div>${fclass.discountRate}</div>
                <div>${fclass.price}</div>
                <div>${fclass.category}</div>
            </li>
        </ul>
    </div>
    </c:forEach>
</div>
<a href="/admin/fclass/detail">디테일로</a>

</body>
</html>
