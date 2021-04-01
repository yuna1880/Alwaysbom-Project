<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>꽃다발 상세페이지</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="/static/css/item/detail.css">
    <link rel="stylesheet" href="/static/bootstrap-datepicker/bootstrap-datepicker.css">
    <script src="/static/bootstrap-datepicker/bootstrap-datepicker.js"></script>
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
                <img src="${flowerVo.image1}" alt="대표 썸네일" class="col-12">
            </div>
            <div class="d-flex justify-content-between">
                <img src="${flowerVo.image1}" alt="썸네일1" class="col-4 pe-2">
                <c:if test="${not empty flowerVo.image2}">
                <img src="${flowerVo.image2}" alt="썸네일2" class="col-4 ps-1 pe-1">
                </c:if>
                <c:if test="${not empty flowerVo.image3}">
                <img src="${flowerVo.image3}" alt="썸네일3" class="col-4 ps-2">
                </c:if>
            </div>
        </div>

        <!-- 주문 정보 -->
        <div class="order-info d-flex flex-column">
            <span class="subheader">${flowerVo.subheader}</span>
            <span class="item-name">${flowerVo.name}</span>

            <!-- 가격 정보 -->
            <div class="d-flex justify-content-start align-items-center">
                <c:if test="${not empty flowerVo.discountRate && flowerVo.discountRate > 0}">
                <span class="discount-rate text-danger pe-2">${flowerVo.discountRate}%</span>
                <span class="original-price text-decoration-line-through pe-2">
                        <fmt:formatNumber value="${flowerVo.price}" pattern="#,###원 >"/>
                </span>
                </c:if>
                <span class="fs-3 fw500" data-flower-finalPrice>
                    <fmt:formatNumber value="${flowerVo.finalPrice}" pattern="#,###원"/>
                </span>
            </div>

            <!-- 무료배송 알림 -->
            <div class="fd-announcement d-flex justify-content-start py-3 my-4">
                3만원 이상 구매시, <span class="point-color fw500 ps-1">무료배송!</span>
            </div>

            <!-- 구매옵션 -->
            <div class="inputs-wrap mb-4">
                <!-- 수령일 선택 옵션 -->
                <div class="row mb-4">
                    <div class="col-3 fw500 pt-1">수령일</div>
                    <div class="col-9">
                        <input type="text" placeholder="수령일을 선택해주세요." class="datepicker col-12 p-2 ps-3 fs-6"/>
                    </div>
                </div>

                <!-- 수량 선택 옵션 -->
                <div class="row mb-4">
                    <div class="col-3 fw500">수량</div>
                    <div class="col-9 count d-flex justify-content-start align-items-center">
                        <button type="button" class="border-0 bg-transparent" onclick="adjustQuantity(false)">
                            <i class="fas fa-minus-circle"></i>
                        </button>
                        <span class="quantity col-1 text-center" data-flower-quantity>1</span>
                        <button type="button" class="border-0 bg-transparent" onclick="adjustQuantity(true)">
                            <i class="fas fa-plus-circle"></i>
                        </button>
                    </div>
                </div>

                <!-- 편지 추가 옵션 -->
                <div class="row mb-4 d-flex align-items-baseline">
                    <div class="col-3 fw500">편지 추가</div>
                    <div class="col-9">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="letterOptions"
                                   id="withLetter" value="option1" checked onclick="checkRadioBtn(true)">
                            <label class="form-check-label text-dark fw500" for="withLetter">추가할게요.(+2,500원)</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="letterOptions"
                                   id="withoutLetter" value="option2" onclick="checkRadioBtn(false)">
                            <label class="form-check-label" for="withoutLetter">추가하지 않을게요.</label>
                        </div>
                    </div>
                </div>

                <!-- 소품샵 아이템 추가 옵션 -->
                <div class="row mb-4">
                    <div class="col-3 fw500">추가 옵션</div>
                    <div class="col-9">
                        <select name="selectOptions" class="form-select p-2 ps-3" aria-label="form-select example"
                                onchange="addOptions(this)">
                            <option>함께하면 좋은 추천상품</option>
                            <c:forEach var="productVo" items="${productList}">
                            <c:if test="${not empty productVo}">
                            <option value="${productVo.idx}">
                                <div>${productVo.name}</div>
                                <div>
                                    <fmt:formatNumber value="${productVo.finalPrice}" pattern="#,###원"/>
                                </div>
                            </option>
                            </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>

            <!-- price box 그룹 -->
            <div class="price-box-wrap">
                <!-- 상품가격 price box -->
                <div class="d-flex justify-content-between p-4 mx-2 mb-3 price-box">
                    <span class="fw500">상품가격</span>
                    <span class="fw500">
                        <fmt:formatNumber value="${flowerVo.finalPrice}" pattern="#,###원"/>
                    </span>
                </div>

                <!-- 편지추가 price box -->
                <div id="addLetter" class="p-4 mx-2 mb-3 price-box">
                    <div class="d-flex justify-content-between pb-1">
                        <span class="fw500">추가상품 : 편지추가</span>
                        <button type="button" class="btn-close btn-close-style" onclick="closeLetter(this)"></button>
                    </div>
                    <div class="d-flex justify-content-end">
                        <span class="fw500" data-letter-price>
                            <fmt:formatNumber value="${flowerVo.letterPrice}" pattern="#,###원"/>
                        </span>
                    </div>
                </div>
            </div> <!-- price-box-wrap 닫기 -->



            <!-- 총 주문금액 -->
            <div class="d-flex justify-content-end mb-1 mt-3 me-2">
            <c:if test="${not empty flowerVo.freeDeliveryMessage}">
                <span class="badge rounded-pill price-box text-dark fw500">
                    ${flowerVo.freeDeliveryMessage}
                </span>
            </c:if>
            </div>
            <div class="d-flex justify-content-end align-items-baseline me-2 mb-4">
                <span class="me-3">총 주문금액</span>
                <span id="totalPrice" class="fw-bold fs-3">
                    <fmt:formatNumber value="${flowerVo.finalPrice + flowerVo.letterPrice}" pattern="#,###원"/>
                </span>
            </div>

            <!-- 장바구니/결제 버튼 -->
            <div class="d-flex justify-content-center mt-5">
                <button type="button" class="btn sub-button fw-bold py-3 me-2">장바구니</button>
                <button type="button" class="btn main-button fw-bold py-3">바로구매</button>
            </div>

        </div> <!-- 주문 정보 닫기 -->
    </div> <!-- 상품 썸네일 & 주문 정보 닫기 -->

    <!-- 상품설명/리뷰/배송안내 Tabs -->
    <ul class="nav detail-nav">
        <li class="nav-item col-4 text-center nav-active">
            상품설명
        </li>
        <li class="nav-item col-4 text-center">
            리뷰
        </li>
        <li class="nav-item col-4 text-center">
            배송안내
        </li>
    </ul>

