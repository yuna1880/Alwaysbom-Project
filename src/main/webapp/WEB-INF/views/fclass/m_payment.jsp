<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>플라워클래스 결제</title>
    <%@ include file="../main/import.jspf"%>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="d-flex flex-column align-items-center mx-auto bg-white p-2">

    <!-- 결제 단계 아이콘 -->
    <div class="rounded-circle h6 d-flex flex-column align-items-center justify-content-center"
         style="height: 130px; width: 130px; color: #6e6e6e; background-color: #e8e8e8">
        <span class="h5">1</span>
        <span class="fw-light">결제</span>
    </div>

    <!-- 상품 헤더 -->
    <div class="col-12 py-2 border-top border-2 border-dark d-flex text-center">
        <div class="col-3">수강일</div>
        <div class="col-6">클래스</div>
        <div class="col-3">수강료</div>
    </div>

    <!-- 상품 -->
    <div class="col-12 d-flex border-1 border-top" style="height: 170px">
        <!-- 수강일 -->
        <div class="col-3 d-flex align-items-center justify-content-center">
            <span>2021-03-31</span>
        </div>

        <!-- 클래스 내용 -->
        <div class="col-6 d-flex align-items-center">
            <div>
                <img src="/static/image/oitem/0_1.png" alt="이미지" style="width:160px; height:130px">
            </div>
            <div class="d-flex flex-column ps-2">
                <span>[ 1호점 ] 플로리스트_8주과정</span>
                <span>수강인원 : 3</span>
                <span>수강시간 : 10:00</span>
            </div>
        </div>

        <!-- 수강료 -->
        <div class="col-3 d-flex align-items-center justify-content-center">
            <span class="text-secondary">560,000</span>
        </div>
    </div>

    <!-- 적립금 -->
    <div class="col-12 py-4 d-flex align-items-center border-1 border-top border-bottom">
        <span class="fw-bold me-1">적립금</span>
        <input type="number" class="mx-1 ps-3 border border-secondary btn-outline-white rounded-3">
        <button type="button" class="btn btn-sm btn-warning mx-1">적용</button>
        <span class="mx-1">* 사용 가능 포인트: 1,000</span>
    </div>

    <!-- 결제 금액 -->
    <div class="col-12 py-4 ps-3 pe-2 d-flex flex-column border-1 border-bottom">
        <div class="d-flex justify-content-between py-2">
            <span>포인트할인</span>
            <span>-0 원</span>
        </div>
        <div class="d-flex justify-content-between py-2">
            <span>등급할인</span>
            <span>-0 원</span>
        </div>
        <div class="d-flex justify-content-between py-2 h4 text-warning m-0">
            <span>총 결제금액</span>
            <span>1,680,000 원</span>
        </div>
    </div>

    <!-- 결제 수단 -->
    <div class="col-12 py-4 d-flex flex-column">
        <span>결제 수단 선택</span>
        <div class="d-flex pay-button-group">
            <label class="col-3">
                <input class="d-none" type="radio" name="pay-type" autocomplete="off" checked>
                <span class="d-block btn-pay py-3 text-center">신용카드</span>
            </label>
            <label class="col-3">
                <input class="d-none" type="radio" name="pay-type" autocomplete="off">
                <span class="d-block btn-pay py-3 text-center">신용카드(직접입력)</span>
            </label>
            <label class="col-3">
                <input class="d-none" type="radio" name="pay-type" autocomplete="off">
                <span class="d-block btn-pay py-3 text-center">무통장입금</span>
            </label>
            <label class="col-3">
                <input class="d-none" type="radio" name="pay-type" autocomplete="off">
                <span class="d-block btn-pay py-3 text-center">카카오페이</span>
            </label>
        </div>
        <!-- 결제 수단별 내용 영역 -->
        <div class="border-1 border-bottom border-dark">
            <!-- 신용카드 내용 -->
            <div class="pay-content active p-4">
            </div>

            <!-- 신용카드(직접입력) 내용 -->
            <div class="pay-content">
                <div class="d-flex flex-column border-1 border-bottom border-dark p-4">
                    <span>* 신용카드 정보를 직접 입력하여 간편하게 결제하실 수 있습니다.</span>
                    <span>* 꾸까에서는 절대 카드 정보를 직접 저장하지 않습니다.</span>
                    <span>* 나이스 정보통신의 결제 기능을 사용합니다.</span>
                    <span>* 기명 법인카드의 경우, 소유하신 분의 주민등록번호 앞자리를 입력해주세요.</span>
                    <span>* 무기명 법인카드의 경우, 사업자 등록번호를 입력해 주세요.</span>
                </div>
                <div class="d-flex flex-column p-4">
                    <div class="col-6">
                        <div>카드 번호</div>
                        <div class="d-flex align-items-center text-center">
                            <input type="text" style="width:23.875%">
                            <span style="width:1.5%">-</span>
                            <input type="text" style="width:23.875%">
                            <span style="width:1.5%">-</span>
                            <input type="text" style="width:23.875%">
                            <span style="width:1.5%">-</span>
                            <input type="text" style="width:23.875%">
                        </div>
                    </div>
                    <div class="col-6">
                        <div>유효 기간 (년/월)</div>
                        <div class="d-flex align-items-center text-center">
                            <select name="year" style="width:49.25%">
                                <option value="2021">2021</option>
                            </select>
                            <span style="width:1.5%">-</span>
                            <select name="month" style="width:49.25%">
                                <option value="1">01</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-6">
                        <div>주민등록번호 앞자리</div>
                        <div class="d-flex align-items-center text-center">
                            <input type="text" style="width:49.25%">
                        </div>
                    </div>
                    <div class="col-6">
                        <div>비밀번호 앞 두자리</div>
                        <div class="d-flex align-items-center text-center">
                            <input type="text" style="width:49.25%">
                        </div>
                    </div>
                </div>
            </div>

            <!-- 무통장입금 내용 -->
            <div class="pay-content p-4">
                <div class="d-flex flex-column">
                    <div class="col-6 d-flex align-items-center">
                        <span>입금자명</span>
                        <input type="text" class="mx-2" style="width:80px">
                        <span>미기재시 주문자명으로 자동 반영</span>
                    </div>
                    <div class="py-4">
                        <span>* 주문 후 72시간동안 미 입금시 자동 주문 취소됩니다.</span>
                    </div>
                    <div>
                        <label>
                            <input type="radio" name="cashReceipt" value="individual">
                            <span>개인소득공제용</span>
                        </label>
                        <label class="mx-2">
                            <input type="radio" name="cashReceipt" value="business">
                            <span>사업자증빙용</span>
                        </label>
                        <label>
                            <input type="radio" name="cashReceipt" value="noApply">
                            <span>미신청</span>
                        </label>
                    </div>
                </div>
            </div>

            <!-- 카카오페이 내용 -->
            <div class="pay-content p-4">
            </div>
        </div>
    </div>

    <!-- 버튼 영역 -->
    <div class="col-12 py-4 d-flex flex-column">
        <button class="col-3 align-self-end btn-pay bg-pay py-3">결제 하기</button>
    </div>
