<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>아이디찾기 완료</title>
    <%@ include file="../main/import.jspf"%>
    <link href="/static/css/member/findId.css" rel="stylesheet">
</head>
<body>
    <%@ include file="../main/header.jspf" %>
    <div id="container" class="mx-auto">
        <section class="contents" id="contents" tabindex="0">
            <div id="root" data-app="login">
                <header class="content_header" style="position: static;">
                    <h2 class="page_title">아이디 찾기</h2>
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
                                            입력하신 정보와 일치하는
                                            <br>
                                            ID(이메일) 입니다.
                                        </p>
                                    </div>
                                    <div class="row">
                                        <ul class="login_id_find_results">
                                            <li class="list">찾은아이디(이메일)</li>
                                        </ul>
                                    </div>
                                    <a href="memberLogin" class="login"><button type="button" class="login">로그인</button></a>
                                    <div class="login_additional_link">
                                        <a href="/findPwd" class="link user find_pass">비밀번호 찾기</a>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <p class="login_under_noti">
                            - 개인정보 보호를 위해 아이디의 일부만 보여집니다.
                            <br>
                            - 확인되지 않으시면 1:1 문의를 남겨주시기 바랍니다.
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