</div> <!-- #container 닫기 -->

<%@ include file="../main/footer.jspf"%>

<script>
    const totalPriceEl = document.querySelector("#totalPrice");

    /* 편지 추가, 추가안함 */
    function checkRadioBtn(isAdded) {
        const letterOptionsEl = document.getElementsByName("letterOptions");

        if (isAdded) {
            letterOptionsEl[1].nextElementSibling.classList.remove("text-dark", "fw500");
            letterOptionsEl[0].nextElementSibling.classList.add("text-dark", "fw500");
            document.querySelector("#addLetter").classList.remove("d-none");
        } else {
            letterOptionsEl[0].nextElementSibling.classList.remove("text-dark", "fw500");
            letterOptionsEl[1].nextElementSibling.classList.add("text-dark", "fw500");
            document.querySelector("#addLetter").classList.add("d-none");
        }
        configTotal();
    }

    /* 꽃다발 상품 수량 증감 */
    function adjustQuantity(isUp) {
        const quantityEl = document.querySelector(".quantity");
        let quantity = quantityEl.textContent;
        if (isUp) {
            quantity++;
        } else {
            if (quantity > 1) {
                quantity--;
            }
        }
        quantityEl.textContent = quantity;
        configTotal();
    }

    /* letterPriceBox 닫기 버튼 눌렀을 때 */
    function closeLetter() {
        document.querySelector("#addLetter").classList.add("d-none");
        document.querySelector("#withoutLetter").checked = true;
        checkRadioBtn(false);
    }

    /* 총 주문금액 계산하기 */
    function configTotal() {
        const letterOptionsEl = document.getElementsByName("letterOptions");
        const flowerFinalPriceEl = document.querySelector("[data-flower-finalPrice]");
        const flowerQuantityEl = document.querySelector("[data-flower-quantity]");
        const letterPriceEl = document.querySelector("[data-letter-price]");
        const optionPriceEl = document.querySelectorAll("[data-option-price]");

        let flowerFinalPrice = flowerFinalPriceEl.textContent.trim().replace("원", "").replace(",", "");
        let flowerQuantity = flowerQuantityEl.textContent;
        let letterPrice = letterPriceEl.textContent.trim().replace("원", "").replace(",", "");
        let totalPrice = flowerFinalPrice * flowerQuantity;

        if (optionPriceEl) {
            for (let i = 0; i < optionPriceEl.length; i++) {
                let optionPrice = optionPriceEl[i].textContent.trim().replace("원", "").replace(",", "");
                totalPrice += Number(optionPrice);
            }
        }

        if (letterOptionsEl[0].checked) {
            totalPrice += Number(letterPrice);
        }

        totalPriceEl.textContent = totalPrice.toLocaleString('ko-KR') + "원";
    }

    /* 수령일 선택 */
    $(function () {
        $('.datepicker').datepicker({
            format: 'yyyy-mm-dd',
            showOtherMonths: false,
            startDate: 'noBefore',
            endDate: '+14d',
            setDate: 'today',
            todayHighlight: true,
            title: '원하시는 수령일을 설정해주세요.',
            language: 'ko'
        });
    })

    /* 추가옵션 선택시 */
    function addOptions(selectBox) {
        const optionItemsEl = selectBox.options;
        let optionItemIdx;
        // optionItemsEl[0].value: 함께하면 좋은 추천상품
        // optionItemsEl[1].value: 23 (ProductVo Idx)
        // optionItemsEl[2].value: 22 ...

        for (let i = 0; i < optionItemsEl.length; i++) {
            if (i > 0) {
                if (optionItemsEl[i].selected) {
                    optionItemIdx = optionItemsEl[i].value;
                }
            } else {
                optionItemIdx = null;
            }
        }

        // ajax 처리
        let processOption = {
            method: 'post',
            headers: {
                'Content-Type': 'application/json;charset=UTF-8'
            }
        }
        if (optionItemIdx) {
            fetch("/product/" + optionItemIdx + "/get", processOption)
                .then(function (response) {
                    console.log(response);
                    response.json().then(function (result) {
                        console.log(result);
                        makeNewPriceBox(result);
                        configTotal();
                    });
                })
                .catch(function (err) {
                    alert(err);
                });
        }
    }

    function makeNewPriceBox(pvo) {
        const priceBoxWrap = document.querySelector(".price-box-wrap");
        let newDiv = document.createElement("div");

        newDiv.className =  "option-price-box p-4 mx-2 mb-3 price-box";
        newDiv.innerHTML =  "<div class='d-flex justify-content-between pb-1'>"
                            + "<input type='hidden' name='option-idx' value='" + pvo.idx + "'>"
                            + "<span class='fw500'>추가상품 : " + pvo.name + "</span>"
                            + "<button type='button' class='btn-close btn-close-style' "
                            + "onclick='deleteOption(this)'></button></div>"
                            + "<div class='d-flex justify-content-end'>"
                            + "<span class='fw500' data-option-price>" + pvo.finalPrice.toLocaleString('ko-KR') + "원</span>"
                            + "</div>";

        // 이미 만들어진 애들 중에 동일 인덱스 있나 보고, 있으면 기존것에 수량만 합치고 없으면 따로 추가

        priceBoxWrap.appendChild(newDiv);
    }

    function deleteOption(closeBtn) {
        const priceBoxWrap = document.querySelector(".price-box-wrap");
        let removedObj = closeBtn.parentElement.parentElement;
        priceBoxWrap.removeChild(removedObj);
        configTotal();
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
        html += "<img src='"+ vo.image1+ "'>";

        mainFlower.innerHTML = html;
    }
    --%>


</script>
</body>
</html>
