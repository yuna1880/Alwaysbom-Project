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

        // function kakaoLogout() {
        //     //로그아웃
        //     if (!Kakao.Auth.getAccessToken()) {
        //         console.log('Not logged in.');
        //         return;
        //     }
        //     Kakao.Auth.logout(function () {
        //         console.log(Kakao.Auth.getAccessToken());
        //     });
        //     //연결 끊기
        //     Kakao.API.request({
        //         url: '/v1/user/unlink',
        //         success: function(response) {
        //             console.log(response);
        //         },
        //         fail: function(error) {
        //             console.log(error);
        //         },
        //     });
        // }
    </script>
</head>
<script type="text/javascript">
    function DosignUp() {
            $(document).ready(function(){
                var isCheckId = 0;

                var id = $("#id").val();
                var pw = $("#pw").val();
                var pwCfm = $("#pwCfm").val();
                var name = $("#name").val();
                var phone = $("#phone").val();
                var birth = $("#birth").val();
                var gender = $("#gender").val();

                $("#submit").on("click", function () {
                    if (id == "") {
                    alert("아이디(이메일)를 입력해 주세요");
                    id.focus();
                    return false;
                }
                    if (pw == "") {
                    alert("비밀번호를 입력해주세요.");
                    pw.focus();
                    return false;
                }
                    if (pw != pwCfm) {
                    alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요.");
                    pw.focus();
                    return false;
                }
                    if (name == "") {
                    alert("성명을 입력해주세요.");
                    name.focus();
                    return false;
                }
                    if (phone == "") {
                    alert("휴대폰 번호를 입력해주세요.");
                    phone.focus();
                    return false;
                }
                    if (birth == "") {
                    alert("생년월일을 입력해주세요(예시)85/03/25.");
                    birth.focus();
                    return false;
                }
                    if (gender == "") {
                    alert("성별을 입력해주세요(예시)여성:F 남성:M");
                    gender.focus();
                    return false;
                }
            });
        });
    }

</script>
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
                                        <input type="submit" class="btn btn-lg btn-success btn-block" value="회원가입" onclick="DosignUp();" />
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
