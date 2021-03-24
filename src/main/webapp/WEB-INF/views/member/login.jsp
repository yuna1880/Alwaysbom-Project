<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>로그인</title>
    <%@ include file="../main/import.jspf"%>
    <link href="<c:url value="/static/css/member/loginStyle.css" />" rel="stylesheet" >
</head>
<body>
    <%@ include file="../main/header.jspf" %>
    <div class="d-flex justify-content-center">
        <div id="container">
            <section class="contents" id="contents" tabindex="0">
                <div id="root" data-app="login">
                    <header class="content_header is_fixed_header">
                        <h2 class="page_title">로그인</h2>
                        <span id="goto_path_next_page" style="display: none;"></span>
                        <a href="#" class="page_back"><img src="<c:url value="/static/image/backimg.jpg"/>" width="24px;" height="24px;" style="margin: 0px 20px 20px 20px;" />
                            <span class="blind">이전 페이지</span>
                        </a>
                        <a href="#" class="page_home"><img src="<c:url value="/static/image/homeimg.jpg"/>" width="24px;" height="24px;" style="margin: 15px 20px 20px 20px;" />
                            <span class="blind">메인화면으로</span>
                        </a>
                    </header>
                    <div class="login_box">
                        <h3 class="current">회원</h3>
                        <div class="inner">
                            <div class="login_user_input">
                                <form method="post">
                                    <fieldset>
                                        <input type="hidden" name="csrfmiddlewaretoken" value="4Jo40kgJEICmLsn1yLNS1D1uLg2foCxgLLCSGDsgOEtkWtJGv6ix9hunfFqvVzOS">
                                        <input type="email" name="email" class="ipt" id="id_email" placeholder="아이디(이메일)" value>
                                        <input type="password" name="password" class="ipt" placeholder="비밀번호">
                                        <div class="row">
                                            <label class="condition_true" for="">
                                                <span>로그인 상태 유지</span>
                                            </label>
                                        </div>
                                        <button type="submit" class="login">로그인</button>
                                    </fieldset>
                                </form>
                            </div>
                            <div class="login_additional_link">
                                <p class="blind">로그인에 불편을 느낀다면,</p>
                                <a href="" class="link user find_id">아이디 찾기</a>
                                <a href="" class="link user find_pass">비밀번호 찾기</a>
                                <nav class="other">
                                    <p class="sns">SNS계정으로 간편 로그인</p>
                                    <div class="socials">
                                        <a href="" class="link social kakao">
                                            <span class="blind">Kakao 로그인</span>
                                        </a>
                                        <a href="" class="link social naver">
                                            <span class="blind">Naver 로그인</span>
                                        </a>
                                    </div>
                                    <p class="blind">아직 회원이 아니신가요?</p>
                                    <a href="#" class="link join">회원가입</a>
                                    <p class="let_join">
                                        지금 회원가입 하시면
                                        <b>1,000p</b>
                                          바로 지급!
                                    </p>
                                </nav>
                            </div>
                        </div>
                        <a href="" class="goto_none">
                           비회원
                          <span class="blind">주문 조회 페이지 이동</span>
                        </a>
                    </div>
                </div>
            </section>
            <%@ include file="../main/footer.jspf"%>
        </div>
    </div>
</body>
</html>
