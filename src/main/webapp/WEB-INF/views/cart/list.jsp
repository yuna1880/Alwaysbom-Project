<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>새늘봄 / 장바구니</title>
    <%@ include file="../main/import.jspf"%>
</head>
<body>
    <%@ include file="../main/header.jspf"%>

    <div id="container" class="mx-auto d-flex flex-column align-items-center">
        <h1>장바구니</h1>
        <form action="/cart/order2" method="get" class="w-100">
            <ul id="basket" class="list-group list-group-flush w-100">
                <li class="list-group-item bg-dark text-white d-flex text-center">
                    <div class="col-1">
                        <input type="checkbox" class="form-check-input p-3 rounded-circle bg-warning border-warning" aria-label="allCheck" id="allBtn" onchange="applyAll(this)">
                    </div>
                    <div class="col-6 d-flex justify-content-center align-items-center"><span>상품정보</span></div>
                    <div class="col-3 d-flex justify-content-center align-items-center"><span>추가상품</span></div>
                    <div class="col-2 d-flex justify-content-center align-items-center"><span>합계 금액</span></div>
                </li>
                <c:forEach var="cart" items="${list}">
                    <c:choose>
                        <c:when test="${cart.category eq '꽃다발'}">
                            <c:set var="path" value="${cart.flowerVo.image1}"/>
                            <c:set var="target" value="${cart.flowerVo}"/>
                        </c:when>
                        <c:when test="${cart.category eq '정기구독'}">
                            <c:set var="path" value="${cart.subsVo.image1}"/>
                            <c:set var="target" value="${cart.subsVo}"/>
                        </c:when>
                        <c:when test="${cart.category eq '소품샵'}">
                            <c:set var="path" value="${cart.productVo.image1}"/>
                            <c:set var="target" value="${cart.productVo}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="path" value="default.jpg"/>
                            <c:remove var="target"/>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${not empty target}">
                        <li class="list-group-item bg-white text-primary d-flex text-center">
                            <div class="col-1">
                                <input type="checkbox" class="form-check-input p-3 rounded-circle cart-check bg-warning border-warning" aria-label="checkbox" name="idx"
                                       value="${cart.idx}" onchange="checkAll()">
                            </div>
                            <div class="col-6 d-flex">
                                <div class="card-img">
                                    <img src="/static/upload/${path}" alt="사진">
                                </div>
                                <div class="bg-info d-flex flex-column">
                                    <span>${target.name}</span>
                                </div>
                            </div>
                            <div class="col-3">추가상품</div>
                            <div class="col-2">합계 금액</div>
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
