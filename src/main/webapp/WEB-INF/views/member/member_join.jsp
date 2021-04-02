<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <%@ include file="../main/import.jspf"%>
    <link href="/static/css/member/member_join.css" rel="stylesheet">
    <script src="/static/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        Kakao.init("a7ed8ce3bc2337bb4281fa9fc4d51ddd");
        Kakao.isInitialized();

        function kakaoLogin() {
            Kakao.Auth.login({
                scope:'profile, account_email, gender, birthday',
                success: function (authObj) {
                    window.Kakao.API.request({
                        url:'/v2/user/me',
                        success: res => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account);

                            var kakao_id = kakao_account.email;
                            var kakao_name = kakao_account.profile.nickname;
                            var kakao_gender = kakao_account.gender;
                        }
                    });
                }
            });
        }
    </script>
</head>
<body>
    <%@ include file="../main/header.jspf" %>
    <div id="container" class="mx-auto">
        <section class="contents" id="contents" tabindex="0">
            <div id="root" data-app="join">
                <header class="content_header is_fixed_header" style="position: static;">
                    <h2 class="page_title">회원가입</h2>
                </header>
                <div class="join_us_box">
                    <div class="inbox">
                        <form role="form" action="/member_join" method="post">
                            <fieldset>
                                <div class="form-group">
                                <div class="inner">
                                    <div class="row">
                                        <div class="th star">
                                            이메일 (아이디)
                                        </div>
                                        <div class="td">
                                            <span>
                                                <input type="text" name="id" value="${kakao_id}" class="ipt chk" maxlength="255" placeholder="예) alwaysbom@bom.kr" />
                                                <span class="check_font" id="id_check"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="th star">
                                            비밀번호
                                        </div>
                                        <div class="td">
                                            <span>
                                                <input type="password" name="pw" id="pw" class="ipt chk" maxlength="255" placeholder="비밀번호를 입력해주세요." />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="th star">
                                            비밀번호 확인
                                        </div>
                                        <div class="td">
                                            <span>
                                                <input type="password" name="pwCfm" class="ipt chk" maxlength="255" placeholder="비밀번호를 한 번 더 입력해주세요." autocomplete="off" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="th star">
                                            이름
                                        </div>
                                        <div class="td">
                                            <span>
                                                <input type="text" name="name" value="${kakao_name}" class="ipt chk" maxlength="255" placeholder="이름을 입력해주세요." />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="th star">
                                            휴대폰번호 입력
                                        </div>
                                        <div class="td">
                                            <span>
                                                <input type="text" name="phone" id="phone" class="csr_phone ipt chk" maxlength="15" minlength="9" placeholder="' - ' 없이 숫자만 입력해주세요." />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="th star">
                                            생년월일
                                        </div>
                                        <div class="td">
                                            <span>
                                                <input type="date" name="birth" id="birth" class="csr_phone ipt chk" placeholder="예)86/05/04" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="th star">
                                            성별
                                        </div>
                                        <div class="d-grid gap-2 d-flex col-12 gender-area">
                                            <label class="col-6">
                                                <input type="radio" name="gender" value="female" ${kakao_gender eq 'female' ? "checked" : ""}
                                                       class="d-none" ${empty kakao_gender ? "" : "disabled"}>
                                                <span class="col-12 d-block p-3 btn btn-gender">여성</span>
                                            </label>
                                            <label class="col-6">
                                                <input type="radio" name="gender" value="male" ${kakao_gender eq 'male' ? "checked" : ""}
                                                       class="d-none" ${empty kakao_gender ? "" : "disabled"}>
                                                <span class="col-12 d-block p-3 btn btn-gender">남성</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="d-grid col-3 mx-auto">
                                        <input type="submit" class="btn btn-lg m-4 btn-outline-danger" value="회원가입" />
                                    </div>
                                </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <%@ include file="../main/footer.jspf"%>
    </div>
</body>
</html>
<style>
    .btn-gender,
    .gender-area input[type=radio]:not([checked])[disabled] + .btn-gender:hover {
        background-color: #eccccf;
        color: #FFFFFF;
    }

    .gender-area input[type=radio] + .btn-gender:hover {
        background-color: #f5b0cf;
        color: #FFFFFF;
    }

    .gender-area input[type=radio]:checked + .btn-gender,
    .gender-area input[type=radio][checked] + .btn-gender,
    .gender-area input[type=radio][disabled] + .btn-gender:hover {
        background-color: #f5b0cf;
        color: #FFFFFF;
    }
</style>