<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>새늘봄 / 장바구니</title>
    <%@ include file="../main/import.jspf"%>
    <style>
        .height-100 {
            height: 100px;
        }
    </style>
</head>
<body>
    <%@ include file="../main/header.jspf"%>

    <div id="container" class="mx-auto d-flex flex-column align-items-center">
        <h1>장바구니</h1>
        <form action="/cart/order2" method="get" class="w-100">
            <ul id="basket" class="list-group list-group-flush w-100">
                <li class="list-group-item bg-dark text-white d-flex text-center">
                    <div class="col-1">
                        <input type="checkbox" class="form-check-input p-3 rounded-circle bg-warning border-warning" aria-label="allCheck" id="allBtn" onchange="applyAll(this)" checked>
                    </div>
                    <div class="col-6 d-flex justify-content-center align-items-center"><span>상품정보</span></div>
                    <div class="col-3 d-flex justify-content-center align-items-center"><span>추가상품</span></div>
                    <div class="col-2 d-flex justify-content-center align-items-center"><span>합계 금액</span></div>
                </li>
                <c:forEach var="cart" items="${list}">
                <c:choose>
                    <c:when test="${cart.category eq '꽃다발'}">
                        <c:set var="path" value="${cart.flowerVo.image1}"/>
                        <c:set var="link" value="/flower/${cart.flowerVo.idx}"/>
                        <c:set var="target" value="${cart.flowerVo}"/>
                    </c:when>
                    <c:when test="${cart.category eq '정기구독'}">
                        <c:set var="path" value="${cart.subsVo.image1}"/>
                        <c:set var="link" value="/subs/${cart.subsVo.idx}"/>
                        <c:set var="target" value="${cart.subsVo}"/>
                    </c:when>
                    <c:when test="${cart.category eq '소품샵'}">
                        <c:set var="path" value="${cart.productVo.image1}"/>
                        <c:set var="link" value="/product/${cart.productVo.idx}"/>
                        <c:set var="target" value="${cart.productVo}"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="path" value="default.jpg"/>
                        <c:remove var="target"/>
                    </c:otherwise>
                </c:choose>
                <c:if test="${not empty target}">
                <li class="list-group-item bg-white d-flex text-center height-100">
                    <div class="col-1">
                        <input type="checkbox" class="form-check-input p-3 rounded-circle cart-check bg-warning border-warning" aria-label="checkbox" name="idx"
                               value="${cart.idx}" onchange="checkAll()" checked>
                    </div>
                    <div class="col-6 d-flex">
                        <div class="card-img w-25 overflow-hidden">
                            <a href="${link}">
                                <img src="/static/upload/${path}" alt="사진" class="h-100">
                            </a>
                        </div>
                        <div class="bg-transparent w-75 d-flex flex-column align-items-baseline">
                            <span>${target.name}</span>
                            <div>
                                <c:if test="${target.discountRate ne 0}">
                                <span class="text-danger">${target.discountRate}</span>
                                <span class="text-decoration-line-through"><fmt:formatNumber value="${target.price}" pattern="#,###원"/></span>
                                </c:if>
                                <span><fmt:formatNumber value="${target.finalPrice}" pattern="#,###원"/></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 d-flex flex-column">
                        <c:forEach var="choice" items="${cart.choices}">
                            <div>
                                <span>${choice.productVo.name} * ${choice.quantity}</span>
                                <span><fmt:formatNumber value="${choice.productVo.finalPrice}" pattern="(#,###원)"/></span>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="col-2"><fmt:formatNumber value="${cart.totalPrice}" pattern="#,###원"/></div>
                </li>
                </c:if>
                </c:forEach>
            </ul>
            <button type="submit" class="btn btn-primary btn-lg">전송테스트</button>
        </form>
    </div>

    <%@ include file="../main/footer.jspf"%>

    <script>
        function applyAll(allBtn) {
            let allCheck = document.querySelectorAll(".cart-check");
            for (let check of allCheck) {
                check.checked = allBtn.checked;
            }
        }

        function checkAll() {
            let allCheck = document.querySelectorAll(".cart-check");
            let allBtn = document.querySelector("#allBtn");
            let checked = true;
            for (let check of allCheck) {
                checked &= check.checked;
                if (checked === false) {
                    break;
                }
            }
            allBtn.checked = checked;
        }
    </script>
</body>
</html>
