<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 테이블 -->
<div class="order-lists">
    <span id="order-name">${searchOption.status} 목록</span>
</div>

<!-- 담은 수만큼 생성 -->
<c:forEach var="order" items="${ordersList}" varStatus="status">
<ul id="o${order.idx}" class="d-flex flex-column list-unstyled m-0 p-0">
    <li class="d-flex align-items-center border-bottom py-3 bg-light">
        <div class="col-7 d-flex align-items-center">
            주문번호 : ${order.idx}
            <c:if test="${order.status eq '입금대기'}">
                <button data-order-idx="${order.idx}" type="button" class="btn btn-dark btn-sm" id="order-button" onclick="payConfirm(this)">입금확인</button>
            </c:if>
            <c:if test="${order.status eq '주문취소'}">
                <button data-order-idx="${order.idx}" type="button" class="btn btn-dark btn-sm" id="order-button" onclick="payCancel(this)">주문취소 승인</button>
            </c:if>
            <c:if test="${order.status eq '결제완료'}">
                <button data-order-idx="${order.idx}" type="button" class="btn btn-dark btn-sm" id="order-button" onclick="departDelivery(this)">배송출발</button>
            </c:if>
        </div>
        <div class="col-5">
            <span class="badge bg-secondary" id="order-date">주문일 : ${order.odate}</span>
        </div>
    </li>
    <c:forEach var="oitem" items="${ordersList.get(status.index).olist}">
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
        <div style="background-color: white" class="col-5 d-flex flex-column">
            <div>수령인 이름 : ${order.senderName}</div>
            <div class="fst-italic">수령인 연락처 : ${order.receiverPhone}</div>
            <div>[수령 요청일] : ${oitem.requestDate}</div>
            <div>결제방법 : ${order.payType}</div>
            <div class="fw-bold">주문상태 : ${order.status}</div>
        </div>
    </li>
    </c:forEach>
</ul>
</c:forEach>