<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <%@ include file="../main/import.jspf"%>
    <style>
        .valid { color: green; }
        .invalid { color: red; }
    </style>
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
                        <form role="form" action="/memberLogin" method="post">
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
                                            </span>
                                            <span class="valid">아이디를 입력하세요.(이메일 형식만 입력 가능)</span>
                                            <button type="button" id="btn-id" class="btn">중복확인</button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="th star">
                                            비밀번호
                                        </div>
                                        <div class="td">
                                            <span>
                                                <input type="password" name="pw" id="pw" class="ipt chk" maxlength="255" placeholder="비밀번호를 입력해주세요." />
                                                <span class="valid">비밀번호를 입력하세요.(영문 대/소문자, 숫자 모두 포함)</span>
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
                                                <span class="valid">동일하게 한 번 더 입력하세요.</span>
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
                                                <span class="valid">이름을 입력하세요.</span>
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
                                                <span class="valid">휴대폰 번호를 숫자만 입력하세요.</span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="th star">
                                            생년월일
                                        </div>
                                        <div class="td">
                                            <span>
                                                <input type="text" name="birth" id="birth" class="csr_phone ipt chk" placeholder="예) 86/04/02" />
                                                <span class="valid">생년월일을 년도/월/일로 입력하세요.</span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="th star">
                                            성별
                                        </div>
                                        <div class="td">
                                            <span>
                                                <input type="text" name="gender" value="${kakao_gender}" class="csr_phone ipt chk" placeholder="예) 여성:f 남성:m" />
                                                <span class="valid">성별을 입력하세요. 예) 여성:f 남성:m</span>
                                            </span>
                                        </div>
                                    </div>
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
<%--        <script type="text/javascript" src="/static/js/member/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>--%>
        <script type="text/javascript" src="/static/js/member/join_check.js"></script>
        <script type="text/javascript">
            //아이디 중복 검사
            $('#btn-id').on('click', function() {
                id_check();
            });

            //올바른 아이디 입력 형태인지 파악하여 유효하지 않다면 중복확인 불필요
            function id_check() {
                var $id = $('[name=id]');
                if($id.hasClass('chked')) return;
                console.log('go check');

                var data = join.tag_status($id);
                if(data.code != 'valid') {
                    alert('아이디 중복 확인 불필요\n' + data.desc);
                    $id.focus();
                    return;
                }

                $.ajax({
                    type: 'post',
                    url: 'id_check',
                    data: {id: $id.val()},
                    success: function(data) {
                        data = join.id_usable(data);
                        display_status($id.siblings('div'), data);
                        $id.addClass('chked');
                    },
                    error: function(req, text) {
                        alert(text + ': ' + req.status);
                    }
                });
            }

            //유효성 검사
            $('.chk').on('keyup', function(){
                if($(this).attr('name') == 'id') {
                    if(event.keyCode == 13) { id_check(); }
                    else {
                        $(this).removeClass('chked');
                        validate( $(this) );
                    }
                } else {
                    validate($(this));
                }
            });

            function validate(t) {
                var data = join.tag_status(t);
                display_status(t.siblings('div'), data);
            }

            function display_status(div, data) {
                div.text(data.desc);
                div.removeClass();
                div.addClass(data.code)
            }

            function go_join() {
                if( $('[name = name]').val() == '') {
                    alert('성명을 입력하세요!');
                    $('[name = name]').focus();
                    return;
                }

                //필수 항목의 유효성을 판단하도록 한다.
                //중복확인 한 경우
                if($('[name=id]').hasClass('chked') ) {
                    //이미 사용중인 경우는 회원가입 불가
                    if($('[name = id]').siblings('div').hasClass('invalid')) {
                        alert('회원가입 불가\n' + join.id.unusable.desc);
                        $('[name=id]').focus();
                        return;
                    }
                } else {
                    //중복확인 하지 않은 경우
                    if( !item_check($('[name=id]')) ) return;
                    else {
                        alert('회원가입 불가\n' + join.id.valid.desc);
                        $('[name=id]').focus();
                        return;
                    }
                }

                if(!item_check($('[name=pw]'))) return;
                if(!item_check($('[name=pw_ck]'))) return;
                if(!item_check($('[name=email]'))) return;

                $('form').submit();
            }

            function item_check(item) {
                var data = join.tag_status(item);
                if(data.code == 'invalid') {
                    alert('회원가입 불가! \n' + data.desc);
                    item.focus();
                    return false;
                } else return true;
            }
        </script>
        <%@ include file="../main/footer.jspf"%>
    </div>
</body>
</html>
