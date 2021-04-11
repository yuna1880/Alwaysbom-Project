<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="classOrderBox" class="h-100 d-flex flex-column user-select-auto">
    <!-- 검색 영역 -->
    <div class="d-flex justify-content-between py-3">
        <!-- 입금상태(status)로 검색하기 -->
        <div class="d-flex m-0 p-0" role="group">
            <label>
                <input type="radio" class="btn-check" name="status" value="전체" onchange="searchByStatus(this.value)" checked>
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

    <!-- modal dialog (리뷰 쓰기 창) -->
    <div class="modal fade " id="writingReview" tabindex="-1" aria-labelledby="writingReviewLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered ">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="writingReviewLabel">리뷰 쓰기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 리뷰 제목-->
                    <div class="mb-3">
                        <label for="review-title" class="col-form-label">리뷰 제목</label>
                        <input type="text" class="form-control" id="review-title">
                    </div>
                    <!-- 사진 첨부 -->
                    <div class="mb-3">
                        <label for="review-file" class="col-form-label">사진 첨부</label>
                        <input type="file" class="form-control text-secondary" id="review-file" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                    </div>
                    <!-- 리뷰 내용 -->
                    <div class="mb-3">
                        <label for="review-content" class="col-form-label">내용</label>
                        <textarea class="form-control" id="review-content" rows="5"></textarea>
                    </div>
                    <!-- 별점 선택하기 -->
                    <div class="mb-3">
                        <label for="review-star" class="col-form-label">별점</label>
                        <div class="d-flex btn-group text-warning fs-2 ps-3 pb-1" role="group" id="review-star">
                            <label class="btn-radio">
                                <input type="radio" class="btn-check" name="starPoint" value="1" autocomplete="off">
                                <i class="fas fa-star"></i>
                            </label>
                            <label class="btn-radio">
                                <input type="radio" class="btn-check" name="starPoint" value="2" autocomplete="off">
                                <i class="fas fa-star"></i>
                            </label>
                            <label class="btn-radio">
                                <input type="radio" class="btn-check" name="starPoint" value="3" autocomplete="off">
                                <i class="fas fa-star"></i>
                            </label>
                            <label class="btn-radio">
                                <input type="radio" class="btn-check" name="starPoint" value="4" autocomplete="off">
                                <i class="fas fa-star"></i>
                            </label>
                            <label class="btn-radio">
                                <input type="radio" class="btn-check" name="starPoint" value="5" autocomplete="off" checked>
                                <i class="fas fa-star"></i>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="addReviewBtn" type="button" class="btn btn-dark fs-19"
                            onclick="addReview()" data-bs-dismiss="modal">리뷰 등록하기</button>
                    <button type="button" class="btn btn-secondary fs-19" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>


    <!-- 내용 영역 --> <!--document.querySelector("#classUl").innerHTML = await response.text(); 이거 때문에 ul태그만 필요하고 나머지는 필요없어짐. -->
    <ul id="classUl" class="d-flex flex-column list-unstyled m-0 p-0 overflow-auto">
<%--        <c:forEach var="order" items="${orders}">--%>
<%--        <li class="d-flex border p-3 small">--%>
<%--            <!-- 클래스 사진 -->--%>
<%--            <div class="col-2 d-flex justify-content-center align-items-center">--%>
<%--                <div class="overflow-hidden" style="width: 90px; height: 90px">--%>
<%--                    <a href="/fclass/classList/${order.fclassIdx}">--%>
<%--                        <img src="${order.fclassImage}" alt="사진" width="90px">--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- 입금상태에 따른 안내문구 -->--%>
<%--            <div class="d-flex flex-column justify-content-center align-items-baseline col-6">--%>
<%--                <a href="/fclass/classList/${order.fclassIdx}" class="link-dark fs-6">${order.fclassName}</a>--%>
<%--                <div class="d-flex border-bottom border-1 border-warning col-12">--%>
<%--                    <span class="pe-2"><fmt:formatNumber value="${order.discountTotalPrice}" pattern="#,### 원"/></span>--%>
<%--                    <span class="text-secondary">${order.status}</span>--%>
<%--                </div>--%>
<%--                <c:if test="${order.status eq '입금대기'}">--%>
<%--                <span class="pt-2">입금이 확인되면 예약이 완료됩니다. 감사합니다.</span>--%>
<%--                </c:if>--%>
<%--                <c:if test="${order.status eq '결제완료'}">--%>
<%--                <span class="pt-2">--%>
<%--                    클래스에 대한 궁금한점이 있으시면--%>
<%--                    <a href="#" class="link-danger">1:1 문의게시판</a>--%>
<%--                    을 이용해주세요!--%>
<%--                </span>--%>
<%--                </c:if>--%>
<%--            </div>--%>

