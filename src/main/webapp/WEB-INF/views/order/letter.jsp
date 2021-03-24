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
                <div id="letterbox-wrapper">
                    <div id="letter_product" class="letterbox">
                        <input type="hidden" name="letter_product_" value="">
                        <div class="letter">
                            <div class="select_letter">
                                <input type="text" class="select_letter_select_tag" name="letter_product_name"
                                       readonly="" value="가벼운 S 꽃구독">
                            </div>
                            <div class="role_select_checked">
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            메세지 없이 카드만 받을게요
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <!-- 편지 내용 -->

                            <div class="input_letter_wrap write">
                                <div class="input_letter">
                                    <textarea id="message" name="message" class="letter_press" rows="8" maxlength="120"
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
                                    <span class="noti">
                                                * 실제 편지지 모습입니다. 최대 8줄까지만 인쇄됩니다.
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 버튼 -->
            <div class="float-end">
                <button type="button" class="btn btn-outline-secondary btn-lg">이전 화면으로</button>
                <button type="button" class="btn btn btn-secondary btn-lg">다음 단계로</button>
            </div>
            <br>
        </div>
    </div>
<%@ include file="../main/footer.jspf"%>
</body>
</html>
