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
                            <button type="button" class="btn btn-warning" onclick="location.href='/community/goFaq'">자주 묻는 질문</button>
                            <button type="button" class="btn btn-warning" onclick="location.href='/question/create'">1:1 문의하기</button>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">작성일</th>
                                <th scope="col">제목</th>
                                <th scope="col">상태</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>2021.03.29</td>
                                <td>안녕하세요^^</td>
                                <td>답변완료</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>2021.03.29</td>
                                <td>궁금합니다.</td>
                                <td>확인중</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>2021.03.30</td>
                                <td>주문 수정 문의합니다.</td>
                                <td>확인중</td>
                            </tr>
                            </tbody>
                        </table>
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
