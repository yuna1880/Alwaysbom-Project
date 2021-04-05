<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>새늘봄 백오피스 - 주문내역 조회</title>
    <%@ include file="../main/b_import.jspf"%>
    <link rel="stylesheet" href="/static/css/order/orderstyle_back.css">

</head>
<body>
<%@ include file="../main/b_header.jspf"%>

<div class="container">
    <div class="row">
        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
            <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
            <label class="btn btn-outline-primary" for="btnradio1">입금 대기
                <span class="badge">${totalNum}</span>
            </label>

            <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
            <label class="btn btn-outline-primary" for="btnradio2">주문 취소
                <span class="badge">7</span>
            </label>

            <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
            <label class="btn btn-outline-primary" for="btnradio3">취소 완료
                <span class="badge">1</span>
            </label>

            <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
            <label class="btn btn-outline-primary" for="btnradio4">결제 완료
                <span class="badge">10</span>
            </label>

            <input type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off">
            <label class="btn btn-outline-primary" for="btnradio5">배송중
                <span class="badge">129</span>
            </label>

            <input type="radio" class="btn-check" name="btnradio" id="btnradio6" autocomplete="off">
            <label class="btn btn-outline-primary" for="btnradio6">배송 완료
                <span class="badge">14</span>
            </label>
        </div>
    </div>


    <!-- 테이블 -->
    <div class="order-lists">
        <span id="order-name">입금 대기 목록</span>
    </div>

    <!-- 담은 수만큼 생성 -->

    <c:forEach var="order" items="${ordersList}" varStatus="status">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">
                주문번호 : ${order.idx}
                <button type="button" class="btn btn-dark btn-sm" id="order-button">입금확인</button>
            </th>
            <th scope="col">
                <span class="badge bg-secondary" id="order-date">주문일 : ${order.odate}</span>
            </th>
        </tr>
        </thead>

        <c:forEach var="oitem" items="${ordersList.get(status.index).olist}">
        <tbody>
        <tr>
            <th scope="row">
                <div class="photo">
                    <a href="#" class="img" title="폴인로즈 에디션">
                        <!-- <img src="images/0_1.png" class="rounded float-start" alt="..."> -->
                        <img src="${oitem.image}" class="image_size">
                    </a>
                </div>
                <div class="detail">
                    <span class="content_category"></span>
                    <span class="name">[${oitem.category}] ${oitem.name}</span>

                    <div class="option">
                        <span class="l"><span class="label"><i>수량 : </i>${oitem.quantity}</span></span>
                    </div>
                    <c:if test="${not empty oitem.letterContent}">
                    <div class="option">
                        <span class="l"><span class="label"><i></i>편지 추가</span></span>
                    </div>
                    </c:if>
                    <c:if test="${empty oitem.letterContent}">
                        <div class="option">
                            <span class="l"><span class="label"><i></i>편지 없음</span></span>
                        </div>
                    </c:if>
                    <div class="option">
                        <span class="l"><span class="label"><i>옵션 : </i><span>
                            <c:forTokens items="${oitem.options}" delims="," var="option">
                                ${option}<br/>
                            </c:forTokens>
                        </span></span></span>
                    </div>
                    <span class="price">
                                <span class="label">가격</span>
                                <span class="val">
                                    <fmt:formatNumber value="${oitem.price}" pattern="#,### 원"/>
                                </span>
                    </span>
                </div>
            </th>
            <td>
                <div class="detail2">
                    <span class="content_category"></span>
                    <span class="name">수령인 이름 : ${order.senderName}</span>

                    <div class="option">
                        <span class="label"><i>수령인 연락처 : ${order.receiverPhone}</i></span>
                    </div>
                    <div class="option">
                        <span class="label">결제방법 : ${order.payType}</span>
                    </div>
                    <div class="option_status">
                        <span class="label">상태: ${oitem.status}</span>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
        </c:forEach>
    </table>
        <c:if test="${status.last eq true}">
            <c:set var="totalNum" value="${status.index}"/>
        </c:if>
    </c:forEach>
</div>
<script src="/static/js/imageUploader.js"></script>
</body>
</html>
