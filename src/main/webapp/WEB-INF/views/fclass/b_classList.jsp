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
        <li>서초점BranchVo.name</li>
        <li>구로점BranchVo.name</li>
    </ul>
    <button type="button"><a href="/admin/fclass/branch">지점관리</a></button>
    <div>
        <ul>
            <li class="list-wrap">
                <div>
                    <a><img src="/static/upload/1.jpg" alt="꽃" class="image"></a>
                    FclassVo.image1
                </div>
                <div>코스이름FclassVo.name</div>
                <div>할인율FclassVo.discountRate</div>
                <div>가격FclassVo.price</div>
                <div>지점명FclassVo.name</div>
            </li>
        </ul>
    </div>
</div>
<a href="/admin/fclass/detail">디테일로</a>

</body>
</html>