<%--            <!-- 지점 및 수업일시 -->--%>
<%--            <div class="flex-grow-1 d-flex justify-content-center">--%>
<%--                <div class="d-flex flex-column">--%>
<%--                    <span>지점 | ${order.branchName}</span>--%>
<%--                    <span>수강일시 <i class="fas fa-angle-down"></i></span>--%>
<%--                    <span>${order.scheduleDate}</span>--%>
<%--                    <span>${order.scheduleStartTime} ~ ${order.scheduleEndTime}</span>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- 리뷰링크 -->--%>
<%--            <div class="d-flex justify-content-center align-items-center">--%>
<%--                <a class="btn btn-sm btn-light px-3 py-2" href="/community/goReview">리뷰쓰기</a>--%>
<%--           </div>--%>
<%--        </li>--%>
<%--        </c:forEach>--%>
    </ul>
</div>
<script id="innerScript" defer>
    /*console.log('동작좀 하면 안되니');*/
    searchByStatus("전체");

    <!-- 별 클릭시 1~5 체크 -->
    let $stars = document.querySelectorAll("[name=starPoint]");
    let $starIcons = document.querySelectorAll("[name=starPoint] + i");
    for (const $star of $stars) {
        $star.onchange = function(){
            console.log(this.value);
            const starPoint = parseInt(this.value);
            $starIcons.forEach(($starIcon, index) =>{
                let className = "fas fa-star";
                if (starPoint <= index) {
                    className = "far fa-star";
                }
                $starIcon.className = className;
            })
        }
    }

    /* 리뷰 모달 띄우기 */
    function showReviewModal(oclassIdx) {
        const modal = new bootstrap.Modal(document.querySelector("#writingReview"));
        const $addReviewBtn = document.querySelector("#addReviewBtn");
        $addReviewBtn.dataset.oclassIdx = oclassIdx; //data-oclass-idx 속성에 값이 들어감
        modal.show();
    }

    /* 리뷰 등록하기 버튼 클릭 */
    function addReview() {
        const fclassIdx = parseInt(document.querySelector("#fclassIdx").value);
        let star = document.querySelector("[name=starPoint]:checked").value;
        let name = document.querySelector("#review-title").value;
        let $image = document.querySelector("#review-file");
        let oclassIdx = document.querySelector("#oclassIdx").value;

        let formData = new FormData();
        formData.append('name', name);
        if ($image.files[0]) {
            formData.append('imageFile', $image.files[0]);
        }
        formData.append('content', document.querySelector("#review-content").innerText);
        formData.append('star', star);
        formData.append('oclassIdx', oclassIdx);

        let options = {
            method: 'post',
            body: formData
        };

        fetch("/fclass/api/classList/" + fclassIdx.toString() + "/reviews", options).then(response => {
            response.json().then(result => {
                console.log(result);
                const $addReviewBtn = document.querySelector("#addReviewBtn");
                const oclassIdx = $addReviewBtn.dataset.oclassIdx;
                const $divArea = document.querySelector("#o" + oclassIdx);
                $divArea.innerHTML = "";

            }).catch(err => {
                console.log(err);
            })
        }).catch(err => {
            console.log(err);
        })
    }

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
<style>
    .btn-radio {
        cursor: pointer;
    }

    .btn-radio:hover {
        color: #ffcc3c;
    }
</style>