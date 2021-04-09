<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>새늘봄 - 정기구독 내역조회</title>
    <%@ include file="../main/import.jspf" %>
    <link rel="stylesheet" href="/static/css/order/orderstyle_back.css">
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="mx-auto d-flex flex-column user-select-none">
    <%@ include file="../member/mypage_header.jspf" %>
    <div class="h-85 d-flex">
        <%@ include file="../member/mypage_menu.jspf" %>
        <div class="col-10 border-info d-flex justify-content-center p-4">
            <div class="col-12 h-100" id="contentPane">
                <div class="h5 col-12 d-flex flex-column text-secondary">
                    <div class="d-flex">
                        <span class="fw-bold name-color">${sessionScope.member.name}</span>
                        <span>님의 주문내역</span>
                        <hr>
                    </div>
                    <div id="ordersListContent" class="fs-6">
                        <!-- 담은 수만큼 생성 -->
                        <c:forEach var="order" items="${ordersList}" varStatus="status">
                            <ul id="o${order.idx}" class="d-flex flex-column list-unstyled m-0 p-0">
                                <li class="d-flex align-items-center border-bottom py-3 bg-light">
                                    <div class="col-7 d-flex align-items-center">
                                        주문번호 : ${order.idx}
                                        <c:if test="${order.status eq '입금대기' || order.status eq '결제완료'}">
                                            <button data-order-idx="${order.idx}" type="button" class="btn btn-dark btn-sm" id="order-button" data-index="${status.index}" onclick="CancelOrder(this, ${status.index})">주문취소</button>
                                        </c:if>
                                        <c:if test="${order.status eq '주문취소'}">
                                            <button data-order-idx="${order.idx}" type="button" class="btn btn-dark btn-sm" id="order-button">취소요청중</button>
                                        </c:if>
                                        <c:if test="${order.status eq '배송중'}">
                                            <button data-order-idx="${order.idx}" type="button" class="btn btn-dark btn-sm" id="order-button" data-index="${status.index}" onclick="ConfirmOrder(this ,${status.index})">구매확정</button>
                                        </c:if>
                                        <c:if test="${order.status eq '배송완료'}">
                                            <button data-order-idx="${order.idx}" type="button" class="btn btn-dark btn-sm" id="order-button" onclick="">리뷰작성</button>
                                        </c:if>
                                    </div>
                                    <div class="col-5">
                                        <span class="badge bg-secondary" id="order-date">주문일 : ${order.odate}</span>
                                    </div>
                                </li>
                                <c:forEach var="oitem" items="${ordersList.get(status.index).olist}" varStatus="nextStatus">
                                    <li class="d-flex border-bottom py-3">
                                        <div style="background-color: white" class="col-7 d-flex">
                                            <div class="overflow-hidden">
                                                <a href="#" title="${oitem.name}">
                                                    <!-- <img src="images/0_1.png" class="rounded float-start" alt="..."> -->
                                                    <img src="${oitem.image}" class="image_size">
                                                </a>
                                            </div>
                                            <div class="d-flex flex-column ps-3">
                                                <span class="content_category"></span>
                                                <span class="name">[${oitem.category}] ${oitem.name}</span>
                                                <div>
                                                    <span class="fst-italic">수량 : </span>
                                                    <span>${oitem.quantity}</span>
                                                </div>
                                                <span>편지 ${empty oitem.letterContent ? "없음" : "추가"}</span>
                                                <div>
                                                    <span>옵션 : </span>
                                                    <c:forTokens items="${oitem.options}" delims="," var="option">
                                                        ${option}<br>
                                                    </c:forTokens>
                                                </div>
                                                <div>
                                                    <span>가격</span>
                                                    <span>
                                                        <fmt:formatNumber value="${oitem.price}" pattern="#,### 원"/>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="background-color: white" class="col-5 d-flex flex-column lh-base">
                                            <div>수령인 이름 : ${order.senderName}</div>
                                            <div class="fst-italic">수령인 연락처 : ${order.receiverPhone}</div>
                                            <div>[수령 요청일] : ${oitem.requestDate}</div>
                                            <div>결제방법 : ${order.payType}</div>
                                            <br>
                                            <div class="fw-bold" >주문상태 :
