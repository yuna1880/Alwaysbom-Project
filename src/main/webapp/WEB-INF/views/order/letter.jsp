<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>새늘봄 - checkout</title>
    <link rel="stylesheet" href="/static/css/order/orderstyle.css">
    <%@ include file="../main/import.jspf"%>
    <script>
        function printLetter($letter, index) {
            const letter = $letter.value;
            document.querySelector("#preview[data-preview-index='" + index + "']").innerText = letter;
            document.querySelector("#letter_press_cnt_[data-preview-index='" + index + "']").innerHTML = letter.length;
        }


        function submitForm() {
            //class="flower_letter"의 폼을 전부 선택.
            let letters = document.querySelectorAll(".flower_letter");
            let datas = [];
            for (let letter of letters) {
                let data = {
                    idx : letter.cart_idx.value,
                    name : letter.product_name.value,
                    content : letter.letter_content.value
                };
                //생성된 데이터 배열안에 넣어주기.
                datas.push(data);
            }

            //폼 동적으로 만들기
            let form = document.createElement("form")
            form.action = "/oitem/checkOut";
            form.method = "post";
            let data = document.createElement("input");
            data.name = "data";
            data.type = "text";
            //위에서 만든 데이터 배열을 Json 타입 문자열로 변환 -> input value로 설정해준다.
            data.value = JSON.stringify(datas);
            //만들어둔 form에 input 넣어준다.
            form.appendChild(data);
            document.body.appendChild(form);
            form.submit();
        }
    </script>
</head>

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
                <c:forEach var="oitem" items="${oitemList}" varStatus="status">
                <form class="flower_letter">
                <c:if test="${oitem.hasLetter eq true}">
                    <div id="letterbox-wrapper">
                        <input type="hidden" name="cart_idx" value="${oitem.idx}">
                        <div id="letter_product" class="letterbox">
                            <div class="letter">
                                <div class="select_letter">
                                    <input type="text" class="select_letter_select_tag" name="product_name"
                                           readonly value="${oitem.name}">
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
                                                          wrap="hard" placeholder="여기에 입력하세요 :-)" data-letter="" onkeyup="printLetter(this, ${status.index})"></textarea>
                                            <span class="limmit">
                                                <b data-preview-index="${status.index}" class="count" id="letter_press_cnt_">0</b> / 120
                                            </span>
                                            <span class="noti">*이모티콘은 편지 내용에 포함되지 않습니다.</span>
                                            <span class="noti">* 편지 내용을 이곳에 직접 입력해주세요.</span>
                                            <span class="noti">* 붙여넣기 시용시 편지가 입력 되지 않습니다.</span>
                                    </div>
                                    <div class="preview_letter">
                                        <textarea data-preview-index="${status.index}" id="preview" class="text" readonly></textarea>
                                        <span class="noti">* 실제 편지지 모습입니다. 최대 8줄까지만 인쇄됩니다.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:if>
                </form>
                    </c:forEach>
                        <!-- 버튼 -->
                        <div class="float-end">
                            <button type="button" class="btn btn-outline-secondary btn-lg"
                                    onclick="history.back()">이전 화면으로</button>
                            <!-- 여기서 받은 데이터를 submitForm() -->
                            <button type="button" class="btn btn btn-secondary btn-lg" onclick="submitForm()">다음 단계로</button>
                        </div>
                        <br>
                        </div>
                    </div>
<%@ include file="../main/footer.jspf"%>
</body>
</html>
