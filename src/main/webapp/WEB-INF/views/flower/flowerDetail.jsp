<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>꽃다발 상세페이지</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="/static/css/item/detail.css">
</head>
<body>
    <%@ include file="../main/header.jspf"%>

    <div id="container" class="mx-auto">
        <!-- 메뉴 경로 표시 -->
        <nav id="bread-nav" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb mb-3">
                <li class="breadcrumb-item"><a href="/">HOME</a></li>
                <li class="breadcrumb-item"><a href="/flower">꽃다발</a></li>
                <li class="breadcrumb-item active" aria-current="page">${flowerVo.name}</li>
            </ol>
        </nav>

        <!-- 상품 썸네일과 주문 정보 -->
        <div class="d-flex justify-content-between">
            <!-- 사진 썸네일 -->
            <div class="thumbnails d-flex flex-column justify-content-start">
                <div class="mb-4">
                    <img src="/static/upload/${flowerVo.image1}" alt="대표 썸네일"
                         class="img-big">
                </div>
                <div class="d-flex justify-content-between img-sm-wrap">
                    <img src="/static/upload/${flowerVo.image1}" alt="썸네일1" class="img-sm">
                    <c:if test="${not empty flowerVo.image2}">
                    <img src="/static/upload/${flowerVo.image2}" alt="썸네일2" class="img-sm">
                    </c:if>
                    <c:if test="${not empty flowerVo.image3}">
                    <img src="/static/upload/${flowerVo.image3}" alt="썸네일3" class="img-sm">
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
                    <div class="row">
                        <div class="col-3 fw500">편지 추가</div>
                        <div class="col-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="letterOptions"
                                       id="withLetter" value="option1" checked onclick="checkRadioBtn(1)">
                                <label class="form-check-label text-dark fw500" for="withLetter">추가할게요.(+2,500원)</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="letterOptions"
                                       id="withoutLetter" value="option2" onclick="checkRadioBtn(0)">
                                <label class="form-check-label" for="withoutLetter">추가하지 않을게요.</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 fw500">추가 옵션</div>
                        <div class="col-9">
                            <select class="form-select form-select" aria-label=".form-select-sm example">
                                <option selected>함께하면 좋은 추천상품</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-between p-3 mx-2 mb-3 price-box">
                    <span class="fw500">상품가격</span>
                    <span class="fw500"><fmt:formatNumber value="${flowerVo.finalPrice}" pattern="#,###원"/></span>
                </div>
                <!-- 편지추가 price box -->
                <div id="addLetter" class="p-3 mx-2 mb-3 price-box">
                    <div class="d-flex justify-content-between pb-1">
                        <span class="fw500">추가상품 : 편지추가</span>
                        <button type="button" class="btn-close btn-close-style" aria-label="Close"
                                onclick="closeLetter(this)"></button>
                    </div>
                    <div class="d-flex justify-content-end">
                        <span class="fw500">${flowerVo.letterPrice}원</span>
                    </div>
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
                    <span id="totalPrice" class="fw-bold fs-6">${flowerVo.finalPrice + flowerVo.letterPrice}원</span>
                </div>



            </div>
        </div> <!-- 상품 썸네일 & 주문 정보 닫기 -->

    </div> <!-- #container 닫기 -->

    <%@ include file="../main/footer.jspf"%>

<script>
    let totalPrice = document.querySelector("#totalPrice");
    let letterOptions = document.getElementsByName("letterOptions");

    function checkRadioBtn(statusNum) {
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
        configTotal();
    }

    function countDown() {
        let quantity = document.querySelector("#quantity");
        let qNum = Number(quantity.innerText);
        if (qNum > 1) {
            quantity.innerText = qNum - 1;
        }
        configTotal();
    }

    function closeLetter() {
        document.querySelector("#addLetter").classList.add("d-none");
        document.querySelector("#withoutLetter").checked = true;
        checkRadioBtn(0);
        totalPrice.innerHTML = (configTotal() - ${flowerVo.letterPrice}) + "원";
    }

    function configTotal() {
        let quantity = document.querySelector("#quantity");
        let qNum = Number(quantity.innerText);
        let total;
        /////// 옵션 추가값도 나중에 계산해야됨

        <%--if (letterOptions[0].checked) {--%>
        <%--    total += ${flowerVo.letterPrice};--%>
        <%--} else {--%>
        <%--    total -= ${flowerVo.letterPrice};--%>
        <%--}--%>
        total = qNum * ${flowerVo.finalPrice};
        totalPrice.innerHTML = total + "원";

        return total;
    }

    <%--
    async function getDetail() {
        let response = await fetch("/flower/${idx}/get");
        let result = await response.json();
        makeDetail(result);
    }

    fetch("/flower/${idx}/get")
        .then(function (response) {
            console.log(response);
            response.json().then(function (result) {
                console.log(result);
                makeDetail(result);
            });
        })
        .catch(function (err) {
            alert(err);
        });

    function makeDetail(vo) {
        let mainFlower = document.querySelector("#flower");
        let html = "<span>" + vo.name + "</span>";
        html += "<span>" + vo.subheader + "</span>";
        html += "<img src='/static/upload/"+ vo.image1+ "'>";

        mainFlower.innerHTML = html;
    }
    --%>


</script>
</body>
</html>
