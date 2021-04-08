<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이포인트</title>
    <%@ include file="../main/import.jspf" %>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="mx-auto d-flex flex-column user-select-none">
    <%@ include file="../member/mypage_header.jspf" %>
    <div class="h-85 d-flex">
        <%@ include file="../member/mypage_menu.jspf" %>
        <div class="col-10 border-info d-flex justify-content-center p-4">
            <div class="col-12" id="contentPane">
                <div class="col-12 border-info d-flex justify-content-center p-4">
                    <div class="col-12">
                        <div class="d-flex text-secondary">
                            <span class="h5">포인트</span>
                        </div>
                        <hr class="hr1"/>
                        <div class="pointBox">
                            <div class="left">
                                <span class="h5">현재 사용 가능한 적립금</span>
                                <hr>
                                <span class="h4"><b class="text-danger">${sessionScope.member.point}</b>원</span>
                            </div>
                            <div class="right">
                                <span>
                                    <b>·</b>
                                    최근 6개월간의 총 구매내역을 반영하여 [배송완료]
                                    <br>
                                    기준으로 등급이 산정됩니다.
                                    <br><br>
                                </span>
                                <span>
                                    <b>·</b>
                                    등급 산정에 클래스 이용 내역은 반영되지 않습니다.
                                    <br><br>
                                </span>
                                <span>
                                    <b>·</b>
                                    <strong>매월 1일</strong>
                                    새로운 등급이 부여됩니다.
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    async function goMyClassList(e) {
        e.preventDefault();
        let $contentPane = document.querySelector("#contentPane");

        let response = await fetch("/fclass/orders");
        $contentPane.innerHTML = await response.text();
        let $innerScript = $contentPane.querySelector("#innerScript");

        let $script = document.createElement("script");
        $script.appendChild(document.createTextNode($innerScript.innerHTML));
        $innerScript.replaceWith($script);
    }
</script>
</body>
<%@ include file="../main/footer.jspf"%>
</html>
<style>
    .pointBox {
        padding-top: 50px;
        padding-bottom: 50px;
    }
    .left {
        float: left;
        width: 45%;
        max-width: 520px;
        padding: 60px 0;
        text-align: center;
        border-right: #bfbebc 1px solid;
        background: #fff;
    }
    .right {
        float: left;
        width: 45%;
        max-width: 520px;
        padding: 20px 0px 0px 40px;
        text-align: left;
        background: #fff;
    }
</style>
