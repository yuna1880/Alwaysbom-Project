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
<form method="post">
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
            <div class="d-flex">
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
                        <input type="text" name="requestDate" placeholder="수령일을 선택해주세요." class="datepicker col-12 p-2 ps-3 fs-6"/>
                    </div>
                </div>

                <!-- 수량 선택 옵션 -->
                <div class="row mb-4">
                    <div class="col-3 fw500">수량</div>
                    <div class="col-9 count d-flex justify-content-start align-items-center">
                        <button type="button" class="border-0 bg-transparent" onclick="adjustQuantity(false)">
                            <i class="fas fa-minus-circle"></i>
                        </button>
                        <span class="quantity col-2 text-center" data-flower-quantity>1</span>
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
                                   id="withLetter" value="1" checked onclick="checkRadioBtn(true)">
                            <label class="form-check-label text-dark fw500" for="withLetter">추가할게요.(+2,500원)</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="letterOptions"
                                   id="withoutLetter" value="0" onclick="checkRadioBtn(false)">
                            <label class="form-check-label" for="withoutLetter">추가하지 않을게요.</label>
                        </div>
                    </div>
                </div>

                <!-- 소품샵 아이템 추가 옵션 -->
                <div class="row mb-4">
                    <div class="col-3 fw500">추가 옵션</div>
                    <div class="col-9">
                        <select name="selectOptions" class="form-select p-2 ps-3" aria-label="form-select example"
                                onchange="addChoices(this)">
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
                <button type="button" class="btn sub-button fw-bold py-3 me-2" onclick="addCart(true, this.form)">장바구니</button>

            <%--memberId, category, flowerIdx, quantity, letter 임의로 넣어주기--%>
                <input type="hidden" name="memberId" value="test">
                <input type="hidden" name="category" value="꽃다발">
                <input type="hidden" name="flowerIdx" value="${flowerVo.idx}">

                <button type="button" class="btn main-button fw-bold py-3" onclick="addCart(false, this.form)">바로구매</button>
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
</form>
</div> <!-- #container 닫기 -->

<%@ include file="../main/footer.jspf"%>

