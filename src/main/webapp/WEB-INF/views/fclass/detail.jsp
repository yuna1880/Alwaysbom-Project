<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>클래스상세</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="static/css/main.css">
</head>
<body>
<%@ include file="../main/header.jspf"%>
<div id="container" class="mx-auto">
    <!-- 멤버정보, FCB, schedule 필요 !!!!!!! -->
    <!-- 메뉴 경로 표시 -->
<%--    <nav id="bread-nav" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb mb-3">
            <li class="breadcrumb-item"><a href="/">HOME</a></li>
            <li class="breadcrumb-item"><a href="/flower">꽃다발</a></li>
            <li class="breadcrumb-item active" aria-current="page">${flowerVo.name}</li>
        </ol>
    </nav>--%>

    <!-- 상품 썸네일과 주문 정보 -->
    <div class="d-flex justify-content-between">
        <!-- 사진 썸네일 -->
        <div class="thumbnails d-flex flex-column justify-content-start">
            <div class="mb-4">
                <img src="${flowerVo.image1}" alt="대표 썸네일"
                     class="img-big">
            </div>
            <div class="d-flex justify-content-between img-sm-wrap">
                <img src="${flowerVo.image1}" alt="썸네일1" class="img-sm">
                <c:if test="${not empty flowerVo.image2}">
                    <img src="${flowerVo.image2}" alt="썸네일2" class="img-sm">
                </c:if>
                <c:if test="${not empty flowerVo.image3}">
                    <img src="${flowerVo.image3}" alt="썸네일3" class="img-sm">
                </c:if>
            </div>
        </div>
        <div class="margin-between"></div>
        <!-- 주문 정보 -->
        <div class="order-info d-flex flex-column">
            <span class="subheader">${flowerVo.subheader}</span>
            <span class="item-name">${flowerVo.name}</span>
            <div class="d-flex justify-content-start align-items-center">
                <c:if test="${not empty flowerVo.discountRate && flowerVo.discountRate > 0}">
                    <span class="discount-rate text-danger pe-2">${flowerVo.discountRate}%</span>
                    <span class="original-price text-decoration-line-through pe-2">${flowerVo.price}원 ></span>
                </c:if>
                <span class="final-price">${flowerVo.finalPrice}원</span>
            </div>
            <div class="fd-announcement d-flex justify-content-start py-3 my-3">
                3만원 이상 구매시, <span class="point-color fw500 ps-1">무료배송!</span>
            </div>
            <div class="inputs-wrap">
                <div class="row">
                    <div class="col-3 fw500">수령일</div>
                    <div class="col-9">수령일을 선택해주세요.</div>
                </div>
                <div class="row">
                    <div class="col-3 fw500">수량</div>
                    <div class="col-9 count">
                        <button type="button" class="border-0" onclick="countDown()">
                            <i class="fas fa-minus-circle"></i>
                        </button>
                        <span id="quantity">1</span>
                        <button type="button" class="border-0" onclick="countUp()">
                            <i class="fas fa-plus-circle"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-between p-3 mx-2 mb-3 price-box">
                <span class="fw500">상품가격</span>
                <span class="fw500">${flowerVo.finalPrice}원</span>
            </div>

            <c:if test="${not empty flowerVo.freeDeliveryMessage}">
                <div class="d-flex justify-content-end mb-1 me-2">
                    <span class="badge rounded-pill price-box text-dark fw500">
                            ${flowerVo.freeDeliveryMessage}
                    </span>
                </div>
            </c:if>
            <div class="d-flex justify-content-end align-items-baseline me-2">
                <span class="me-3">총 주문금액</span>
                <span class="fw-bold fs-6">19,900원</span>
            </div>



        </div>
    </div> <!-- 상품 썸네일 & 주문 정보 닫기 -->

</div> <!-- #container 닫기 -->

<%@ include file="../main/footer.jspf"%>

<script>
    let headerMenuColumns = document.getElementsByClassName("h-menu");
    let underBars = document.getElementsByClassName("under-bar");

    for (let i = 0; i < headerMenuColumns.length; i++) {
        headerMenuColumns[i].firstElementChild.classList.remove("menu-active");
    }
    for (let i = 0; i < underBars.length; i++) {
        underBars[i].classList.remove("menu-active");
    }
    document.querySelector("#flower").classList.add("menu-active");
    document.querySelector("#under-bar2").classList.add("menu-active");

    function checkRadioBtn(statusNum) {
        let letterOptions = document.getElementsByName("letterOptions");

        if (statusNum === 1) {
            letterOptions[1].nextElementSibling.classList.remove("text-dark", "fw500");
            letterOptions[0].nextElementSibling.classList.add("text-dark", "fw500");
            document.querySelector("#addLetter").classList.remove("d-none");
        } else {
            letterOptions[0].nextElementSibling.classList.remove("text-dark", "fw500");
            letterOptions[1].nextElementSibling.classList.add("text-dark", "fw500");
            document.querySelector("#addLetter").classList.add("d-none");
        }
    }

    function countUp() {
        let quantity = document.querySelector("#quantity");
        let qNum = Number(quantity.innerText);
        quantity.innerText = qNum + 1;
    }

    function countDown() {
        let quantity = document.querySelector("#quantity");
        let qNum = Number(quantity.innerText);
        if (qNum > 1) {
            quantity.innerText = qNum - 1;
        }
    }

    function closeLetter() {
        document.querySelector("#addLetter").classList.add("d-none");
        document.querySelector("#withoutLetter").checked = true;
        checkRadioBtn(0);
    }
</script>
</body>
</html>
