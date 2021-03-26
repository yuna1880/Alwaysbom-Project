<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>소품샵 상품 등록</title>
    <%@ include file="../main/b_import.jspf"%>
    <link rel="stylesheet" href="../static/css/b_insert.css">
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
        <form method="post">
            <div class="fs-5 p-1 my-5 d-block border-bottom border-secondary">
                1. 상품 이미지 등록
                <span class="description text-danger">
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
                            <input type="text" class="form-control" id="flowerName" placeholder="상품명 입력">
                            <label for="flowerName">상품명 (한글 50자 미만)</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating my-2">
                            <input type="text" class="form-control" id="flowerSubheader" placeholder="한줄 설명">
                            <label for="flowerSubheader">한줄 설명 (한글 100자 미만)</label>
                        </div>
                    </div>
                </div>
                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating my-2">
                            <select class="form-select" id="flowerSize" aria-label="flowerSize">
                                <option selected>화병인 경우만 선택</option>
                                <option value="1">S</option>
                                <option value="2">M</option>
                                <option value="3">L</option>
                                <option value="4">XL</option>
                                <option value="5">선택하지 않음</option>
                            </select>
                            <label for="flowerSize">어울리는 꽃다발 사이즈</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating my-2">
                            <input type="text" class="form-control text-end" id="flowerPrice" placeholder="가격"
                                onchange="calculate()">
                            <label for="flowerSubheader">상품 가격</label>
                        </div>
                    </div>
                </div>
                <div class="row g-3">
<%--                    버튼 스타일의 체크박스 --%>
<%--                    <div class="col-md-4 d-flex align-items-center">--%>
<%--                        <input type="checkbox" class="btn-check" id="freeDelivery" autocomplete="off">--%>
<%--                        <label class="btn btn px-4 py-2 me-2 btn-outline-dark me-2" for="freeDelivery">무료배송</label><br>--%>
<%--                        <input type="checkbox" class="btn-check" id="discount" autocomplete="on" onclick="checkDiscount()">--%>
<%--                        <label class="btn btn px-4 py-2 btn-outline-dark" for="discount">할인 적용하기</label><br>--%>
<%--                    </div>--%>
                    <div class="col-md-4 d-flex align-items-center">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="freeDelivery" value="option1"
                                   onclick="changeBg(this)">
                            <label class="form-check-label" for="freeDelivery">무료배송</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="discount" value="option2"
                                   onclick="checkDiscount(), changeBg(this)">
                            <label class="form-check-label" for="discount">할인 적용하기</label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-floating my-2">
                            <input type="number" max="50" class="form-control" disabled id="discountRate" placeholder="할인율"
                                onchange="calculate()">
                            <label for="discountRate">할인율 (숫자만 입력)</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-floating my-2">
                            <input type="text" class="form-control text-end" disabled readonly id="newPrice" placeholder="할인 적용가">
                            <label for="newPrice">할인 적용가</label>
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
                    <label class="form-label description text-danger" for="content">* 고객의 이해를 돕기 위해 상품 상세정보와 이미지를 함께 등록해주세요</label>
                    <textarea name="content" id="content" style="height: 1000px;"></textarea>
                </div>
            </div>

            <div class="d-flex justify-content-center my-lg-5">
                <input type="button" value="등록하기" class="btn btn-lg btn-dark py-lg-3 px-lg-5" onclick="insert(this.form)">
                <input type="button" value="이전으로" class="btn btn-lg btn-secondary py-lg-3 px-lg-5 ms-3" onclick="history.back()">
            </div>
        </form>
    </div>  <!-- container 닫기 -->

    <%@ include file="../main/b_footer.jspf"%>
<script>
    function preview(file, id) {
        let img = document.querySelector("#" + id);

        let reader = new FileReader();
        reader.onload = function(e) {
            img.setAttribute("src", e.target.result.toString());
            img.classList.remove("d-none");
        }
        reader.readAsDataURL(file.files[0]);
    }

    function calculate() {
        let price = document.querySelector("#flowerPrice").value;
        let dRate = document.querySelector("#discountRate").value;
        let dPrice;

        if (dRate == null) {
            dPrice = null;
        } else {
            if (price == null || price.trim() == "") {
                dPrice = "상품 가격을 입력해주세요";
            }
            else {
                dPrice = Math.floor((100 - Number(dRate)) * 0.01 * Number(price)) + " 원";
                console.log("dPrice : " + dPrice);
            }
        }
        document.querySelector("#newPrice").value = dPrice;
    }

    function checkDiscount() {
        let dBtn = document.querySelector("#discount");
        let dRate = document.querySelector("#discountRate");
        let dPrice = document.querySelector("#newPrice");

        if (dBtn.checked == true) {
            dRate.toggleAttribute("disabled", false);
            dPrice.toggleAttribute("disabled", false);
        } else {
           dRate.toggleAttribute("disabled", true);
           dPrice.toggleAttribute("disabled", true);
           dRate.value = null;
           calculate();
        }
    }

    function changeBg(chkBox) {
        if (chkBox.checked) {
            chkBox.classList.add("bg-dark");
        } else {
            chkBox.classList.remove("bg-dark");
        }
    }

</script>
<script src="/static/js/imageUploader.js"></script>
</body>
</html>
