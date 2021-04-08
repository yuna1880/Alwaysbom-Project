<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>1:1문의</title>
    <%@ include file="../main/import.jspf" %>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="mx-auto d-flex flex-column h-100 user-select-none">
    <%@ include file="../member/mypage_header.jspf" %>
    <div class="h-85 d-flex">
        <%@ include file="../member/mypage_menu.jspf" %>
        <div class="col-10 border-info d-flex justify-content-center p-4">
            <div class="col-12 h-100" id="contentPane">
                <div class="col-12 border-info d-flex justify-content-center p-4">
                    <div class="col-12">
                        <div class="d-flex text-secondary">
                            <span class="h5 fw-bold name-color">${sessionScope.member.name}</span>
                            <span>님의 상품 후기 입니다.</span>
                        </div>
                        <hr class="hr1"/>
                        <p>
                            <span>- 새늘봄의 꽃이, 일상에 얼마나 큰 행복이 될 수 있는지</span>
                        </p>
                        <p>
                            <span>- 더 많은 분들이 알 수 있도록 후기를 남겨 주세요.</span>
                        </p>
                        <div class="d-flex pb-3 col-11">
                            <button type="button" class="btn btn-warning col-6 me-2" onclick="location.href='/community/goFaq'">작성 가능한 후기</button>
                            <button type="button" class="btn btn-warning col-6 ms-2" onclick="location.href='/question/create'">내가 작성한 후기</button>
                        </div>
                        <div class="col-11 d-flex pb-3 justify-content-end border-bottom pt-2">
                            <button type="button" class="btn btn-warning col-2" onclick="location.href='/question/create'">1:1 문의</button>
                        </div>

                        <div class="col-11 h-100">
                            <%--내용 반복문--%>
                            <div class="d-flex justify-content-center pt-2">
                                <span class="pe-2">
                                    <a class="">dd</a>
                                </span>
                                <span class="pe-2">
                                    <a class="">dd</a>
                                </span>
                            </div>



                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../main/footer.jspf" %>
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
</html>
