<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <%@ include file="../main/import.jspf"%>
    <link href="/static/css/member/member_join.css" rel="stylesheet">
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
                        <form role="form" action="/member_join.do" method="post">
                            <fieldset>
                                <div class="form-group">
                                <div class="inner">
                                    <div class="row">
                                        <div class="th star">
                                            이메일 (아이디)
                                        </div>
                                        <div class="td">
                                            <span>
                                                <input type="text" name="id" value="${kakao_id}" class="ipt" maxlength="255" placeholder="예) alwaysbom@bom.kr" />
                                            </span>
                                            <button type="button" class="btn">중복확인</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="th star">
                                        비밀번호
                                    </div>
                                    <div class="td">
                                        <span>
                                            <input type="password" name="pw" id="pw" class="ipt" maxlength="255" placeholder="비밀번호를 입력해주세요." />
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="th star">
                                        비밀번호 확인
                                    </div>
                                    <div class="td">
                                        <span>
                                            <input type="password" name="pwCfm" class="ipt" maxlength="255" placeholder="비밀번호를 한 번 더 입력해주세요." autocomplete="off" />
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="th star">
                                        이름
                                    </div>
                                    <div class="td">
                                        <span>
                                            <input type="text" name="name" value="${kakao_name}" class="ipt" maxlength="255" placeholder="이름을 입력해주세요." />
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="th star">
                                        휴대폰번호 입력
                                    </div>
                                    <div class="td">
                                        <span>
                                            <input type="text" name="phone" id="phone" class="csr_phone ipt" maxlength="15" minlength="9" placeholder="' - ' 없이 숫자만 입력해주세요." />
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="th star">
                                        생년월일
                                    </div>
                                    <div class="td">
                                        <span>
                                            <input type="text" name="birth" id="birth" class="csr_phone ipt" placeholder="예) 86/04/02" />
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="th star">
                                        성별
                                    </div>
                                    <div class="td">
                                        <span>
                                            <input type="text" name="gender" value="${kakao_gender}" class="csr_phone ipt" placeholder="예) 여성:F 남성:M" />
                                        </span>
                                    </div>
                                </div>
                                <div class="inner">
                                    <div class="row">
                                        <input type="submit" class="btn btn-lg btn-success btn-block" value="회원가입" />
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
