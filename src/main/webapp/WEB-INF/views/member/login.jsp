<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <%@ include file="../main/import.jspf"%>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<style>
    .join-header {
        border-bottom: 1px solid #4D4D4D;
    }
</style>
<body>
<%@ include file="../main/header.jspf" %>
<div class="col-5 mx-auto">
<form role="form" action="/loginMember" method="post">
    <div class="join-header py-3 mb-4">
        <h5 class="page_title text-center p-2 text-secondary m-0">로그인</h5>
    </div>
    <p>
        <input type="email" name="id" class="col-6 mx-auto d-flex" id="id_email" placeholder="아이디(이메일)" value>
    </p>
    <p class="d-flex">
        <input type="password" name="pw" class="col-6 mx-auto" placeholder="비밀번호">
    </p>
    <button type="submit" class="d-flex">로그인</button>

                        <a href="findId" class="d-flex">아이디 찾기</a>
                        <a href="findPwd" class="d-flex">비밀번호 찾기</a>
                        <a href="/goMemberJoin" class="btn-secondary d-flex">회원가입</a>
                        <hr>
    <p class="text-center">지금 회원가입 하시면<b class="text-center text-info">1,000p</b>바로 지급!</p>
</form>
<%@ include file="../main/footer.jspf"%>
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
</body>
</html>
