<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>클래스 화면</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="/static/css/fclass/classlist.css">
</head>
<body>
<!-- 고객이 클래스메뉴 눌렀을때 나오는 화면 (클래스 리스트) -->

<%@ include file="../main/header.jspf" %>
<div class="banner-img d-flex justify-content-center align-items-center">
    클래스 배너 이미지
</div>
<div id="container" class="mx-auto">
    <div class="class-li-wrap pt-5">
        <h3 class="classes">One-day class</h3>
        <h3 class="classes">원데이클래스</h3>
    </div>
    <!-- 원데이클래스 썸네일 리스트 -->
    <div class="row row-cols-4">
        <c:forEach var="fclass" items="${classList}">
            <c:if test="${fclass.category eq '원데이클래스'}">
                <div class="col f-col">
                    <div class="overflow-hidden">
                        <a href="/fclass/detail?idx=${fclass.idx}">
                            <img src="${fclass.image1}" class="f-col-img scale-up" alt="클래스 썸네일">
                        </a>
                    </div>
                    <div class="f-col-text">
                        <div class="subheader">${fclass.subheader}</div>
                        <div class="class-name"><a href="/fclass/${fclass.idx}">${fclass.name}</a></div>
                        <div class="price-wrap">
                                <span class="discount-rate">${fclass.discountRate}%</span>
                                <span class="original-price"><fmt:formatNumber value="${fclass.price}" pattern="#,###"/>원</span>
                                <span class="final-price"><fmt:formatNumber value="${fclass.finalPrice}" pattern="#,###"/>원</span>
                        </div>
                        <ul class="border-0 d-flex m-0 p-0">
                            <c:forEach var="bvo" items="${fclass.branchList}">
                                <li class="branch-box list-unstyled p-1 me-1 fw-bold"  style="color: ${bvo.color}; border: 2px solid ${bvo.color}; border-radius: 12px; font-size: 0.75rem; width: 60px; text-align: center;">${bvo.name}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
    <!-- 플로리스트 썸네일 리스트 -->
    <div class="class-li-wrap">
        <h3 class="classes">Florist class</h3>
        <h3 class="classes">플로리스트 클래스</h3>
    </div>
    <div class="row row-cols-4">
        <c:forEach var="fclass" items="${classList}">
            <c:if test="${fclass.category eq '플로리스트'}">
                <div class="col f-col">
                        <div class="overflow-hidden">
                    <a href="/fclass/detail?idx=${fclass.idx}">
                        <img src="${fclass.image1}" class="f-col-img scale-up" alt="클래스 썸네일">
                    </a>
                        </div>
                    <div class="f-col-text">
                        <div class="subheader">${fclass.subheader}</div>
                        <div class="class-name"><a href="/fclass/${fclass.idx}">${fclass.name}</a></div>
                        <div class="price-wrap">
                            <span class="discount-rate">${fclass.discountRate}%</span>
                            <span class="original-price"><fmt:formatNumber value="${fclass.price}" pattern="#,###"/>원 ></span>
                            <span class="final-price"><fmt:formatNumber value="${fclass.finalPrice}" pattern="#,###"/>원</span>
                        </div>
                        <ul class="border-0 d-flex m-0 p-0">
                            <c:forEach var="bvo" items="${fclass.branchList}">
                                <li class="branch-box list-unstyled p-1 me-1 fw-bold"  style="color: ${bvo.color}; border: 2px solid ${bvo.color}; border-radius: 12px; font-size: 0.75rem; width: 60px; text-align: center;">${bvo.name}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

<%@ include file="../main/footer.jspf" %>

<script>
    let headerMenuColumns = document.getElementsByClassName("h-menu");
    let underBars = document.getElementsByClassName("under-bar");
    for (let i = 0; i < headerMenuColumns.length; i++) {
        headerMenuColumns[i].firstElementChild.classList.remove("menu-active");
    }
    for (let i = 0; i < underBars.length; i++) {
        underBars[i].classList.remove("menu-active");
    }
    document.querySelector("#fclass").classList.add("menu-active");
    document.querySelector("#under-bar3").classList.add("menu-active");
</script>
</body>
</html>
