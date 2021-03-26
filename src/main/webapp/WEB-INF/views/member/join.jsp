<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>새늘봄 회원 가입</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="static/css/member/joinStyle.css">
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
        <aside class="member join" id="join_us_select">
            <div class="member_wrap">
                <div class="member_content new_2nd">
                    <h5 class="title">새늘봄 회원 가입</h5>
                    <div class="content_box">
                        <nav class="join_us_2nd">
                            <p class="blind">새늘봄 멤버쉽 회원가입을 할 수 있습니다.</p>
                            <p class="let_join">
                                <b>바로 사용할 수 있는 1,000P</b>
                                를 드려요!
                            </p>
                            <a href="memberJoin" class="link email">
                                이메일 회원가입
                            </a>
                            <p class="sns">

                                                      SNS 간편 회원가입

                              <span class="blind">SNS 계정으로 간편하게 새늘봄에 가입이 가능합니다.</span>
                            </p>
                            <a href="javascript:kakaoLogin();" class="link kakao">
                                카카오로 가입하기
                            </a>
                            <a href="" class="link naver">
                                네이버로 가입하기
                            </a>
                        </nav>
                    </div>
                </div>
            </div>
        </aside>
    </div>
    <%@ include file="../main/footer.jspf"%>
</body>
</html>
