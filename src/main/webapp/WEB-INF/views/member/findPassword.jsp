<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비밀번호 찾기</title>
    <%@ include file="../main/import.jspf"%>
    <link href="/static/css/member/findId.css" rel="stylesheet">
</head>
<body>
    <%@ include file="../main/header.jspf" %>
    <div id="container" class="mx-auto">
        <section class="contents" id="contents" tabindex="0">
            <div id="root" data-app="login">
                <header class="content_header" style="position: static;">
                    <h2 class="page_title">비밀번호 찾기</h2>
                    <span id="goto_path_next_page" style="display: none;">account/login</span>
                    <a href="#" class="page_back">
                        <span class="blind">이전 페이지</span>
                    </a>
                </header>
                <div class="login_box">
                    <div class="inner">
                        <div class="login_user_input">
                            <form>
                                <fieldset>
                                    <input type="hidden" name="csrfmiddlewaretoken" value="CoTLBBQwzmuBf9DB4PogVdtvEKDpZsLLeiEqdHCiJsgmfOgcEf8ckjFT8H0Rwh">
                                    <div class="row">
                                        <p class="top_title">
                                            ID(이메일 주소)를 입력하시면,
                                            <br>
                                            메일로 인증번호가 발송됩니다.
                                        </p>
                                    </div>
                                    <div class="row">
                                        <input type="email" id="id_email" class="ipt" name="pwd_request_email" placeholder="이메일 (예시 : alwaysbom@bom.kr)" value>
                                    </div>
                                    <a href="foundPwd" class="login"><button type="button" class="login">확인</button></a>
                                </fieldset>
                            </form>
                        </div>
                        <p class="login_under_noti">
                            - 유효 메일이 아니거나 휴면 상태일 경우 수신 어려움.
                            <br>
                            - 새늘봄 메일을 수신 차단시 수신 어려움.
                            <br>
                            - 확인되지 않을시 1:1 문의를 남겨주시기 바랍니다.
                            <br>
                            (평일 AM10시-PM6시에 빠른 답변 가능합니다.)
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <%@ include file="../main/footer.jspf"%>
    </div>
</body>
</html>
