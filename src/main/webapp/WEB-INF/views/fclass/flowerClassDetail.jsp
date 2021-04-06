<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>클래스 상세페이지</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="/static/css/fclass/classDetail.css">
    <link rel="stylesheet" href="/static/bootstrap-datepicker/bootstrap-datepicker.css">
<script src="/static/bootstrap-datepicker/bootstrap-datepicker.js"></script>
<script>
    function moveToTop() {
        window.scrollTo({
            top: 0,
            left: 0,
            behavior: 'smooth'
        });
    }
</script>
</head>
<body>
<%@ include file="../main/header.jspf"%>

<!-- 맨위로 가는 버튼 -->
<button type="button" id="moveToTop" onclick="moveToTop()">
    <i class="far fa-arrow-alt-circle-up"></i>
</button>

<!-- 메인 컨테이너 -->
<div id="container" class="mx-auto">
<form method="get" action="/fclass/payment">

    <!-- 상품 썸네일과 주문 정보 -->
    <div id="pt-70" class="d-flex justify-content-between thumb-order">
        <!-- 사진 썸네일 -->
        <div class="thumbnails d-flex flex-column justify-content-start">
            <div class="mb-4" style="width: 533px; max-height: 533px; overflow: hidden">
                <img src="${fclassVo.image1}" alt="대표 썸네일" class="col-12" style="width: 533px; height: auto;">
            </div>
            <div class="d-flex justify-content-between col-12" style="overflow: hidden; height: 161px;">
                <div class="d-flex col-4" style="overflow: hidden; width: 161px;">
                    <img name="fclassImage" src="${fclassVo.image1}" alt="썸네일1" class="col">
                </div>
                <c:if test="${not empty fclassVo.image2}">
                <div class="d-flex col-4" style="overflow: hidden; width: 161px;">
                    <img src="${fclassVo.image2}" alt="썸네일2" class="col">
                </div>
                </c:if>
                <c:if test="${not empty fclassVo.image3}">
                <div class="d-flex col-4" style="overflow: hidden; width: 161px;">
                    <img src="${fclassVo.image3}" alt="썸네일3" class="col">
                </div>
                </c:if>
            </div>
        </div>

        <!-- 주문 정보 -->
        <div class="order-info d-flex flex-column">
            <span class="subheader">${fclassVo.subheader}</span>
            <span class="item-name" name="fclassName">${fclassVo.name}</span>

            <!-- 가격 정보 -->
            <div class="d-flex justify-content-start align-items-center pb-4 border-bottom" style="border-bottom-color: #9d9d9d">
                <c:if test="${not empty fclassVo.discountRate && fclassVo.discountRate > 0}">
                <span class="discount-rate text-danger pe-2">${fclassVo.discountRate}%</span>
                <span class="original-price text-decoration-line-through pe-2">
                        <fmt:formatNumber value="${fclassVo.price}" pattern="#,###원 >"/>
                </span>
                </c:if>
                <span class="fs-3 fw500" name="payTotal" data-flower-finalPrice>
                    <fmt:formatNumber value="${fclassVo.finalPrice}" pattern="#,###원"/>
                </span>
            </div>

            <!-- 구매옵션 -->
            <div class="row inputs-wrap mb-4 pt-3">
                <!-- 지점 선택 옵션 -->
                <div class="row mb-4">
                    <div class="col-3 fw500 pt-1">지점</div>
                    <div id="branchSelectArea" class="col-9" role="group">
                        <c:forEach var="branch" items="${branchList}" varStatus="status">
                        <label>
                            <input type="radio" ${status.index eq 0 ? "checked" : ""}
                                   name="branchIdx" value="${branch.idx}"
                                   class="branchBtn border p-2 rounded-3 btn-check">
                            <span class="btn btn-outline-warning text-dark me-1" name="branchName">
                                    ${branch.name}
                            </span>
                        </label>
                        </c:forEach>
                    </div>
                </div>
                <!-- 수업일 선택 옵션 -->
                <div class="row mb-4">
                    <div class="col-3 fw500 pt-1">수강일</div>
                    <div class="col-9">
                        <input type="text" name="requestDate" placeholder="수업 날짜를 선택해주세요."
                               name="scheduleDate"
                               class="schedule-datepicker col-12 p-2 ps-3 fs-6"
                               onclick="checkValidDate()"
                               onchange="searchSchedule(this.value)"
                               autocomplete="off" required="required"/>
                        <div>
                            <select id="scheduleSelect" class="form-select mt-3 text-secondary ps-3 py-2" disabled>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- 수강인원 선택 옵션 -->
                <div class="row mb-4">
                    <div class="col-3 fw500">수강인원</div>
                    <div class="col-9 count d-flex justify-content-start align-items-center">
                        <button type="button" class="border-0 bg-transparent" onclick="adjustQuantity(false)">
                            <i class="fas fa-minus-circle"></i>
                        </button>
                        <span id="regCount" name="regCount" class="quantity col-2 text-center" data-fclass-regCount>1</span>
                        <button type="button" class="border-0 bg-transparent" onclick="adjustQuantity(true)">
                            <i class="fas fa-plus-circle"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- price box 그룹 -->
            <div class="price-box-wrap">
                <!-- 상품가격 price box -->
                <div class="d-flex justify-content-between p-4 mx-2 mb-3 price-box">
                    <span class="fw500">클래스 수업가격</span>
                    <span id="classPrice" class="fw500" data-fclass-price="${fclassVo.finalPrice}">
                        <fmt:formatNumber value="${fclassVo.finalPrice}" pattern="#,###원"/>
                    </span>
                </div>
            </div> <!-- price-box-wrap 닫기 -->

            <div class="d-flex justify-content-end align-items-baseline me-2 mb-4">
                <span class="me-3">총 주문금액</span>
                <span id="totalPrice" name="payTotal" class="fw-bold fs-3">
                    <fmt:formatNumber value="${fclassVo.finalPrice}" pattern="#,###원"/>
                </span>
            </div>

            <!-- 결제 버튼 -->
            <div class="d-flex justify-content-center mt-5">

                <button type="submit" class="btn main-button fw-bold py-3">클래스 예약하기</button>
            </div>

        </div>
    </div>

    <!-- 상품설명/리뷰/클래스안내 Tabs -->
    <div class="d-flex showType-wrap">
        <label class="col-4">
            <input type="radio" name="showType" class="d-none" checked="">
            <span class="d-block text-center p-3 btn-show" onclick="animateScroll('#detail-area')">클래스 설명</span>
        </label>
        <label class="col-4">
            <input type="radio" name="showType" class="d-none">
            <span class="d-block text-center p-3 btn-show" onclick="animateScroll('#review-area')">리뷰</span>
        </label>
        <label class="col-4">
            <input type="radio" name="showType" class="d-none">
            <span class="d-block text-center p-3 btn-show" onclick="animateScroll('#delivery-area')">수강안내</span>
        </label>
    </div>

    <!-- 상품설명 -->
    <div id="detail-area" class="d-flex justify-content-center">
    </div>

    <!-- 리뷰게시판 -->
    <hr>
    <div id="review-area">리뷰게시판!!!</div>

    <!-- 배송안내 -->
    <hr>
    <div id="delivery-area">수강안내</div>

