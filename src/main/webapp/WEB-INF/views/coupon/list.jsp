<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>새늘봄 / 쿠폰</title>
    <%@ include file="../main/b_import.jspf"%>
</head>
<body>
<%@ include file="../main/b_header.jspf"%>
<div id="container" class="d-flex flex-column align-items-center mx-auto">
    <!-- 메뉴 영역 -->
    <!-- 메뉴 영역 -->
    <div class="col-12 d-flex justify-content-between align-items-center p-3">
        <!-- 라디오 버튼(전체/사용/미사용) -->
        <div class="col-3 d-flex btn-group" role="group">
            <label class="col-4">
                <input type="radio" name="status" class="d-none btn-check" onchange="searchCoupon()" checked>
                <span class="d-block text-center p-2 btn btn-outline-secondary">전체</span>
            </label>
            <label class="col-4">
                <input type="radio" name="status" class="d-none btn-check" value="1" onchange="searchCoupon(1)">
                <span class="d-block text-center p-2 btn btn-outline-secondary">사용</span>
            </label>
            <label class="col-4">
                <input type="radio" name="status" class="d-none btn-check" value="0" onchange="searchCoupon(0)">
                <span class="d-block text-center p-2 btn btn-outline-secondary">미사용</span>
            </label>
        </div>

        <!-- 아이디 검색 -->
        <div class="col-3 d-flex align-items-center">
            <input type="text" class="rounded-3 border-1 p-2" aria-label="searchId" name="searchId" id="searchId">
            <button class="border-1 rounded-3 btn btn-secondary p-2 flex-grow-1 shadow-none">
                <i class="fa fa-search"></i>
            </button>
        </div>
    </div>

    <!-- 리스트 영역 -->
    <div id="listArea" class="col-12 p-3 bg-secondary d-flex flex-column">
        <!-- 리스트 헤더 -->
        <div class="col-12 d-flex text-center">
            <div class="col-2 p-2 border">쿠폰번호</div>
            <div class="col-2 p-2 border">유저</div>
            <div class="col-2 p-2 border">사용여부</div>
            <div class="col-2 p-2 border">발행일</div>
            <div class="col-2 p-2 border">포인트</div>
            <div class="col-2 p-2 border">기능</div>
        </div>

        <!-- 리스트 내용 -->
        <ul class="col-12 d-flex flex-column text-center list-unstyled m-0 p-0">
        </ul>
    </div>

    <!-- 버튼 영역 -->
    <div class="col-12 p-3 bg-info d-flex justify-content-end">
        <button class="col-2 p-3 btn btn-primary">추가</button>
    </div>
</div>
<%@ include file="../main/b_footer.jspf"%>
<script>
    class Coupon {
        constructor(coupon) {
            this.idx = coupon.idx;
            this.name = coupon.name;
            this.memberId = coupon.memberId;
            this.status = coupon.status;
            this.point = coupon.point;
            this.cdate = new Date(coupon.cdate);
        }
        static $area = document.querySelector("#listArea");

        static appendHeader(length) {
            if (length === 0) {
                Coupon.appendNoListMessage();
                return false;
            } else {
                Coupon.appendListHeader();
                return true;
            }
        }

        static appendListHeader() {
            this.$area.innerHTML =
                '<div class="col-12 d-flex text-center">' +
                '   <div class="col-2 p-2 border">쿠폰번호</div>' +
                '   <div class="col-2 p-2 border">유저</div>' +
                '   <div class="col-2 p-2 border">사용여부</div>' +
                '   <div class="col-2 p-2 border">발행일</div>' +
                '   <div class="col-2 p-2 border">포인트</div>' +
                '   <div class="col-2 p-2 border">기능</div>' +
                '</div>';
        }

        static appendNoListMessage() {
            this.$area.innerHTML =
                '<div class="text-center">데이터가 존재하지 않습니다</div>';
        }

        static async list(status) {
            if (status === undefined) status = "";

            let response = await fetch("/api/coupon/list?status=" + status);
            let result = await response.json();
            if (Coupon.appendHeader(result.length)) {
                return result.map(res => {
                    return new Coupon(res);
                });
            }
        }

        appendListItem() {
            this.$li = document.createElement("li");
            this.$li.className = "col-12 d-flex text-center";

            this.$rowNum = document.createElement("div");
            this.$rowNum.className = "col-2 p-2 border";
            this.$rowNum.innerText = this.idx;

            this.$memberId = document.createElement("div");
            this.$memberId.className = "col-2 p-2 border";
            this.$memberId.innerText = this.memberId;

            this.$isUsed = document.createElement("div");
            this.$isUsed.className = "col-2 p-2 border";
            this.$isUsed.innerText = this.status > 0 ? "사용" : "미사용";

            this.$cdate = document.createElement("div");
            this.$cdate.className = "col-2 p-2 border";
            this.$cdate.innerText = this.cdate.toLocaleDateString();

            this.$point = document.createElement("div");
            this.$point.className = "col-2 p-2 border";
            this.$point.innerText = this.point;

            this.$btnArea = document.createElement("div");
            this.$btnArea.className = "col-2 p-2 border d-flex justify-content-around";

            this.$deleteBtn = document.createElement("button");
            this.$deleteBtn.innerText = "삭제";

            this.$updateBtn = document.createElement("button");
            this.$updateBtn.innerText = "수정";

            this.$btnArea.append(this.$deleteBtn, this.$updateBtn);
            this.$li.append(this.$rowNum, this.$memberId, this.$isUsed, this.$cdate, this.$point, this.$btnArea);
            Coupon.$area.appendChild(this.$li);
        }
    }

    searchCoupon();

    function searchCoupon(type) {
        Coupon.list(type).then(list => {
            list.forEach(coupon => coupon.appendListItem());
        })
    }

</script>
</body>
</html>