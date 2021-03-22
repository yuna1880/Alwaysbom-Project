<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    <title>Login Demo - Kakao JavaScript SDK</title>
</head>
<body>
<a href="javascript:kakaoLogin();"><img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:60px; width:auto;"/></a>
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
                    },
                    error: err => {
                        console.log(err);
                    }
                });
                Kakao.Auth.authorize({
                    redirectUri: '{REDIRECT_URI}'
                });
            }
        });
    }
</script>
</body>
</html>