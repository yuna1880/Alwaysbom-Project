<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <%@ include file="../main/import.jspf"%>
    <script src="/static/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
<form role="form" action="/member_join" method="post">
    <div class="join-header py-3 mb-4">
        <h5 class="page_title text-center p-2 mt-5 text-secondary m-0">회원가입</h5>
    </div>

    <label class="my-2">이메일 (아이디)</label>
    <div class="d-flex mb-4">
        <input type="text" name="id" value="${kakao_id}" class="col-10 mr-3" maxlength="255" placeholder="예) alwaysbom@bom.kr" />
        <button type="button" class="CheckId col-2" onclick="CheckId()">중복 확인</button>
    </div>

    <label class="my-2">비밀번호</label>
    <input type="password" name="pw" id="pw" class="col-12 mb-4" maxlength="255" placeholder="비밀번호를 입력해주세요."/>

    <label class="my-2">비밀번호 확인</label>
    <input type="password" name="pwCfm" class="col-12 mb-4" maxlength="255" placeholder="비밀번호를 한 번 더 입력해주세요." autocomplete="off" />

    <label class="my-2">이름</label>
    <input type="text" name="name" value="${kakao_name}" class="col-12 mb-4" maxlength="255" placeholder="이름을 입력해주세요." />

    <label class="my-2">휴대폰번호 입력</label>
    <input type="text" name="phone" id="phone" class="col-12 mb-4" maxlength="15" minlength="9" placeholder="예) 010-1234-5678" />

    <label class="my-2">생년월일</label>
    <input type="date" name="birth" id="birth" class="col-12 mb-4" placeholder="예)86/05/04" />

    <label class="my-2">성별</label>
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
    <div class="d-grid col-3 mx-auto">
        <input type="submit" class="btn btn-lg m-4 btn-outline-danger" value="회원가입" />
    </div>
</form>
</div>
    <%@ include file="../main/footer.jspf"%>
    <script type="text/javascript">
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

        function CheckId(){
            var query = {id : $("#id").val()};

            $.ajax({
                url: "/member/member_join",
                type: "POST",
                data: query, //서버로부터 내가 받는 데이터의 타입

                success: function(data){
                    if(data == 0){
                        console.log("아이디 없음");
                        alert("사용하실 수 있는 아이디입니다.");
                    }else{
                        console.log("아이디 있음");
                        alert("중복된 아이디가 존재합니다.");
                    }
                }
            });
        }
    </script>
</body>
</html>
<style>
    .btn-gender,
    .gender-area input[type=radio]:not([checked])[disabled] + .btn-gender:hover {
        background-color: darkgrey;
        color: white;
    }

    .gender-area input[type=radio] + .btn-gender:hover {
        background-color: grey;
        color: white;
    }

    .gender-area input[type=radio]:checked + .btn-gender,
    .gender-area input[type=radio][checked] + .btn-gender {
        background-color: grey;
        color: white;
    }
</style>