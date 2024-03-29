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
<form method="post">

    <!-- 메뉴 경로 표시 -->
    <nav id="bread-nav" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb mb-3">
            <li class="breadcrumb-item"><a href="/">HOME</a></li>
            <li class="breadcrumb-item"><a href="/subs">정기구독</a></li>
            <li class="breadcrumb-item active" aria-current="page">${subsVo.name}</li>
        </ol>
    </nav>

    <!-- 상품 썸네일과 주문 정보 -->
    <div class="d-flex justify-content-between thumb-order">
        <!-- 사진 썸네일 -->
        <div class="thumbnails d-flex flex-column justify-content-start">
            <div class="mb-4">
                <img src="${subsVo.image1}" alt="대표 썸네일" class="col-12">
            </div>
            <div class="d-flex">
                <img src="${subsVo.image1}" alt="썸네일1" class="col-4 pe-3">
                <c:if test="${not empty subsVo.image2}">
                <img src="${subsVo.image2}" alt="썸네일2" class="col-4 ps-2 pe-2">
                </c:if>
                <c:if test="${not empty subsVo.image3}">
                <img src="${subsVo.image3}" alt="썸네일3" class="col-4 ps-3">
                </c:if>
            </div>
        </div>

        <!-- 주문 정보 -->
        <div class="order-info d-flex flex-column">
            <span class="subheader">${subsVo.subheader}</span>
            <span class="item-name">${subsVo.name}</span>

        <!-- 가격 정보 -->
        <div class="d-flex justify-content-start align-items-center">
            <span class="fs-3 fw500" data-subs-finalPrice>
            <fmt:formatNumber value="${subsVo.price}" pattern="#,###원"/>
            </span>
        </div>
        <!-- 꽃 사이즈 정보 -->
        <div class="d-flex justify-content-start align-items-center my-3">
            <h5><span class="badge rounded-pill bg-light text-dark" id="selectFsize" value="${subsVo.fsize}">${subsVo.fsize} 사이즈</span></h5>
        </div>

        <!-- 무료배송 알림 -->
        <div class="fd-announcement d-flex justify-content-start py-3 my-4">
            정기구독은 무조건, <span class="point-color fw500 ps-1">무료배송!</span>
        </div>

        <!-- 구매옵션 -->
        <div class="inputs-wrap mb-4">
            <!-- 수령일 선택 옵션 -->
            <div class="row mb-4">
                <div class="col-3 fw500 pt-1">수령일</div>
                <div class="col-9">
                    <input type="text" name="requestDate" placeholder="수령일을 선택해주세요."
                           class="datepicker col-12 p-2 ps-3 fs-6" autocomplete="off"/>
                </div>
            </div>

        <!-- 구독기간 선택 옵션 -->
        <div class="row mb-4">
            <div class="col-3 fw500 pt-1">구독 기간</div>
            <div class="col-9">
                <select name="selectMonth" id="selectMonth" class="form-select p-2 ps-3" aria-label="form-select example">
                    <option>구독 기간을 선택해주세요.</option>
                    <option value="1">1개월동안 X 2주마다</option>
                    <option value="2">2개월동안 X 2주마다</option>
                    <option value="6">6개월동안 X 2주마다</option>
                </select>
            </div>
        </div>

        <!-- 수량 선택 옵션 -->
            <div class="row mb-4">
                <div class="col-3 fw500">수량</div>
                <div class="col-9 count d-flex justify-content-start align-items-center">
                    <button type="button" class="border-0 bg-transparent" onclick="adjustQuantity(false)">
                        <i class="fas fa-minus-circle"></i>
                    </button>
                    <span class="quantity col-2 text-center" data-subs-quantity>1</span>
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
                            ${productVo.name}
                            <fmt:formatNumber value="${productVo.finalPrice}" pattern=" (#,###원)"/>
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
                    <fmt:formatNumber value="${subsVo.price}" pattern="#,###원"/>
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
                        <fmt:formatNumber value="${subsVo.letterPrice}" pattern="#,###원"/>
                    </span>
                </div>
            </div>
        </div> <!-- price-box-wrap 닫기 -->

        <!-- 총 주문금액 -->
