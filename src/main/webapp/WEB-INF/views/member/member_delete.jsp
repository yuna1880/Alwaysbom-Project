<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>회원탈퇴</title>
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
                        <form action="/deleteMember" method="post">
                            <div class="d-flex text-secondary">
                                <span class="h5">회원 탈퇴 안내</span>
                            </div>
                            <hr class="hr1"/>
                            ${sessionScope.member.name} 고객님,
                            <br>
                            탈퇴를 원하신다니 마음이 아프네요.
                            <hr>
                            지금 탈퇴하시면 고객님의 ${sessionScope.member.point}포인트는 자동 소멸됨을 알려드립니다.
                            <div class="mt-5">
                                <span class="h5">비밀번호 확인(필수)</span>
                                <input type="password" name="pw" maxlength="255" class="form-control form-control-sm mt-3" required id="pw"/>
                            </div>
                            <div class="text-center mt-5">
                            <button type="submit" id="submit" class="btn btn-danger">탈퇴하기</button>
                            <button type="button" class="btn btn-secondary">취소하기</button>
                            </div>
                        </form>
                        <div>
                            <c:if test="${msg == false}">
                                비밀번호가 틀립니다.
                            </c:if>
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

