<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <%@ include file="../main/import.jspf"%>
    <link href="/static/css/member/loginStyle.css" rel="stylesheet">
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

                            window.location.href="http://localhost:8070/member_join?kakao_id=" + kakao_id + "&kakao_name=" + kakao_name +"&kakao_gender=" + kakao_gender;
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
            <div id="root" data-app="login">
                <header class="content_header" style="position: static;">
                    <h2 class="page_title">로그인</h2>
                </header>
                <div class="login_box">
                    <div class="inner">
                        <div class="login_user_input">
                            <form>
                                <fieldset>
                                    <input type="hidden" name="csrfmiddlewaretoken" value="4Jo40kgJEICmLsn1yLNS1D1uLg2foCxgLLCSGDsgOEtkWtJGv6ix9hunfFqvVzOS">
                                    <input type="email" name="email" class="ipt" id="id_email" placeholder="아이디(이메일)" value>
                                    <input type="password" name="password" class="ipt" placeholder="비밀번호">
                                    <button type="submit" class="login">로그인</button>
                                </fieldset>
                            </form>
                        </div>
                        <div class="login_additional_link">
                            <a href="findId" class="link user find_id">아이디 찾기</a>
                            <a href="findPwd" class="link user find_pass">비밀번호 찾기</a>
                            <nav class="other">
                                <a href="/goMemberJoin" class="btn btn-secondary">회원가입</a>
                                <hr>
                                <p class="let_join">
                                    지금 회원가입 하시면
                                    <b>1,000p</b>
                                      바로 지급!
                                </p>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    </script>
    <%@ include file="../main/footer.jspf"%>
</body>
</html>
