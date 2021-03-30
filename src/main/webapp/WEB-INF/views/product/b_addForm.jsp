<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>소품샵 상품 등록</title>
    <%@ include file="../main/b_import.jspf"%>
    <link rel="stylesheet" href="/static/css/item/b_addForm.css">
    <script src="/static/ckeditor5-build-classic/ckeditor.js"></script>
</head>
<body>
    <%@ include file="../main/b_header.jspf"%>
    <div id="container" class="mx-auto">
        <nav id="bread-nav" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb mb-xxl-5">
                <li class="breadcrumb-item"><a href="/admin/main">관리자 홈</a></li>
                <li class="breadcrumb-item"><a href="/admin/product">소품샵 관리</a></li>
                <li class="breadcrumb-item active" aria-current="page">상품 등록</li>
            </ol>
        </nav>

        <!-- 1. 상품 이미지 등록 (이미지 3개 파일 업로드) -->
        <form method="post" enctype="multipart/form-data">
            <div class="fs-5 p-1 my-5 d-block border-bottom border-secondary">
                1. 상품 이미지 등록
                <span class="description text-danger ms-2">
                    * 상품 사진은 가능하다면 고화질의 정방형 이미지로 올려주십시오.
                </span>
            </div>
            <div class="imgs d-flex justify-content-center">
                <li class="card overflow-hidden img-card" onclick="this.children.file.click()">
                    <a href="#" class="w-100 h-100 btn btn-outline-dark
                                       d-flex flex-column align-items-center justify-content-center">
                        <i class="fa fa-plus h1"></i>
                        <div>대표 이미지(필수)</div>
                    </a>
                    <input type="file" name="file" class="d-none" id="file1" onchange="preview(this, 'img1')">
                    <img src="" alt="사진" class="m-0 p-0 card-img-overlay d-none" id="img1">
                </li>
                <li class="card overflow-hidden img-card" onclick="this.children.file.click()">
                    <a href="#" class="w-100 h-100 btn btn-outline-dark
                                       d-flex flex-column align-items-center justify-content-center">
                        <i class="fa fa-plus h1"></i>
                        <div>서브 이미지(선택)</div>
                    </a>
                    <input type="file" name="file" class="d-none" id="file2" onchange="preview(this, 'img2')">
                    <img src="" alt="사진" class="m-0 p-0 card-img-overlay d-none" id="img2">
                </li>
                <li class="card overflow-hidden img-card" onclick="this.children.file.click()">
                    <a href="#" class="w-100 h-100 btn btn-outline-dark
                                       d-flex flex-column align-items-center justify-content-center">
                        <i class="fa fa-plus h1"></i>
                        <div>서브 이미지(선택)</div>
                    </a>
                    <input type="file" name="file" class="d-none" id="file3" onchange="preview(this, 'img3')">
                    <img src="" alt="사진" class="m-0 p-0 card-img-overlay d-none" id="img3">
                </li>
            </div>


            <!-- 2. 주요 정보 기입용 input 태그들 -->
            <div class="fs-5 p-1 my-5 d-block border-bottom border-secondary">
                2. 주요 정보
            </div>
            <div class="inputs-wrap mx-auto">
                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating my-2">
                            <input type="text" name="name" class="form-control" id="itemName" placeholder="상품명 입력">
                            <label for="itemName">상품명 (한글 50자 미만)</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating my-2">
                            <input type="text" name="subheader" class="form-control" id="itemSubheader" placeholder="한줄 설명">
                            <label for="itemSubheader">한줄 설명 (한글 100자 미만)</label>
                        </div>
                    </div>
                </div>
                <div class="row g-2">
                    <div class="col-md d-flex justify-content-between align-items-center">
                        <div class="col-6">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="category"
                                       id="cateVase" value="화병" onclick="enableFsizeSelectBox(true)">
                                <label class="form-check-label" for="cateVase">화병</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="category"
                                       id="cateGoods" value="굿즈" onclick="enableFsizeSelectBox(false)">
                                <label class="form-check-label" for="cateGoods">굿즈</label>
                            </div>
                        </div>
                        <div class="form-floating my-2 col-6">
                            <select name="fsize" class="form-select" id="itemSize" aria-label="itemSize" disabled>
                                <option selected>화병인 경우만 선택</option>
                                <option value="S">S</option>
                                <option value="M">M</option>
                                <option value="L">L</option>
                                <option value="XL">XL</option>
                            </select>
                            <label for="itemSize">어울리는 꽃다발 사이즈</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating my-2">
                            <input type="text" name="price" class="form-control text-end"
                                   id="itemPrice" placeholder="가격" onchange="calculate()">
                            <label for="itemSubheader">상품 가격</label>
                        </div>
                    </div>
                </div>
                <div class="row g-3">
                    <div class="col-md-4 d-flex align-items-center">
                        <div class="form-check form-check-inline me-4">
                            <input class="form-check-input" type="checkbox" name="freeDelivery"
                                   id="freeDelivery" value="1"
                                   onclick="changeBg(this)">
                            <label class="form-check-label" for="freeDelivery">무료배송</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="discount"
                                   onclick="enableDiscountRateInput(this); changeBg(this)">
                            <label class="form-check-label" for="discount">할인 적용하기</label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-floating my-2">
                            <input type="number" max="50" class="form-control" name="discountRate"
                                   id="discountRate" placeholder="할인율" onchange="calculate()" disabled>
                            <label for="discountRate">할인율 (숫자만 입력)</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-floating my-2">
                            <input type="text" class="form-control text-end"
                                   id="finalPrice" placeholder="할인 적용가" disabled readonly>
                            <label for="finalPrice">할인 적용가</label>
                        </div>
                    </div>
                </div>
            </div> <!-- inputs-wrap 닫기 -->


            <!-- 3. 상품 상세페이지 등록 (텍스트 에디터) -->
            <div class="fs-5 p-1 my-5 d-block border-bottom border-secondary">
                3. 상세 정보
            </div>
            <div class="text-editor-wrap d-flex justify-content-center mx-auto">
                <div class="col-12">
                    <label class="form-label description text-danger" for="content">
                        * 고객의 이해를 돕기 위해 상품 상세정보와 이미지를 함께 등록해주세요
                    </label>
                    <textarea name="content" id="content"></textarea>
                </div>
            </div>

            <div class="d-flex justify-content-center my-lg-5">
                <input type="button" value="등록하기" class="btn btn-lg btn-dark py-lg-3 px-lg-5"
                       onclick="goInsert(this.form)">
                <input type="button" value="이전으로" class="btn btn-lg btn-secondary py-lg-3 px-lg-5 ms-3"
                       onclick="history.back()">
            </div>
        </form>
    </div>  <!-- container 닫기 -->

    <%@ include file="../main/b_footer.jspf"%>

    <script>
        /* 업로드한 이미지 미리보기 */
        function preview(file, id) {
            let img = document.querySelector("#" + id);

            let reader = new FileReader();
            reader.onload = function(e) {
                img.setAttribute("src", e.target.result.toString());
                img.classList.remove("d-none");
            }
            reader.readAsDataURL(file.files[0]);
        }

        /* 카테고리 화병을 선택하면 어울리는 꽃 사이즈 셀렉트박스 선택할 수 있게 */
        function enableFsizeSelectBox(isVase) {
            let fsizeSelectBoxEl = document.querySelector("#itemSize");
            if (isVase) {
                fsizeSelectBoxEl.toggleAttribute("disabled", false);
            } else {
                fsizeSelectBoxEl.toggleAttribute("disabled", true);
            }
        }

        /* 할인율에 따라 최종가격 정하는 함수. (아직 수정단계입니다) */
        function calculate() {
            let priceVal = document.querySelector("#itemPrice").value;
            let discountRateVal = document.querySelector("#discountRate").value;
            let finalPrice = document.querySelector("#finalPrice");
            let finalPriceVal;

            if (!discountRateVal) {
                finalPriceVal = "";
            } else {
                if (priceVal == null || priceVal.trim() === "") {
                    finalPriceVal = "상품 가격을 입력해주세요";
                    finalPrice.classList.add("text-danger", "description");
                }
                /*-- 추후 price 칸에 숫자만 입력할 수 있도록 조건 처리해야 함 --*/
                else {
                    finalPrice.classList.remove("text-danger", "description");
                    finalPriceVal =
                        Math.floor((100 - Number(discountRateVal)) * 0.01 * Number(priceVal)) + " 원";
                    console.log("finalPriceVal : " + finalPriceVal);
                }
            }
            finalPrice.value = finalPriceVal;
        }

        /* 할인적용 체크박스 누르면 할인율 입력가능하게 변경 */
        function enableDiscountRateInput(chkBox) {
            let discountRate = document.querySelector("#discountRate");
            let finalPrice = document.querySelector("#finalPrice");

            if (chkBox.checked) {
                discountRate.toggleAttribute("disabled", false);
                finalPrice.toggleAttribute("disabled", false);
            } else {
                discountRate.toggleAttribute("disabled", true);
                finalPrice.toggleAttribute("disabled", true);
                discountRate.value = null;
                finalPrice.value = null;
                calculate();
            }
        }

        /* 체크박스 체크시 네모박스 bg 컬러 변경 */
        function changeBg(chkBox) {
            if (chkBox.checked) {
                chkBox.classList.add("bg-dark");
            } else {
                chkBox.classList.remove("bg-dark");
            }
        }

        /* 폼데이터 전송후 창 이동 */
        function goInsert(frm) {
            frm.action = "/admin/addProduct";
            frm.submit();
        }
    </script>
    <script src="/static/js/imageUploader.js"></script>
</body>
</html>