</form>
</div> <!-- #container 닫기 -->

<%@ include file="../main/footer.jspf"%>

<script>
    const totalPriceEl = document.querySelector("#totalPrice");

    async function searchSchedule(date) {
        const data = {
            fclassIdx: ${fclassVo.idx},
            branchIdx: document.querySelector("#branchSelectArea input[type=radio]:checked").value,
            sdate: date
        }

        const option = {
            method: 'post',
            body: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json;charset=utf-8"
            }
        }

        const response = await fetch("/admin/fclass/api/searchSchedule", option)
        const result = await response.json();
        console.log(result);
        const $scheduleSelect = document.querySelector("#scheduleSelect");
        $scheduleSelect.innerHTML = "";

        result.forEach(function (schedule) {
            const $option = document.createElement("option");
            $option.value = schedule.index;
            $option.innerText = schedule.startTime + " ~ " + schedule.endTime;
            $scheduleSelect.appendChild($option);
        })

        if (result.length) {
            if ($scheduleSelect.hasAttribute("disabled")) {
                $scheduleSelect.removeAttribute("disabled");
            }
        } else {
            $scheduleSelect.setAttribute("disabled", "true");
        }

    }

    function dateToString(dateString) { // YY-MM-DD 형태로 변환
        let date = new Date(dateString);
        let year = date.getFullYear();
        let month = date.getMonth() + 1;
        let day = date.getDate();
        month = month < 10 ? '0' + month : month;
        day = day < 10 ? '0' + day : day;

        return year + "-" + month + "-" + day;
    }

    async function checkValidDate() {
        // let disabledArrayInit = [];
        //
        // let today = new Date().getTime();
        // for(let i = 0; i < 60; i++) {
        //     let dateString = dateToString(today + 1000 * 60 * 60 * 24 * i);
        //     disabledArrayInit.push(dateString);
        // }

        let disabledArrayInit = Array.from({length: 60}, //60일치 배열 생성
            (v, i) => dateToString(new Date().getTime() + i * 1000 * 60 * 60 * 24));    // 콜백함수 1초 / 1분 / 1시간 / 하루

        let data = {
            branchIdx: document.querySelector("#branchSelectArea input[type=radio]:checked").value,
            fclassIdx: ${fclassVo.idx}
        };

        let option = {
            method: "post",
            body: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json;charset=utf-8"
            }
        };

        let response = await fetch("/admin/fclass/api/searchSchedule", option);
        let result = await response.json();
        console.log(result);

        for (let scheduleVo of result) {
            disabledArrayInit = disabledArrayInit.filter(value => value !== dateToString(scheduleVo.sdate));
            // let sdateString = dateToString(scheduleVo.sdate);
            // let number = disabledArrayInit.indexOf(sdateString);
            // disabledArrayInit.splice(number, 1);
        }
        $('.schedule-datepicker').datepicker("setDatesDisabled", disabledArrayInit);
    }

    function findClassTime(btn) {

    }


    /* 꽃다발 상품 수량 증감 */
    function adjustQuantity(isUp) {
        const regCountEl = document.querySelector("#regCount");
        const classPriceEl = document.querySelector("#classPrice");
        const totalPriceEl = document.querySelector("#totalPrice");

        let regCount = parseInt(regCountEl.innerText.toString());
        let classPrice = classPriceEl.dataset.fclassPrice;

        console.log(regCountEl);
        if (isUp) {
            regCount = regCount + 1;
        } else {
            if (regCount > 1) {
                regCount = regCount -1;
            }
        }
        classPrice = classPrice * regCount;
        regCountEl.innerText = regCount;
        totalPriceEl.innerText = classPrice.toLocaleString("ko-KR") + "원";

    }

    /* 총 주문금액 계산하기 */
    function configTotal() {
        const $flowerFinalPrice = document.querySelector("[data-flower-finalPrice]");
        const $flowerQuantity = document.querySelector("[data-flower-quantity]");
        const $letterPrice = document.querySelector("[data-letter-price]");
        const $choicePrice = document.querySelectorAll("[data-choice-price]");

        let flowerFinalPrice = $flowerFinalPrice.textContent.trim().replace("원", "").replaceAll(",", "");
        let flowerQuantity = $flowerQuantity.textContent;
        let letterPrice = $letterPrice.textContent.trim().replace("원", "").replaceAll(",", "");
        let totalPrice = flowerFinalPrice * flowerQuantity;

        if ($choicePrice) {
            for (let i = 0; i < $choicePrice.length; i++) {
                let choicePrice = $choicePrice[i].textContent.trim().replace("원", "").replaceAll(",", "");
                totalPrice += Number(choicePrice);
            }
        }
        if (letterOptionsEl[0].checked) {
            totalPrice += Number(letterPrice);
        }

        totalPriceEl.textContent = totalPrice.toLocaleString('ko-KR') + "원";
    }

    /* 수강일 선택 */
    $(function () {
        $('.schedule-datepicker').datepicker({
            autoclose: true,
            format: 'yyyy-mm-dd',
            showOtherMonths: false,
            startDate: 'noBefore',
            endDate: '+30d',
            setDate: 'today',
            todayHighlight: true,
            title: '등록하실 클래스 날짜를 선택해주세요.',
            language: 'ko'
        });
    })


    function goPay(cartVo, frm) {
        console.log("goPay()실행. cartVo: " + cartVo);
        const oitemVoList = [
            {hasLetter: letterOptionsEl[0].checked},
            {name: cartVo.name},
            {price: cartVo.totalPrice},
            {options: cartVo.options},
            {image: cartVo.image},
            {requestDate: cartVo.requestDate},
            {category: cartVo.category},
            {quantity: cartVo.quantity},
            {reviewCheck: 0}
        ];

        let data = document.createElement("input");
        data.type = "text";
        data.name = "data";
        data.value = JSON.stringify(oitemVoList);

        console.log("data.value: " + data.value);

        // deleteFromCart(cartVo.idx);

        frm.appendChild(data);
        frm.action = "/order/letter";
        frm.submit();
    }


    function animateScroll(locationStr) {
        let headerHeight = document.querySelector("header").offsetHeight;
        let targetScrollVal = document.querySelector(locationStr).offsetTop;
        window.scrollTo({top:targetScrollVal - headerHeight, behavior:'smooth'});
    }
</script>
</body>
</html>
<style>

</style>