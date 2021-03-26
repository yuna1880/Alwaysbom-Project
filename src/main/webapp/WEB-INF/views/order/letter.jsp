<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>새늘봄 - checkout</title>
    <link rel="stylesheet" href="/static/css/order/orderstyle.css">
    <%@ include file="../main/import.jspf"%>
</head>
<script>
    function printLetter() {
         const letter = document.getElementById('message').value;
         document.getElementById('preview').innerText = letter;

         document.getElementById('letter_press_cnt_').innerHTML = letter.length;
    }
</script>
<body>
<%@ include file="../main/header.jspf" %>

    <div class="container">
        <!-- 헤더 -->
        <div class="checkout_wrap">
            <div class="navi" tabindex="-1">
                <ol class="process">
                    <div class="step current"><span class="order"><b>1</b><span class="desc">편지 추가</span></span></div>
                    <div class="step"><span class="order"><b>2</b><span class="desc">주소 입력</span></span></div>
                    <div class="step"><span class="order"><b>3</b><span class="desc">결제</span></span></div>
                </ol>
            </div>

            <!-- 편지 폼 -->
            <div class="checkout_letter_add">
                <div class="head">
                    <div class="float-start">
                        <h4 class="tit">메시지카드</h4>
                    </div><br>
                </div>

                <!-- letter 옵션 추가시, 그 개수만큼 생성해준다. -->
                <c:forEach var="cart" items="${cartList}">
                <c:if test="${cart.letter > 0}">
                <form action="/checkOut" method="post">
                    <div id="letterbox-wrapper">
                        <input type="hidden" name="cart_idx" value="${cart.idx}">

                        <div id="letter_product" class="letterbox">
                            <div class="letter">
                                <div class="select_letter">
                                    <input type="text" class="select_letter_select_tag" name="letter_product_name"
                                           readonly value="${cart.productVo.name}">
                                </div>
                                <div class="role_select_checked">
                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">
                                                메세지 없이 카드만 받을게요
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <!-- 편지 내용 -->

                                <div class="input_letter_wrap write">
                                    <div class="input_letter">
                                        <textarea id="message" name="letter_content" class="letter_press" rows="8" maxlength="120"
                                                          wrap="hard" placeholder="여기에 입력하세요 :-)" data-letter="" onkeyup="printLetter()"></textarea>
                                            <span class="limmit">
                                                <b class="count" id="letter_press_cnt_">0</b> / 120
                                            </span>
                                            <span class="noti">*이모티콘은 편지 내용에 포함되지 않습니다.</span>
                                            <span class="noti">* 편지 내용을 이곳에 직접 입력해주세요.</span>
                                            <span class="noti">* 붙여넣기 시용시 편지가 입력 되지 않습니다.</span>
                                    </div>
                                    <div class="preview_letter">
                                        <textarea id="preview" class="text" readonly></textarea>
                                        <span class="noti">* 실제 편지지 모습입니다. 최대 8줄까지만 인쇄됩니다.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:if>
                    </c:forEach>
                    </div>
                        <!-- 버튼 -->
                        <div class="float-end">
                            <button type="button" class="btn btn-outline-secondary btn-lg"
                                    onclick="history.back()">이전 화면으로</button>
                            <button type="submit" class="btn btn btn-secondary btn-lg">다음 단계로</button>
                        </div>
                        </form>
                        <br>
                        </div>
                    </div>
<%@ include file="../main/footer.jspf"%>
</body>
</html>
