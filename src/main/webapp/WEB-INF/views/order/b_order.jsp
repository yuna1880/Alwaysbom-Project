<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>새늘봄 백오피스 - 주문내역 조회</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="bootstrap.min.css">
    <link rel="stylesheet" href="style4.css">
</head>
<body>
<%@ include file="../main/header.jspf" %>

<div class="container">
    <div class="row">
        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
            <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
            <label class="btn btn-outline-primary for="btnradio1">입금 대기
                <span class="badge">4</span>
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

    <table class="table">
        <thead>
        <tr>
            <th scope="col">
                주문번호 : 202103240001
                <button type="button" class="btn btn-dark btn-sm" id="order-button">입금확인</button>
            </th>
            <th scope="col">
                <span class="badge bg-secondary" id="order-date">주문일 : 2021-03-24</span>
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">
                <div class="photo">
                    <a href="#" class="img" title="폴인로즈 에디션">
                        <!-- <img src="images/0_1.png" class="rounded float-start" alt="..."> -->
                        <img src="images/0_1.png" class="image_size">
                    </a>
                </div>
                <div class="detail">
                    <span class="content_category"></span>
                    <span class="name">[정기구독]가벼운 S꽃구독</span>

                    <div class="option">
                        <span class="l"><span class="label"><i>수량 : </i>1</span></span>
                    </div>
                    <div class="option">
                        <span class="l"><span class="label"><i></i>편지 추가</span></span>
                    </div>
                    <div class="option">
                        <span class="l"><span class="label"><i></i><span>화이트 화병[1]</span></span></span>
                    </div>
                    <span class="price">
                                <span class="label">가격</span>
                                <span class="val">69,300원</span>
                            </span>
                </div>
            </th>
            <td>
                <div class="detail2">
                    <span class="content_category"></span>
                    <span class="name">수령인 이름 : 권유나</span>

                    <div class="option">
                        <span class="label"><i>수령인 연락처 : 010-0000-0000</i></span>
                    </div>
                    <div class="option">
                        <span class="label">결제방법 : 무통장입금</span>
                    </div>
                    <div class="option_status">
                        <span class="label">상태: 입금대기</span>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>



<%@ include file="../main/footer.jspf"%>
</body>
</html>
