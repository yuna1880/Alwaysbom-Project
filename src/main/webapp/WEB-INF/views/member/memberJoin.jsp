<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <%@ include file="../main/import.jspf"%>
    <link href="/static/css/member/memberJoin.css" rel="stylesheet">
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
                        <form method="post" id="register-form" accept-charset="UTF-8" autocomplete="off">
                            <div>
                                <input type="hidden" name="csrfmiddlewaretoken" value="fwykk4yM17LQZ3Q5cdgWRnNSSyf2syC41KLcj6n191fRboahbnqgc2n9mEKsdQ8X">
                                <div class="inner">
                                    <div class="row">
                                        <div class="th star">
                                            이메일 (아이디)
                                        </div>
                                        <div class="td">
                                            <span>
                                                <input type="email" name="email" id="id_email" class="ipt" maxlength="255" placeholder="예) alwaysbom@bom.kr" autocomplete="off" required value>
                                            </span>
                                            <button type="button" class="btn">중복확인</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row blind">
                                    <div class="th star">
                                        비밀번호
                                    </div>
                                    <div class="td">
                                        <span>
                                            <input type="password" name="none_password">
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="th star">
                                        비밀번호
                                    </div>
                                    <div class="td">
                                        <span>
                                            <input type="password" name="password_1" id="id_password_1" class="ipt" maxlength="255" placeholder="비밀번호를 입력해주세요." autocomplete="off" required value>
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="th star">
                                        비밀번호 확인
                                    </div>
                                    <div class="td">
                                        <span>
                                            <input type="password" name="password_2" class="ipt" maxlength="255" placeholder="비밀번호를 한 번 더 입력해주세요." autocomplete="off" required value>
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="th star">
                                        이름
                                    </div>
                                    <div class="td">
                                        <span>
                                            <input type="text" name="name" id="id_name" class="ipt" maxlength="255" placeholder="이름을 입력해주세요." required value>
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="th star">
                                        휴대폰번호 입력
                                    </div>
                                    <div class="td">
                                        <span>
                                            <input type="text" name="phone_text" id="id_phone_text" class="csr_phone ipt" maxlength="15" minlength="9" placeholder="' - ' 없이 숫자만 입력해주세요." required value>
                                        </span>
                                        <button type="button" id="csr_request" class="csr_request btn">확인</button>
                                    </div>
                                </div>
                                <div class="row" style="display: none; opacity: 0.2;">
                                    <div class="th star">생년월일</div>
                                    <div class="td">
                                        <span>
                                            <input type="text" class="ipt" name="birthday" id="id_birthday" placeholder="자동입력" required readonly value>
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <span class="th star">
                                        생년월일
                                    </span>
                                    <span class="td">
                                        <span style="float: left; width: 50%; margin: 0px;">
                                            <input type="text" class="ipt" name="id_birthday_year" id="id_birthday_year" placeholder="년도) 1999" required maxlength="4" value>
                                        </span>
                                        <span style="float: left; width: 2%; height: 100%; margin: 0px; opacity: 0;">-</span>
                                        <span style="float: left; width: 23%; margin: 0px;">
                                            <input type="text" class="ipt" name="id_birthday_month" id="id_birthday_month" placeholder="월" required maxlength="2" value>
                                        </span>
                                        <span style="float: left; width: 2%; height: 100%; margin: 0px; opacity: 0;">-</span>
                                        <span style="float: left; width: 23%; margin: 0px;">
                                            <input type="text" class="ipt" name="id_birthday_day" id="id_birthday_day" placeholder="일" required maxlength="2" value>
                                        </span>
                                    </span>
                                </div>
                                <div class="row">
                                    <input type="hidden" name="gender" id="id_gender" required value="1">
                                    <div class="th star">
                                        성별
                                    </div>
                                    <div class="td">
                                        <span>
                                            <div class="select_sex">
                                                <div class="tab selected">
                                                    <label for="lb_sex_female">여성</label>
                                                    <input type="radio" name="select_sex" id="lb_sex_female" checked>
                                                </div>
                                                <div class="tab">
                                                    <label for="lb_sex_man">남성</label>
                                                    <input type="radio" name="select_sex" id="lb_sex_man" checked>
                                                </div>
                                            </div>
                                        </span>
                                    </div>
                                </div>
                                <div class="row_agree">
                                    <div class="row">
                                        <span class="th star">
                                            이용약관 동의
                                        </span>
                                        <ul class="agree_list">
                                            <li class="list">
                                                <label class="condition_true">
                                                    <span>모두 동의합니다.</span>
                                                    <input type="checkbox" id="id_agreement_all" class="chk">
                                                    <span class="ico"></span>
                                                </label>
                                            </li>
                                            <li class="list bot">
                                                <label class="condition_true">
                                                    <span>
                                                        이용약관 동의
                                                        <b>(필수)</b>
                                                    </span>
                                                    <input type="checkbox" name="agreement_use" required id="id_agreement_use" class="chk">
                                                    <span class="ico"></span>
                                                </label>
                                            </li>
                                            <li class="list">
                                                <label class="condition_true">
                                                    <span>
                                                        개인정보 수집, 이용동의
                                                        <b>(필수)</b>
                                                    </span>
                                                    <input type="checkbox" name="agreement_info" required id="id_agreement_info" class="chk">
                                                    <span class="ico"></span>
                                                </label>
                                            </li>
                                            <li class="list">
                                                <label class="condition_true">
                                                    <span>
                                                        개인정보 이용 동의
                                                        <b>(필수)</b>
                                                    </span>
                                                    <input type="checkbox" name="agreement_privacy" required id="id_agreement_privacy" class="chk">
                                                    <span class="ico"></span>
                                                </label>
                                            </li>
                                            <li class="list">
                                                <label class="condition_true">
                                                    <span>이벤트, 혜택정보 수신 동의 (선택)</span>
                                                    <input type="checkbox" name="agreement_newsletter" id="id_agreement_newsletter" class="chk">
                                                    <span class="ico"></span>
                                                </label>
                                            </li>
                                        </ul>
                                        <div class="agree_terms">
                                            <button type="button" class="btn" id="show_member_agreement">이용약관 보기</button>
                                            <button type="button" class="btn" id="show_member_privacy">
                                                개인정보 처리방침 보기
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="inner">
                                    <div class="row">
                                        <input type="button" class="btn_submit" value="회원가입">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <%@ include file="../main/footer.jspf"%>
    </div>
</body>
</html>
