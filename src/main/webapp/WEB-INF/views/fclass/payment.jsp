<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>플라워클래스 결제</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" type="text/css" href="/static/css/fclass/class_payment.css">
</head>
<script>
    window.onload = function () {
        creditCard();
    }
    //신용카드
    function creditCard () {
        document.getElementById('credit_card_input').style.display = 'none';
        document.getElementById('mootong').style.display = 'none';
    }
    //신용카드 직접입력
    function creditCardInput() {
        document.getElementById('credit_card_input').style.display = 'block';
        document.getElementById('mootong').style.display = 'none';
    }
    //무통장입금
    function mootong() {
        document.getElementById('credit_card_input').style.display = 'none';
        document.getElementById('mootong').style.display = 'block';
    }
    function kakaoPay() {
        document.getElementById('credit_card_input').style.display = 'none';
        document.getElementById('mootong').style.display = 'none';
    }

    function usePoint() {
        const inputPointEl = document.querySelector("#input_my_point");
        const discountPointEl = document.querySelector("#pointHere");
        const finalPriceEl = document.querySelector("#finalPrice");
        let originalPrice = finalPriceEl.getAttribute("data-original-price");
        let discountPoint;

        if (inputPointEl.value !== "" || inputPointEl.value.length > 0) {
            discountPoint = inputPointEl.value;
        } else {
            discountPoint = 0;
        }
        discountPointEl.textContent = '-' + discountPoint + ' 원';
        let finalPrice = originalPrice - discountPoint;
        finalPriceEl.textContent = finalPrice.toLocaleString('ko-KR') + " 원";
    }

    function compareWithPoint(point) {
        if (point.value > ${memberVo.point}) {
            alert("회원님께서 사용 가능한 포인트는 <fmt:formatNumber value="${memberVo.point}" pattern="#,###"/> 입니다.")
            point.value="";
        }
    }

</script>
<body>
<%@ include file="../main/header.jspf" %>
<div class="container">
    <!-- 헤더 -->
    <div class="checkout_wrap">
        <div class="navi" tabindex="-1">
            <ol class="process">
                <div class="step"><span class="order"><b>1</b><span class="desc">결제</span></span></div>
            </ol>
        </div>

        <div class="checkout_content">
            <div class="process">
                <div class="step" id="okCheckout">

                    <!-- 폼 시작-->
                    <form action="" method="post">
                        <div class="information_box">
                            <div class="checkout_finals">

                                <!-- 주문내역 -->
                                <div class="checkout_cartlist">
                                    <div class="head">
                                        <span class="delivery fw-bold">수강일</span>
                                        <span class="product fw-bold">클래스</span>
                                        <span class="price fw-bold">수강료</span></div>
                                    <div class="cartlist_wrap">
                                        <div id="cartlist_wrapper_final">
                                            <div id="cartlist_wrapper" class="cartlist_wrap">
                                                <div class="item">
                                                    <h4 class="delivery_date">
                                                        <span class="label">수강일</span>
                                                        <span class="val fw-bold">${scheduleVo.sdate}</span></h4>
                                                    <h5 class="delivery_title">
                                                        <span class="label">상품명</span>
                                                        <span class="val fw-bold">[ ${branchVo.name} ]</span>
                                                        <span class="val fw-bold">${fclassVo.category}_${fclassVo.name}</span></h5>
                                                    <div class="delivery_goods">
                                                        <div class="row">
                                                            <div class="list_good_checkout">
                                                                <div class="good">
                                                                    <div class="photo">
                                                                        <a href="#" class="img" title="클래스 대표이미지">
                                                                            <img src="/static/image/oitem/0_1.png" class="image_size"><!--???????? -->
                                                                        </a>
                                                                    </div>
                                                                    <div class="detail">
                                                                        <span class="content_category"></span>
                                                                        <div><span class="name">[ ${branchVo.name} ]</span>
                                                                        <span class="name">${fclassVo.category}_${fclassVo.name}</span></div>
                                                                        <div class="option">
                                                                            <span class="l"><span class="label"><i>수강인원 : </i>${regCount}</span></span>
                                                                            <!--????????상세에서 값 가져와야함. -->
                                                                        </div>
                                                                        <div class="option">
                                                                            <span class="l"><span class="label"><i>수강시간 : </i>${scheduleVo.startTime}</span></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="list_good_price">
                                                                <span class="price fw-bold"><span><fmt:formatNumber value="${fclassVo.price}" pattern="#,###"/> 원</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 쿠폰, 적립금 -->
                                <table class="input_table in_s4 w450">
                                    <tbody>
                                    <tr>
                                        <td><span class="detail"><span class="th fw-bold">적립금</span>
                                    <span class="td_savings">
                                        <input type="number" min="0" name="point" id="input_my_point"
                                               value="0" autocomplete="off" onkeyup="compareWithPoint(this)" onchange="compareWithPoint(this)"><!--여기서 넣는값이 사용할 포인트가 될것임 이게 밑에도 적용되야함 -->
                                        <button type="button" class="btns add"
                                                data-checkout_price="69300" onclick="usePoint()">적용</button><!--???????? -->
                                        <span class="text">* 사용 가능 포인트:  <fmt:formatNumber value="${memberVo.point}" pattern="#,###"/></span>
                                    </span>
                                    </span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                                <div class="check_row_table">
                                    <ul>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            포인트할인<span id="pointHere">-<fmt:formatNumber value="0" pattern="#,###"/> 원</span> <!--이거 위에인풋에 넣은값 넣어주고 결제버튼 눌리면 회원포인트에서 마이너스 해줘야함 -->
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            등급할인<span>-0 원</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center"
                                            id="total_color">
                                            <strong class="total_color">총 결제금액</strong>
                                            <strong class="total_color" id="finalPrice" data-original-price="${fclassVo.price * regCount}"><fmt:formatNumber value="${fclassVo.price * regCount}" pattern="#,### 원"/></strong>
                                        </li>
                                    </ul>
                                </div>

                                <!-- 결제수단 선택 라디오 버튼 -->

                                <div class="check_row_method" id="check_row_method">
                                    <div class="row"><span class="label">결제 수단 선택</span><span class="val">
                                <b class="total"></b></span></div>
                                    <div class="row">
                                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                            <input type="radio" class="btn-check" name="btnradio" id="btnradio1"
                                                   autocomplete="off" checked>
                                            <label class="btn btn-outline-primary" for="btnradio1" onclick="creditCard()">신용카드</label>

                                            <input type="radio" class="btn-check" name="btnradio" id="btnradio2"
                                                   autocomplete="off">
                                            <label class="btn btn-outline-primary" for="btnradio2" onclick="creditCardInput()">신용카드(직접입력)</label>

                                            <input type="radio" class="btn-check" name="btnradio" id="btnradio3"
                                                   autocomplete="off">
                                            <label class="btn btn-outline-primary" for="btnradio3" onclick="mootong()">무통장입금</label>

                                            <input type="radio" class="btn-check" name="btnradio" id="btnradio4"
                                                   autocomplete="off">
                                            <label class="btn btn-outline-primary" for="btnradio4" onclick="kakaoPay()">카카오페이</label>
                                        </div>
                                    </div>

                                    <!-- 결제 정보 입력창 -->

                                    <!-- 신용카드 -->
                                    <div class="checkout_method_card" id="credit_card_input" style="border-top: none;">
                                        <div class="more">* 신용카드 정보를 직접 입력하여 간편하게 결제하실 수 있습니다. <br>* 꾸까에서는 절대 카드 정보를 직접 저장하지
                                            않습니다. <br>* 나이스 정보통신의 결제 기능을 사용합니다. <br>* 기명 법인카드의 경우, 소유하신 분의 주민등록번호 앞자리를
                                            입력해주세요. <br>* 무기명 법인카드의 경우, 사업자 등록번호를 입력해 주세요.</div>
                                        <table class="address_input_table in_s4 w450">
                                            <caption class="blind"></caption>
                                            <tbody>
                                            <tr>
                                                <td><div class="detail add_200721"><span class="th">카드 번호</span>
                                                    <div class="td_card">
                                                        <div class="card_number" style="width: 24%;">
                                                            <input maxlength="4" name="card_num_1" id="card_num_1" type="text"
                                                                   data-type="card_number" data-index="0" autocomplete="off" value="">
                                                        </div><span class="d"
                                                                                                                style="width: 2%;">-</span>
                                                                <div class="card_number" style="width: 23%;"><input
                                                                        maxlength="4" name="card_num_2" id="card_num_2"
                                                                        data-type="card_number" data-index="1"
                                                                        type="password"
                                                                        class="ui-keyboard-input ui-widget-content ui-corner-all ui-keyboard-lockedinput"
                                                                        aria-haspopup="true" role="textbox"
                                                                        autocomplete="off" readonly="readonly" value="">
                                                                </div><span class="d" style="width: 2%;">-</span>
                                                                <div class="card_number" style="width: 23%;"><input
                                                                        maxlength="4" name="card_num_3" id="card_num_3"
                                                                        data-type="card_number" data-index="2"
                                                                        type="password"
                                                                        class="ui-keyboard-input ui-widget-content ui-corner-all ui-keyboard-lockedinput"
                                                                        aria-haspopup="true" role="textbox"
                                                                        autocomplete="off" readonly="readonly" value="">
                                                                </div><span class="d" style="width: 2%;">-</span>
                                                                <div class="card_number" style="width: 24%;"><input
                                                                        maxlength="4" name="card_num_4" id="card_num_4"
                                                                        data-type="card_number" data-index="3" type="text"
                                                                        class="form-control form-control-small"
                                                                        autocomplete="off" value=""></div>
                                                            </div></div></td>
                                            </tr>
                                            <tr>
                                                <td><span class="detail add_200721"><span class="th">유효 기간
                                                                (년/월)</span><span class="td_phone"><select
                                                        class="form-control form-control-small"
                                                        name="card_exp_year" id="card_exp_year"
                                                        data-type="card_valid" data-index="0"
                                                        style="width: 48%;">
                                                        <c:forEach var="year" begin="2021" end="2035">
                                                        <option value="${year}">${year}</option>
                                                        </c:forEach>
                                                                </select><span class="d" style="width: 4%;">-</span><select
                                                        class="form-control form-control-small"
                                                        name="card_exp_month" id="card_exp_month"
                                                        data-type="card_valid" data-index="1"
                                                        style="width: 48%;">
                                                                <c:forEach var="month" begin="01" end="12">
                                                                <option value="${month}">${month}</option>
                                                                </c:forEach>
                                                                </select></span></span></td>
                                            </tr>
                                            <tr>
                                                <td><span class="detail add_200721"><span class="th">주민등록번호
                                                                앞자리</span><span class="td" style="width: 48%;"><input
                                                        autocomplete="off"
                                                        class="form-control form-control-small" maxlength="10"
                                                        name="card_id" id="card_id" type="text"
                                                        data-type="card_id" data-index="1"
                                                        value=""></span></span></td>
                                            </tr>
                                            <tr>
                                                <td><span class="detail add_200721"><span class="th">비밀번호 앞
                                                                두자리</span><span class="td" style="width: 48%;"><input
                                                        autocomplete="off"
                                                        class="form-control form-control-small ui-keyboard-input ui-widget-content ui-corner-all ui-keyboard-lockedinput"
                                                        id="card_password" maxlength="2" name="card_password"
                                                        type="password" aria-haspopup="true" role="textbox"
                                                        data-type="card_password" data-index="0"
                                                        readonly="readonly"></span></span></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>



                                    <!-- 무통장 입금 -->
                                    <div id="mootong" class="checkout_method_more">
                                        <div class="more">입금자명 <input type="text" name="pre-mootong-name"
                                                                      id="pre-mootong-name" value=""> 미기재시 주문자명으로 자동 반영</div>
                                        <div class="noti">* 주문 후 72시간동안 미 입금시 자동 주문 취소됩니다.</div>
                                        <div class="recept_money">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                                <label class="form-check-label" for="inlineRadio1">개인소득공제용</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                                <label class="form-check-label" for="inlineRadio2">사업자증빙용</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                                                <label class="form-check-label" for="inlineRadio3">미신청</label>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>

                            <div class="complete"><button type="button" class="info_btn next" id="purchase_submit"><span>
                        결제 하기</span></button><button type="button" class="info_btn back" onclick="history.back()">
                                <span>이전 단계로</span></button>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>

<%@ include file="../main/footer.jspf"%>
</body>
</html>
