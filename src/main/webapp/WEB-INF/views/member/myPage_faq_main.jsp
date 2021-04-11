<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>1:1문의</title>
    <%@ include file="../main/import.jspf" %>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="mx-auto d-flex flex-column user-select-none">
    <%@ include file="../member/mypage_header.jspf" %>
    <div class="d-flex">
        <%@ include file="../member/mypage_menu.jspf" %>
        <div class="col-10 border-info d-flex justify-content-center p-4">
            <div class="col-12" id="contentPane">
                <div class="col-12 border-info d-flex justify-content-center p-4">
                    <div class="col-12">
                        <div class="d-flex text-secondary">
                            <span class="h5 fw-bold name-color">${sessionScope.member.name}</span>
                            <span>님의 문의 내역입니다.</span>
                        </div>
                        <hr class="hr1"/>
                        <p>
                        <span>- 1:1 문의 게시판 운영 시간 : 월 ~ 금 10:00 ~18:00</span>
                        </p>
                        <p>
                        <span>- 운영 시간 내에는 2시간 이내에 답변을 드리나, 문의가 많을 때는 다소 지연될 수 있습니다.</span>
                        </p>
                        <div class="btn">
                            <button type="button" class="btn btn-outline-secondary" onclick="location.href='/community/goFaq'">자주 묻는 질문</button>
                            <button type="button" class="btn btn-outline-secondary" onclick="location.href='/question/create'">1:1 문의하기</button>
                        </div>
                        <div class="mx-5">

                            <div class="row row-cols-6 mx-auto bottom-line reBoard">
                                <span class="text-center col-2 nopadding">번호</span>
                                <span class="text-center col-2 nopadding">작성일</span>
                                <span class="text-center col-5 nopadding">제목</span>
                                <span class="text-center col-3 nopadding">상태</span>
                            </div>

                            <ul class="nav row table mx-auto">
                                <c:forEach var="quList" items="${quList}">
<%--                                    <c:if test="${not empty quList.answer}">--%>
                                    <li>
                                        <div class="row row-cols-5 mx-auto bottom-line accoque reBoard">
                                            <span class="text-center col-2 nopadding">${quList.idx}</span>
                                            <span class="text-center col-2 nopadding">${quList.questionDate}</span>
                                            <span class="text-center col-5 nopadding">${quList.name}</span>
                                                <span class="text-center col-2 nopadding">미답변</span>
                                            <span class="text-center col-1 nopadding"><img src="/static/icons/up.svg"
                                                                                           class="rounded- mx-auto checkv" alt="V"
                                                                                           title="V"></span>
                                        </div>
                                        <div class="row bottom-line text-center toggleBtn disflex" style="display: none">
                                            <c:if test="${not empty quList.image}">
                                                <div class="col">
                                                    <img src="${quList.image}" class="rounded-" alt="questimg" title="문의사진" style="height: 400px; width: 600px;">
                                                </div>
                                            </c:if>
                                            <div class="col">
                                                <span>${quList.content}</span>
                                            </div>
                                        </div>

                                        <div>
                                            <div class="row row-cols-5 mx-auto bottom-line accoque reBoard nopadding">
                                <span class="text-center col-2 nopadding">
                                    <img src="/static/icons/right.svg" alt="answer" title="화살표">
                                </span>
                                                <span class="text-center col-2 nopadding">${quList.answerDate}</span>
                                                <span class="text-center col-5 nopadding">${quList.answerTitle}</span>
                                                <span class="text-center col-2 nopadding">미답변</span>
                                                <span class="text-center col-1 nopadding"><img src="/static/icons/up.svg"
                                                                                               class="rounded- mx-auto checkv" alt="V"
                                                                                               title="V"></span>
                                            </div>

                                        </div>
                                    </li>
<%--                                </c:if>--%>
                                </c:forEach>
                            </ul>
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

    async function useCoupon(btn) {
        let idx = btn.nextElementSibling.value;
        //console.log("idx: " + idx);

        let option = {
            method: "post",
            body: idx,
            headers: {
                'Content-Type': 'application/json;charset=UTF-8'
            }
        };

        let response = await fetch("/api/useCoupon", option);
        let result = await response.json();
        //console.log(result);
        location.reload();

    }
</script>
</body>
</html>
