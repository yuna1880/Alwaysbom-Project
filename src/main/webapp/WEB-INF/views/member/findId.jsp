<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>아이디찾기</title>
    <%@ include file="../main/import.jspf"%>
    <link href="/static/css/member/findId.css" rel="stylesheet">
</head>
<body>
<%@ include file="../main/header.jspf" %>
    <div id="container" class="mx-auto d-flex flex-column align-items-center">
        <form role="form" action="/loginMember" method="post" class="col-5 d-flex flex-column">
            <h5 class="page_title text-center p-2 mt-5 text-secondary m-0 p-4 border-bottom border-secondary">아이디 찾기</h5>
            <span id="goto_path_next_page" style="display: none;">account/login</span>
                    <a href="#" class="page_back">
                        <span class="blind">이전 페이지</span>
                    </a>

                <div class="login_box">
                    <div class="inner">
                        <div class="login_user_input">
                            <form>
                                <fieldset>
                                    <input type="hidden" name="csrfmiddlewaretoken" value="CoTLBBQwzmuBf9DB4PogVdtvEKDpZsLLeiEqdHCiJsgmfOgcEf8ckjFT8H0Rwh">
                                    <div class="row">
                                        <p class="top_title">
                                            가입하실 때 입력하셨던
                                            <br>
                                            전화번호를 입력해주세요.
                                        </p>
                                    </div>
                                    <div class="row">
                                        <span class="col" style="width: 30%;">
                                            <select class="ipt" name="phone_1" id="id_phone_1">
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                                <option value="016">016</option>
                                                <option value="017">017</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                            </select>
                                        </span>
                                        <span class="col" style="width: 5%;">
                                            <span class="ipt">-</span>
                                        </span>
                                        <span class="col" style="width: 30%;">
                                            <input type="tel" name="phone_2" id="id_phone_2" class="ipt" maxlength="4" minlength="1" required value>
                                        </span>
                                        <span class="col" style="width: 5%;">
                                            <span class="ipt">-</span>
                                        </span>
                                        <span class="col" style="width: 30%;">
                                            <input type="tel" name="phone_3" id="id_phone_3" class="ipt" maxlength="4" minlength="1" required value>
                                        </span>
                                    </div>
                                    <button type="button" class="login" onclick="location.href='/foundId'">확인</button>
                                </fieldset>
                            </form>
                        </div>
                        <p class="login_under_noti">
                            -확인이 되지 않으시면 1:1문의를 남겨주세요.
                            <br>
                            (평일 AM10시-PM6시에 빠른 답변 가능합니다.)
                        </p>
                    </div>
                </div>
        </form>
<%@ include file="../main/footer.jspf"%>
</div>
</body>
</html>
