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
<div id="container" class="mx-auto d-flex flex-column align-items-center">
    <form role="form" action="/loginMember" method="post" class="col-5 d-flex flex-column">
        <h5 class="page_title text-center p-2 mt-5 text-secondary m-0 p-4 border-bottom border-secondary">로그인</h5>
        <input type="email" name="id" class="py-3 mt-5 my-3" id="id_email" placeholder="아이디(이메일)" value>
        <input type="password" name="pw" class="mt-4 py-3 mb-3" placeholder="비밀번호">
        <button type="submit" class="mt-4 py-3 btn-warning mb-3 text-center">로그인</button>
        <div class="d-flex justify-content-center">
            <a href="findId" class="p-2 text-decoration-none text-secondary">아이디 찾기</a>
            <a href="findPwd" class="p-2 text-decoration-none text-secondary">비밀번호 찾기</a>
        </div>
        <a href="/goMemberJoin" class="mt-4 py-3 btn-secondary text-center text-decoration-none">회원가입</a>
        <p class="text-center mt-2">지금 회원가입 하시면<b class="p-2 text-center text-info">1,000p</b>바로 지급!</p>
    </form>
</div>
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
<%@ include file="../main/footer.jspf"%>
</body>
</html>
