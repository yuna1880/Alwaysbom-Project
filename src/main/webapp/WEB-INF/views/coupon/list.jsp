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
        <button class="col-2 p-3 btn btn-primary" data-bs-toggle="modal" data-bs-target="#popup">추가</button>
    </div>
</div>

<!-- 추가 팝업 -->
<div class="modal fade" id="popup" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <form class="modal-content">
            <div class="modal-header bg-warning">
                <h5 class="modal-title">쿠폰 추가 화면입니다</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex flex-column">

                <div class="form-floating mb-3">
                    <input class="form-control" type="text" name="name" id="name" placeholder="Name">
                    <label for="name">Name</label>
                </div>

                <div class="form-floating mb-3">
                    <input class="form-control" type="text" name="memberId" id="memberId" placeholder="Member Id">
                    <label for="memberId">Member Id</label>
                </div>

                <div class="form-floating">
                    <input class="form-control" type="number" name="point" id="point" placeholder="Point">
                    <label for="point">Point</label>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="addCoupon(this.form)">추가</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="../main/b_footer.jspf"%>
<script>
    class Coupon {
        constructor() {
            if (typeof arguments[0] === "object") {
                this.idx = arguments[0].idx;
                this.name = arguments[0].name;
                this.memberId = arguments[0].memberId;
                this.status = arguments[0].status;
                this.point = arguments[0].point;
                this.cdate = new Date(arguments[0].cdate);
            } else {
                this.name = arguments[0];
                this.memberId = arguments[1];
                this.status = 0;
                this.point = arguments[2];
            }
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
                '   <div class="col-2 p-2 border">이름</div>' +
                '   <div class="col-2 p-2 border">유저</div>' +
                '   <div class="col-1 p-2 border">사용여부</div>' +
                '   <div class="col-2 p-2 border">발행일</div>' +
                '   <div class="col-1 p-2 border">포인트</div>' +
                '   <div class="col-2 p-2 border">기능</div>' +
                '</div>';
        }

        static appendNoListMessage() {
            this.$area.innerHTML =
                '<div class="text-center">데이터가 존재하지 않습니다</div>';
        }

        static async list(status) {
            if (status === undefined) status = "";

            let response = await fetch("/api/coupons?status=" + status);
            let result = await response.json();
            if (Coupon.appendHeader(result.length)) {
                return result.map(res => {
                    return new Coupon(res);
                });
            }
        }

        makeListItem() {
            this.$li = document.createElement("li");
            this.$li.className = "col-12 d-flex text-center";

            this.$rowNum = document.createElement("div");
            this.$rowNum.className = "col-2 p-2 border";
            this.$rowNum.innerText = this.idx;

            this.$name = document.createElement("div");
            this.$name.className = "col-2 p-2 border";
            this.$name.innerText = this.name;

            this.$memberId = document.createElement("div");
            this.$memberId.className = "col-2 p-2 border";
            this.$memberId.innerText = this.memberId;

            this.$isUsed = document.createElement("div");
            this.$isUsed.className = "col-1 p-2 border";
            this.$isUsed.innerText = this.status > 0 ? "사용" : "미사용";

            this.$cdate = document.createElement("div");
            this.$cdate.className = "col-2 p-2 border";
            this.$cdate.innerText = this.cdate.toLocaleDateString();

            this.$point = document.createElement("div");
            this.$point.className = "col-1 p-2 border";
            this.$point.innerText = this.point;

            this.$btnArea = document.createElement("div");
            this.$btnArea.className = "col-2 p-2 border d-flex justify-content-around";

            this.$deleteBtn = document.createElement("button");
            this.$deleteBtn.innerText = "삭제";

            this.$updateBtn = document.createElement("button");
            this.$updateBtn.innerText = "수정";

            this.$btnArea.append(this.$deleteBtn, this.$updateBtn);
            this.$li.append(this.$rowNum, this.$name, this.$memberId, this.$isUsed, this.$cdate, this.$point, this.$btnArea);
        }

        appendListItem() {
            this.makeListItem();
            Coupon.$area.appendChild(this.$li);
        }

        prependListItem() {
            this.makeListItem();
            Coupon.$area.children.item(0).insertAdjacentElement("afterend", this.$li);
        }

        async addCoupon() {
            const option = {
                method: "post",
                body: JSON.stringify(this),
                headers: {
                    "Content-Type": "application/json;charset=utf-8"
                }
            }
            const response = await fetch("/api/coupons", option)
            const result = await response.json();
            console.log(result);
            this.idx = result.idx;
            this.cdate = new Date(result.cdate);

            this.prependListItem();
        }
    }

    searchCoupon();

    function searchCoupon(type) {
        Coupon.list(type).then(list => {
            list.forEach(coupon => coupon.appendListItem());
        })
    }

    function addCoupon(form) {
        const name = form.name.value;
        const memberId = form.memberId.value;
        const point = form.point.value;

        const coupon = new Coupon(name, memberId, point);
        coupon.addCoupon();
    }

</script>
</body>
</html>