<script>
    const letterOptionsEl = document.getElementsByName("letterOptions");
    const totalPriceEl = document.querySelector("#totalPrice");

    /* 편지 추가, 추가안함 */
    function checkRadioBtn(isAdded) {
        if (isAdded) { // 편지 추가 O
            letterOptionsEl[1].nextElementSibling.classList.remove("text-dark", "fw500");
            letterOptionsEl[0].nextElementSibling.classList.add("text-dark", "fw500");
            document.querySelector("#addLetter").classList.remove("d-none");
        } else { // 편지 추가 X
            letterOptionsEl[0].nextElementSibling.classList.remove("text-dark", "fw500");
            letterOptionsEl[1].nextElementSibling.classList.add("text-dark", "fw500");
            document.querySelector("#addLetter").classList.add("d-none");
        }
        configTotal();
    }

    /* 꽃다발 상품 수량 증감 */
    function adjustQuantity(isUp) {
        const flowerQuantityEl = document.querySelector("[data-flower-quantity]");
        let quantity = flowerQuantityEl.textContent;
        if (isUp) {
            quantity++;
        } else {
            if (quantity > 1) {
                quantity--;
            }
        }
        flowerQuantityEl.textContent = quantity;
        configTotal();
    }

    /* 추가옵션의 수량 변경 */
    function adjustChoiceQuantity(isUp, btn) {
        const $choicePrice = btn.parentElement.nextElementSibling;
        let choiceOriginalPrice = Number($choicePrice.dataset.choicePrice);
        let quantity;
        if (isUp) {
            quantity = btn.previousElementSibling.textContent;
            quantity++;
            btn.previousElementSibling.textContent = quantity;
        } else {
            quantity = btn.nextElementSibling.textContent;
            if (quantity > 1) {
                quantity--;
                btn.nextElementSibling.textContent = quantity;
            }
        }
        let finalChoicePrice = choiceOriginalPrice * quantity;
        $choicePrice.textContent = finalChoicePrice.toLocaleString('ko-KR') + "원";
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
    function addChoices(selectBox) {
        const $choices = selectBox.options;
        let choiceIdx;
        // $choices[0].value: 함께하면 좋은 추천상품
        // $choices[1].value: 23 (ProductVo Idx)
        // $choices[2].value: 22 ...

        for (let i = 0; i < $choices.length; i++) {
            if (i > 0) {
                if ($choices[i].selected) {
                    choiceIdx = $choices[i].value;
                }
            } else {
                choiceIdx = null;
            }
        }

        // ajax 처리
        let processOption = {
            method: 'post',
            headers: {
                'Content-Type': 'application/json;charset=UTF-8'
            }
        }
        if (choiceIdx) {
            fetch("/product/" + choiceIdx + "/get", processOption)
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

        newDiv.className =  "choice-price-box p-4 mx-2 mb-3 price-box";
        newDiv.setAttribute("data-product-idx", pvo.idx);
        newDiv.innerHTML =  "<div class='d-flex justify-content-between pb-1'>"
                            + "<span class='fw500'>추가상품 : " + pvo.name + "</span>"
                            + "<button type='button' class='btn-close btn-close-style' "
                            + "onclick='deleteChoice(this)'></button></div>"
                            + "<div class='d-flex justify-content-between'>"
                            + "<div class='col-3 count d-flex justify-content-between align-items-center'>"
                            + "<button type='button' class='border-0 bg-transparent' onclick='adjustChoiceQuantity(false, this)'>"
                            + "<i class='fas fa-minus-circle'></i></button>"
                            + "<span class='quantity col-1 text-center'>1</span>"
                            + "<button type='button' class='border-0 bg-transparent' onclick='adjustChoiceQuantity(true, this)'>"
                            + "<i class='fas fa-plus-circle'></i></button></div>"
                            + "<span class='fw500' data-choice-price=" + pvo.finalPrice + ">" + pvo.finalPrice.toLocaleString('ko-KR') + "원</span>"
                            + "</div>";

        // 이미 만들어진 애들 중에 동일 인덱스 있나 보고, 있으면 기존것에 수량만 합치고 없으면 따로 추가
        const $choices = document.querySelectorAll(".choice-price-box");
        let btnUp;
        let choiceExists = false;
        if ($choices) {
            for (let i = 0; i < $choices.length; i++) {
                let productIdx = Number($choices[i].dataset["productIdx"]);
                if (pvo.idx === productIdx) {
                    console.log("pvo.idx= " + pvo.idx + ", productidx= " + productIdx);
                    console.log("중복값이 존재합니다.");
                    btnUp = $choices[i].getElementsByTagName('button')[2];
                    choiceExists = true;
                    break;
                }
            }
            if (choiceExists) {
                adjustChoiceQuantity(true, btnUp);
            } else {
                priceBoxWrap.appendChild(newDiv);
            }
        } else {
            priceBoxWrap.appendChild(newDiv);
        }
    }

    /* 추가한 옵션들의 priceBox 닫기 */
    function deleteChoice(closeBtn) {
        const priceBoxWrap = document.querySelector(".price-box-wrap");
        let removedObj = closeBtn.parentElement.parentElement;
        priceBoxWrap.removeChild(removedObj);
        configTotal();
    }

    /* 장바구니 보내기 */
    async function addCart(goCart, frm) {
        const $inputs = document.getElementsByTagName("input");
        const $choices = document.querySelectorAll(".choice-price-box");
        const $flowerQuantity = document.querySelector("[data-flower-quantity]");

        const choices = [...$choices].map((choice) => {
            return {
                productIdx: choice.dataset.productIdx,
                quantity: choice.querySelector(".quantity").textContent
            }
        });

        const cartVo = {
            memberId: $inputs.memberId.value,
            category: $inputs.category.value,
            flowerIdx: $inputs.flowerIdx.value,
            quantity: $flowerQuantity.textContent,
            requestDate: $inputs.requestDate.value,
            letter: letterOptionsEl[0].checked ? 1 : 0,
            choices: choices
        };

        const option = {
            method: 'post',
            body: JSON.stringify(cartVo),
            headers: {
                'Content-Type': 'application/json;charset=UTF-8'
            }
        }

        const response = await fetch("/api/carts", option);
        const result = await response.json();
        console.log(result);

        if (goCart && result) {
            location.href = "/cart/list";
        } else if (!goCart && result) {
            goPay(result, frm);
        }
    }

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
        console.log("oitemVoList: " + oitemVoList);

        let data = document.createElement("input");
        data.type = "text";
        data.name = "data";
        data.value = JSON.stringify(oitemVoList);

        console.log("data.value: " + data.value);

        frm.appendChild(data);
        frm.action = "/order/letter";
        frm.submit();
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
