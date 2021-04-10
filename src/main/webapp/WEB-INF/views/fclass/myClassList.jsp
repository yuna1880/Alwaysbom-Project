<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="classOrderBox" class="h-100 d-flex flex-column user-select-auto">
    <!-- 검색 영역 -->
    <div class="d-flex justify-content-between py-3">
        <!-- 입금상태(status)로 검색하기 -->
        <div class="d-flex m-0 p-0" role="group">
            <label>
                <input type="radio" class="btn-check" name="status" value="전체" onchange="searchByStatus(this.value)">
                <span class="btn btn-outline-warning btn-sm text-dark">전체</span>
            </label>
            <label class="mx-1">
                <input type="radio" class="btn-check" name="status" value="입금대기" onchange="searchByStatus(this.value)">
                <span class="btn btn-outline-warning btn-sm text-dark">입금대기</span>
            </label>
            <label>
                <input type="radio" class="btn-check" name="status" value="결제완료" onchange="searchByStatus(this.value)">
                <span class="btn btn-outline-warning btn-sm text-dark">결제완료</span>
            </label>
        </div>
        <!-- 클래스명으로 검색하기 -->
        <div class="input-group mb-3" style="width: 300px;">
            <input type="text" class="form-control className" name="className" id="className" onkeyup="if(event.keyCode === 13) searchByOption();" onfocus="this.value='';">
            <button class="btn btn-outline-secondary" type="button" onclick="searchByOption()">
                <span>검색</span>
            </button>
        </div>
    </div>

    <!-- 내용 영역 -->
    <ul id="classUl" class="d-flex flex-column list-unstyled m-0 p-0 overflow-auto">
        <c:forEach var="order" items="${orders}">
        <li class="d-flex border p-3 small">
            <!-- 클래스 사진 -->
            <div class="col-2 d-flex justify-content-center align-items-center">
                <div class="overflow-hidden" style="width: 90px; height: 90px">
                    <a href="/fclass/classList/${order.fclassIdx}">
                        <img src="${order.fclassImage}" alt="사진" width="90px">
                    </a>
                </div>
            </div>

            <!-- 입금상태에 따른 안내문구 -->
            <div class="d-flex flex-column justify-content-center align-items-baseline col-6">
                <a href="/fclass/classList/${order.fclassIdx}" class="link-dark fs-6">${order.fclassName}</a>
                <div class="d-flex border-bottom border-1 border-warning col-12">
                    <span class="pe-2"><fmt:formatNumber value="${order.discountTotalPrice}" pattern="#,### 원"/></span>
                    <span class="text-secondary">${order.status}</span>
                </div>
                <c:if test="${order.status eq '입금대기'}">
                <span class="pt-2">입금이 확인되면 예약이 완료됩니다. 감사합니다.</span>
                </c:if>
                <c:if test="${order.status eq '결제완료'}">
                <span class="pt-2">
                    클래스에 대한 궁금한점이 있으시면
                    <a href="#" class="link-danger">1:1 문의게시판</a>
                    을 이용해주세요!
                </span>
                </c:if>
            </div>

            <!-- 지점 및 수업일시 -->
            <div class="flex-grow-1 d-flex justify-content-center">
                <div class="d-flex flex-column">
                    <span>지점 | ${order.branchName}</span>
                    <span>수강일시 <i class="fas fa-angle-down"></i></span>
                    <span>${order.scheduleDate}</span>
                    <span>${order.scheduleStartTime} ~ ${order.scheduleEndTime}</span>
                </div>
            </div>

            <!-- 리뷰링크 -->
            <div class="d-flex justify-content-center align-items-center">
                <a class="btn btn-sm btn-light px-3 py-2" href="/community/goReview">리뷰쓰기</a>
           </div>
        </li>
        </c:forEach>
    </ul>
</div>
<script id="innerScript" defer>
    /*console.log('동작좀 하면 안되니');*/

    async function searchByStatus(status) {
        let response = await fetch("/api/fclass/orders?status=" + status);
        document.querySelector("#classUl").innerHTML = await response.text();
    }

    async function searchByOption() {
        // 파라미터가 없는 대신, 직접 가져와야 한다. (className, status 둘다)
        const status = document.querySelector("#classOrderBox input[name=status]:checked").value;
        const $className = document.querySelector("#classOrderBox input[name=className]");

        const params = {
            status: status,
            className: $className.value
        };

        const queryString = new URLSearchParams(params).toString();
        const response = await fetch("/api/fclass/orders?" + queryString);
        document.querySelector("#classUl").innerHTML = await response.text();
        /*$className.value = '';*/
    }
</script>