<%--                                                <i id="status" data-index="${status.index}">${order.status}</i>--%>
                                                <span class="badge bg-warning text-dark" id="status" data-index="${status.index}">${order.status}</span>
                                            </div>
                                            <input type="hidden" id="orderStatus" value="${order.status}">
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:forEach>
                    </div>

                    <!-- 담은 수만큼 생성 -->
                    <%--                        <c:forEach var="order" items="${ordersList}" varStatus="status">--%>
                    <%--                            <table id="o${order.idx}" class="table">--%>
                    <%--                                <thead>--%>
                    <%--                                <tr>--%>
                    <%--                                    <th scope="col">--%>
                    <%--                                        주문번호 : ${order.idx}--%>
                    <%--                                        <c:if test="${order.status eq '입금대기' && order.status eq '결제완료'}">--%>
                    <%--                                        <button data-order-idx="${order.idx}" type="button" class="btn btn-dark btn-sm" id="order-button" onclick="CancelOrder(this)">주문취소</button>--%>
                    <%--                                        </c:if>--%>
                    <%--                                        <c:if test="${order.status eq '주문취소'}">--%>
                    <%--                                            <button data-order-idx="${order.idx}" type="button" class="btn btn-dark btn-sm" id="order-button">취소요청중</button>--%>
                    <%--                                        </c:if>--%>
                    <%--                                        <c:if test="${order.status eq '배송중'}">--%>
                    <%--                                            <button data-order-idx="${order.idx}" type="button" class="btn btn-dark btn-sm" id="order-button" onclick="ConfirmOrder(this)">구매확정</button>--%>
                    <%--                                        </c:if>--%>
                    <%--                                        <c:if test="${order.status eq '배송완료'}">--%>
                    <%--                                            <button data-order-idx="${order.idx}" type="button" class="btn btn-dark btn-sm" id="order-button" onclick="">리뷰작성</button>--%>
                    <%--                                        </c:if>--%>
                    <%--                                    </th>--%>
                    <%--                                    <th scope="col">--%>
                    <%--                                        <span class="badge bg-secondary" id="order-date">주문일 : ${order.odate}</span>--%>
                    <%--                                    </th>--%>
                    <%--                                </tr>--%>
                    <%--                                </thead>--%>
                    <%--                                    <tbody>--%>
                    <%--                                    <c:forEach var="oitem" items="${ordersList.get(status.index).olist}">--%>
                    <%--                                    <tr>--%>
                    <%--                                        <td scope="row" style="background-color: white">--%>
                    <%--                                            <div class="photo">--%>
                    <%--                                                <a href="#" class="img" title="폴인로즈 에디션">--%>
                    <%--                                                    <!-- <img src="images/0_1.png" class="rounded float-start" alt="..."> -->--%>
                    <%--                                                    <img src="${oitem.image}" class="image_size">--%>
                    <%--                                                </a>--%>
                    <%--                                            </div>--%>
                    <%--                                            <div class="detail">--%>
                    <%--                                                <span class="content_category"></span>--%>
                    <%--                                                <span class="name">[${oitem.category}] ${oitem.name}</span>--%>

                    <%--                                                <div class="option">--%>
                    <%--                                                    <span class="l"><span class="label"><i>수량 : </i>${oitem.quantity}</span></span>--%>
                    <%--                                                </div>--%>
                    <%--                                                <c:if test="${not empty oitem.letterContent}">--%>
                    <%--                                                    <div class="option">--%>
                    <%--                                                        <span class="l"><span class="label"><i></i>편지 추가</span></span>--%>
                    <%--                                                    </div>--%>
                    <%--                                                </c:if>--%>
                    <%--                                                <c:if test="${empty oitem.letterContent}">--%>
                    <%--                                                    <div class="option">--%>
                    <%--                                                        <span class="l"><span class="label"><i></i>편지 없음</span></span>--%>
                    <%--                                                    </div>--%>
                    <%--                                                </c:if>--%>
                    <%--                                                <div class="option">--%>
                    <%--                                                    <span class="l"><span class="label"><i>옵션 : </i><span>--%>
                    <%--                                                        <c:forTokens items="${oitem.options}" delims="," var="option">--%>
                    <%--                                                            ${option}<br/>--%>
                    <%--                                                        </c:forTokens>--%>
                    <%--                                                    </span></span></span>--%>
                    <%--                                                </div>--%>
                    <%--                                                    <span class="price">--%>
                    <%--                                                    <span class="label">가격</span>--%>
                    <%--                                                    <span class="val">--%>
                    <%--                                                        <fmt:formatNumber value="${oitem.price}" pattern="#,### 원"/>--%>
                    <%--                                                    </span>--%>
                    <%--                                                </span>--%>
                    <%--                                            </div>--%>
                    <%--                                        </td>--%>
                    <%--                                        <td style="background-color: white">--%>
                    <%--                                            <div class="detail2">--%>
                    <%--                                                <span class="content_category"></span>--%>
                    <%--                                                <span class="name">수령인 이름 : ${order.senderName}</span>--%>

                    <%--                                                <div class="option">--%>
                    <%--                                                    <span class="label"><i>수령인 연락처 : ${order.receiverPhone}</i></span>--%>
                    <%--                                                </div>--%>
                    <%--                                                <div class="option">--%>
                    <%--                                                    <span class="label">[수령 요청일] : ${oitem.requestDate}</span>--%>
                    <%--                                                </div>--%>
                    <%--                                                <div class="option">--%>
                    <%--                                                    <span class="label">결제방법 : ${order.payType}</span>--%>
                    <%--                                                </div>--%>
                    <%--                                                <div class="option">--%>
                    <%--                                                    <span class="label"><strong>주문상태 : ${order.status}</strong></span>--%>
                    <%--                                                </div>--%>
                    <%--                                            </div>--%>
                    <%--                                        </td>--%>
                    <%--                                    </tr>--%>
                    <%--                                    </c:forEach>--%>
                    <%--                                    </tbody>--%>
                    <%--                            </table>--%>
                    <%--                        </c:forEach>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    //주문취소 -> 취소요청중
    function CancelOrder(btn, index) {
        const idx = btn.dataset.orderIdx;
        console.log("인덱스 들어오녀ㅑ?? : "+index);
        const option = {
            method: 'put',
            body: '주문취소',
            headers : {
                "Content-Type": "application/json;charset=utf-8"
            }
        }

        // 버튼 클릭시 -> 상태값(status)변경처리 + 숫자 변경
        fetch("/admin/api/orders/" + idx + "/status", option).then(response => {
            console.log(response);
            response.json().then(result => {
                console.log(result);
                if (result) {
                    alert("주문 취소 요청이 완료되었습니다. 관리자 승인 후 취소처리됩니다.");
                    document.querySelector("#status[data-index='" + index + "']").innerText = '취소요청중';
                    document.querySelector("#order-button[data-index='" + index + "']").value = '취소요청중';

                    //document.querySelector("#status-text").innerText = '취소요청중';
                } else {
                    alert("실패입니다");
                }
            });
        });
    }

    //배송중 -> 배송완료
    function ConfirmOrder(btn, index) {
        const idx = btn.dataset.orderIdx;

        const option = {
            method: 'put',
            body: '배송완료',
            headers : {
                "Content-Type": "application/json;charset=utf-8"
            }
        }

        // 버튼 클릭시 -> 상태값(status)변경처리 + 숫자 변경
        fetch("/admin/api/orders/" + idx + "/status", option).then(response => {
            console.log(response);
            response.json().then(result => {
                console.log(result);
                if (result) {
                    alert("상품을 받으셨나요? 리뷰를 작성해주세요.");
                    document.querySelector("#status[data-index='" + index + "']").innerText = '배송완료';
                    document.querySelector("#order-button[data-index='" + index + "']").innerText = '배송완료';
                } else {
                    alert("실패입니다");
                }
            });
        });
    }

    //수강 내역
    async function goMyClassList(e) {
        e.preventDefault();
        let $contentPane = document.querySelector("#contentPane");

        let response = await fetch("/fclass/orders");
        $contentPane.innerHTML = await response.text();
        let $innerScript = $contentPane.querySelector("#innerScript");

        let $script = document.createElement("script");
        $script.appendChild(document.createTextNode($innerScript.innerHTML));
        $innerScript.replaceWith($script);
    }
</script>
</body>
<%@ include file="../main/footer.jspf" %>
</html>