</div>
<%@ include file="../main/footer.jspf"%>
<script>
    let $payTypeList = document.querySelectorAll('.pay-button-group input[type="radio"]');
    let $payButtonContentList = document.querySelectorAll('.pay-content');

    function getPayTypeIndex($payTypeList) {
        let result = -1;
        $payTypeList.forEach(function ($payType, payTypeIndex) {
            if ($payType.checked) {
                result = payTypeIndex;
            }
        });
        return result;
    }

    $payTypeList.forEach(function ($payType, payTypeIndex) {
        $payType.addEventListener("change", function () {
            $payButtonContentList.forEach(function ($payButtonContent, payButtonContentIndex) {
                if ($payButtonContent.classList.contains("active")) {
                    $payButtonContent.classList.remove("active");
                }

                if (payTypeIndex === payButtonContentIndex) {
                    $payButtonContent.classList.add("active");
                }
            });
        });
    });
</script>
</body>
</html>
<style>
    .btn-pay {
        background-color: white;
        border: 1px solid #dfdfdf;
        text-align: center;
        cursor: pointer;
    }

    :checked + .btn-pay {
        background-color: #3A3A3A;
        color: #FFFFFF;
    }

    .btn-pay:hover {
        background-color: #5A5A5A;
        color: #FFFFFF;
    }

    .pay-content {
        display: none;
    }

    .pay-content.active {
        display: flex;
        flex-direction: column;
    }

    .bg-pay {
        background-color: #3A3A3A;
        color: #FFFFFF;
    }
</style>