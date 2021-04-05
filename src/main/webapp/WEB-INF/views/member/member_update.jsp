<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 정보 관리</title>
    <%@ include file="../main/import.jspf" %>
    <style>
        .h-5 {
            height: 5% !important;
        }

        .h-10 {
            height: 10% !important;
        }

        .h-85 {
            height: 85% !important;
        }
        .bg-pink {
            background-color: #f5b0cf;
        }
        .name-color {
            color: #d869db;
        }
        .bannerName-color {
            color: #f7ebf1;
        }
        a {
            text-decoration: none;
        }
        hr {
            color: white;
        }
        .hr1{
            color: dimgrey;
        }
        .list-group-item {
            border: none;
            font-size: 15px;
        }
        .btn-warning {
            width: 200px;
            height: 60px;
            color: #2c3034;
        }
    </style>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="mx-auto d-flex flex-column h-100 user-select-none">
    <%@ include file="../member/mypage_header.jspf" %>
    <div class="d-flex h-5">
        <div class="col-2"></div>
        <div class="col-10 d-flex justify-content-center px-5 pt-4">
        </div>
    </div>
    <div class="h-85 d-flex">
        <%@ include file="../member/mypage_menu.jspf" %>
            <div class="col-10 border-info d-flex justify-content-center p-4">
                <div class="col-12">
                    <div class="h5 col-12 d-flex flex-column text-secondary">
                        <div class="d-flex">
                            <span>회원 정보 관리</span>
                        </div>
                        <hr class="hr1"/>
                    </div>
                    <div class="join_us_box">
                        <div class="inbox">
                            <form role="form" action="/member_update" method="post" onsubmit="confirm();">
                                <fieldset>
                                    <div class="form-group">
                                        <div class="inner">
                                            <div class="row">
                                                <div class="th">
                                                    <span class="txt">이름</span>
                                                </div>
                                                <div class="td">
                                                    <div class="ipt title">
                                                        <input type="text" name="name" value="${sessionScope.member.name}" maxlength="255" class="form-control form-control-sm" required id="id_name" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="th">
                                                    <span class="txt">비밀번호</span>
                                                </div>
                                                <div class="td">
                                                    <div class="ipt title">
                                                        <input type="password" name="pw" value="${sessionScope.member.pw}" maxlength="255" class="form-control form-control-sm" required id="id_pw" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="th">
                                                    <span class="txt">비밀번호 확인</span>
                                                </div>
                                                <div class="td">
                                                    <div class="ipt title">
                                                        <input type="password" name="pwCfm" maxlength="255" class="form-control form-control-sm" required id="id_pwCfm"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="th">
                                                    <span class="txt">아이디(이메일)</span>
                                                </div>
                                                <div class="td">
                                                    <div class="ipt title">
                                                        <input type="text" name="id" value="${sessionScope.member.id}" readonly="readonly" class="form-control form-control-sm" maxlength="255"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="th">
                                                    <span class="txt">휴대폰 번호</span>
                                                </div>
                                                <div class="td">
                                                    <div class="ipt title">
                                                        <input type="text" name="phone" id="phone" value="${sessionScope.member.phone}" class="form-control form-control-sm" maxlength="15" minlength="9"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="th">
                                                    <span class="txt">생년월일</span>
                                                </div>
                                                <div class="td">
                                                    <div class="ipt title">
                                                        <input type="date" name="birth" id="birth" value="${sessionScope.member.birth}" class="form-control form-control-sm" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="th">
                                                    <span class="txt">성별</span>
                                                </div>
                                                <div class="d-grid gap-2 d-flex col-12 gender-area">
                                                    <label class="col-6">
                                                        <input type="radio" name="gender" value="female" ${sessionScope.member.gender eq 'female' ? "checked" : ""}
                                                               class="d-none" ${empty sessionScope.member.gender ? "" : "disabled"} />
                                                        <span class="col-12 d-block p-3 btn btn-gender">여성</span>
                                                    </label>
                                                    <label class="col-6">
                                                        <input type="radio" name="gender" value="male" ${sessionScope.member.gender eq 'male' ? "checked" : ""}
                                                               class="d-none" ${empty sessionScope.member.gender ? "" : "disabled"}>
                                                        <span class="col-12 d-block p-3 btn btn-gender">남성</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="d-grid col-3 mx-auto">
                                                <input type="submit" class="btn btn-lg m-4 btn-outline-danger" value="정보수정" />

                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script>
    function confirm(){
        alert('정보 수정이 완료되었습니다:-)');
    };
</script>
</body>
<%@ include file="../main/footer.jspf"%>
</div>
</html>
<style>
    .btn-gender,
    .gender-area input[type=radio]:not([checked])[disabled] + .btn-gender:hover {
        background-color: #eccccf;
        color: #FFFFFF;
    }

    .gender-area input[type=radio] + .btn-gender:hover {
        background-color: #f5b0cf;
        color: #FFFFFF;
    }

    .gender-area input[type=radio]:checked + .btn-gender,
    .gender-area input[type=radio][checked] + .btn-gender {
        background-color: #f5b0cf;
        color: #FFFFFF;
    }
</style>