<%--        <div class="d-flex justify-content-end mb-1 mt-3 me-2">--%>
<%--        <c:if test="${not empty flowerVo.freeDeliveryMessage}">--%>
<%--            <span class="badge rounded-pill price-box text-dark fw500">--%>
<%--                ${flowerVo.freeDeliveryMessage}--%>
<%--            </span>--%>
<%--        </c:if>--%>
<%--        </div>--%>
        <div class="d-flex justify-content-end align-items-baseline me-2 mb-4">
            <span class="me-3">총 주문금액</span>
            <span id="totalPrice" class="fw-bold fs-3">
                <fmt:formatNumber value="${subsVo.finalPrice + subsVo.letterPrice}" pattern="#,###원"/>
            </span>
        </div>

            <!-- 장바구니/결제 버튼 -->
            <div class="d-flex justify-content-center mt-5">
                <button type="button" class="btn sub-button fw-bold py-3 me-2" onclick="addCart(true, this.form)">장바구니</button>

            <%--memberId, category, flowerIdx, quantity, letter 임의로 넣어주기--%>
                <input type="hidden" name="memberId" value="test">
                <input type="hidden" name="category" value="정기구독">
                <input type="hidden" name="subsIdx" value="${subsVo.idx}">

                <button type="button" class="btn main-button fw-bold py-3" onclick="addCart(false, this.form)">바로구매</button>
            </div>

        </div> <!-- 주문 정보 닫기 -->
    </div> <!-- 상품 썸네일 & 주문 정보 닫기 -->

    <!-- 상품설명/리뷰/배송안내 Tabs -->
    <div class="d-flex showType-wrap">
        <label class="col-4">
            <input type="radio" name="showType" class="d-none" checked="">
            <span class="d-block text-center p-3 btn-show" onclick="animateScroll('#detail-area')">상품설명</span>
        </label>
        <label class="col-4">
            <input type="radio" name="showType" class="d-none">
            <span class="d-block text-center p-3 btn-show" onclick="animateScroll('#review-area')">리뷰</span>
        </label>
        <label class="col-4">
            <input type="radio" name="showType" class="d-none">
            <span class="d-block text-center p-3 btn-show" onclick="animateScroll('#delivery-area')">배송안내</span>
        </label>
    </div>

    <!-- 상품설명 -->
    <div id="detail-area" class="d-flex justify-content-center">
        <div>${subsVo.content}</div>
    </div>

    <!-- 리뷰게시판 -->
    <div id="review-area" class="p-3">
        <!-- 리뷰게시판 타이틀 -->
        <div class="d-flex justify-content-between align-items-baseline">
            <div class="d-flex align-items-baseline">
                <span class="fs-2 fw500 py-3 pe-5">리뷰</span>
                <span class="fs-5 c-666">리뷰 작성 시 200P 적립 (사진 등록 시 300P)</span>
            </div>
            <span class="fs-5"><a href="#">리뷰 쓰기</a></span>
        </div>

        <!-- 리뷰 카테고리 -->
        <div class="d-flex align-items-baseline review-category col-12">
            <label>
                <input type="radio" name="reviewCategory" class="d-none" checked="">
                <span class="d-block text-center py-3 px-4 btn-rev">정기구독 베스트 리뷰</span>
            </label>
            <label>
                <input type="radio" name="reviewCategory" class="d-none">
                <span class="d-block text-center py-3 px-4 btn-rev">이 상품의 리뷰</span>
            </label>
        </div>

        <!-- 배송안내 -->
        <div id="delivery-area" class="ps-3 my-4">
            <div class="fs-2 fw500 py-3">배송안내</div>
            <div class="c-666 d-flex flex-column">
                <hr>
                <div class="fs-5 fw500 mt-3">1. 배송 정보<br>1-1. 배송비 정책</div>
                <p>
                    [공통] 구매 금액 합산 30,000원 이상일 경우 배송비는 무료입니다.<br>
                    [유의사항] 정기구독 상품 및 일부 3만원 미만의 배송비 무료 상품은 구매금액 합산에 포함되지 않습니다.
                </p>

                <span class="fs-5 fw500">1-2. 일반배송 (택배배송)</span>
                <p>
                    [배송일] 선택하신 수령일 전날 발송되어 해당 일에 수령합니다.<br>
                    [배송방법] 우체국 택배를 통해서 배송되며, 카카오톡 알림톡을 통해 주문하신 분께 송장 번호를 개별적으로 공지합니다.<br>
                    [배송지역]  전국 모든 지역에 배송이 가능합니다. (제주도 및 도서 산간 지역은 1~2일 늦어질 수 있습니다.)<br>
                    [배송시간] 택배로 배송 당일 정확한 배송 시간 안내는 어려운 점 양해 부탁드려요.<br>
                    해당 주소지에 평소 우체국택배 집배원님이 배송 가시는 시간에 받아보실 수 있습니다.
                </p>

                <span class="fs-5 fw500">1-3. 새벽배송</span>
                <p>
                    [배송지역] 서울/경기 일부지역에만 제공되며, 섬/공단/학교/학교기숙사/병원/관공서는 배송이 불가합니다.<br>
                    [배송방법] 새벽배송 가능지역은 오전 7시 이전까지 작성하신 배송지로 배송되며, 그 외 지역은 일반배송 (택배배송)으로 발송됩니다.<br>
                    [배송시간] 오후 2시 이전 주문완료건에 대하여 다음날 오전 7시 이전까지 배송받을 수 있습니다.<br>
                    [배송비 정책] 새벽배송 가능지역일 경우, 추가비용없이 배송됩니다.<br>
                    [유의사항]<br>
                    - 새벽배송은 저온의 온도를 유지하기 위해 단열재 없이 배송됩니다.<br>
                    - 결제시, 공동현관 비밀번호 기입이 필수이며, 미기입시 1층 현관에 배송됩니다.
                </p>

                <span class="fs-5 fw500">▶ 새벽배송 가능지역 ◀</span>
                <p>
                    1) 전지역 가능<br>
                    서울, 안양시, 부천시, 구리시, 성남시, 수원시, 광명시, 의정부시, 안산시, 시흥시 (안산/시흥 공단지역 제외)<br>
                    <br>
                    2) 일부지역가능<br>
                    <u>광주시</u>  오포읍<br>
                    <br>
                    <u>고양시</u><br>
                    덕양구 – 성사동(성사1~2동), 화정동(화정1~2동), 행신동(행신1~3동), 주교동, 토당동, 도내동, 삼송동, 원흥동, 흥도동, 능곡동, 행주동<br>
                    일산동구 – 장항동(장항1~2동), 마두동(마두1~2동), 백석동(백석1~2동), 식사동, 풍동, 중산동, 정발산동, 풍산동<br>
                    일산서구 – 일산동(일산1~3동), 주엽동(주엽1~2동), 가좌동, 덕이동, 대화동, 탄현동, 송산동, 송포동<br>
                    <br>
                    <u>과천시</u>   관문동 제외 전지역<br>
                    <br>
                    <u>용인시</u>   수지구 고기동, 처인구 제외 전지역<br>
                    <br>
                    <u>인천광역시</u>   계양구, 부평구, 남동구, 연수구, 미추홀구, 서구<br>
                    <br>
                    <u>하남시</u><br>
                    미사동(미사1~2동), 신장동(신장1~2동), 덕풍동(덕풍1~3동), 망월동, 선동, 풍산동, 창우동, 천현동, 학암동, 위례동<br>
                    <br>
                    <u>파주시</u><br>
                    금촌동(금촌1~3동), 운정1~3동, 야동동, 다율동, 와동동, 목동동, 동패동, 문발동, 야당동, 교하동<br>
                    <br>
                    <u>화성시</u><br>
                    병점동(병점1~2동), 동탄1~6동, 진안동, 반월동, 기산동, 능동, 반송동, 석우동, 영천동, 청계동, 오산동, 목동, 산척동<br>
                    <br>
                    <u>의왕시</u>   내손동(내손1~2동), 포일동, 오전동, 고천동<br>
                    <br>
                    <u>군포시</u>   군포1~2동, 산본동(산본1~2동), 금정동, 당동, 당정동, 부곡동, 광정동, 궁내동, 수리동, 재궁동, 오금동<br>
                    <br>
                    <u>김포시</u>   양촌읍, 고촌읍, 운양동, 장기동, 구래동, 마산동, 걸포동, 감정동, 사우동, 북변동, 풍무동<br>
                    <br>
                    <u>남양주시</u><br>
                    진전읍, 진건읍, 와부읍, 별내면, 퇴계원면, 다산동(다산1~2동), 별내동, 평내동, 호평동, 금곡동, 이패동, 도농동, 지금동
                </p>

                <span class="fs-5 fw500">2. 교환 및 환불 정책</span>
                <p>
                    [결제 완료] 상태라면 언제든지 홈페이지 및 고객센터를 통해 해지 가능합니다. (마이페이지 > 주문내역)<br>
                    [발송 준비] 단계에서는 주문 내역 변경 및 주문 취소가 불가합니다.<br>
                    [배송 완료] 배송 이후에는 원칙적으로 환불이 불가하며, 100% happiness program에 따라<br>
                    꽃 신선도, 배송 상태(꽃 부러짐) 등 문제가 있는 경우에는 동일 꽃 혹은 동일 크기의 꽃으로 다시 보내드립니다.<br>
                    [기타] 무통장 결제의 환불은 주문취소요청이 확인된 날짜 기준으로 다음날(휴일 제외)에 일괄적으로 이루어집니다.
                </p>
            </div>
        </div>
    </div>
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
        const subsQuantityEl = document.querySelector("[data-subs-quantity]");
        let quantity = subsQuantityEl.textContent;
        if (isUp) {
            quantity++;
        } else {
            if (quantity > 1) {
                quantity--;
            }
        }
        subsQuantityEl.textContent = quantity;
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
        const $subsFinalPrice = document.querySelector("[data-subs-finalPrice]");
        const $subsQuantity = document.querySelector("[data-subs-quantity]");
        const $letterPrice = document.querySelector("[data-letter-price]");
        const $choicePrice = document.querySelectorAll("[data-choice-price]");

        let subsFinalPrice = $subsFinalPrice.textContent.trim().replace("원", "").replaceAll(",", "");
        let subsQuantity = $subsQuantity.textContent;
        let letterPrice = $letterPrice.textContent.trim().replace("원", "").replaceAll(",", "");
        let totalPrice = subsFinalPrice * subsQuantity;

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
        const $selectMonth = document.querySelector("#selectMonth");
        const $choices = document.querySelectorAll(".choice-price-box");
        const $subsQuantity = document.querySelector("[data-subs-quantity]");
        const $subsFsize = document.querySelector("#selectFsize");

        const choices = [...$choices].map((choice) => {
            return {
                productIdx: choice.dataset.productIdx,
                quantity: choice.querySelector(".quantity").textContent
            }
        });

        const cartVo = {
            memberId: $inputs.memberId.value,
            category: $inputs.category.value,
            subsIdx: $inputs.subsIdx.value,
            subsMonth: $selectMonth.value,
            quantity: $subsQuantity.textContent,
            subsStartDate: $inputs.requestDate.value,
            letter: letterOptionsEl[0].checked ? 1 : 0,
            choices: choices,
            fsize: $subsFsize.value
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
            // 이때 사실 cartList 에 담긴 result 를 지워줘야하는데 말이지..?
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
            //{month: cartVo.month},
            {fsize: cartVo.fsize},
            {reviewCheck: 0},

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

    // function deleteFromCart(idx) {
    //     console.log(idx);
    //     fetch("/api/cart/removeByIdx", {
    //         method: 'POST',
    //         headers: {
    //             'Content-Type': 'application/json;charset=UTF-8'
    //         },
    //         body: JSON.stringify({
    //             idx: idx
    //         })
    //     }).then(
    //         (response) => console.log(response)
    //     ).then(
    //         (result) => console.log(result)
    //     ).catch(function (err) {
    //         alert(err);
    //     });
    // }


    function animateScroll(locationStr) {
        let headerHeight = document.querySelector("header").offsetHeight;
        let targetScrollVal = document.querySelector(locationStr).offsetTop;
        window.scrollTo({top:targetScrollVal - headerHeight, behavior:'smooth'});
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
<style>

</style>