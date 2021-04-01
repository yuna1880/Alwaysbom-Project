<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/css/order/orderstyle.css">
</head>
<body>
<form action="/admin/fclass/completePayment" method="get" class="contents" id="contents" tabindex="0">

    <div id="root" data-app="payment">
        <div class="checkout_kukka_complete">
            <div class="inbox">
                <div class="checkout_note">
                    <h3 class="thank"><span class="name">고객이름</span>님의<br>주문이 완료되었습니다.</h3>
                    <p class="desc">새늘봄이 행복을 가득 담아 보내드릴게요!</p>
                    <p class="order_no">주문번호 : #</p>
                    <dl class="bank_info">
                        <dt class="th">입금계좌 안내
                            <span>다음계좌로 입금해주시면 주문이 완료됩니다.</span>
                        </dt>
                        <dd class="td">
                                    <span class="line">
                                        <b class="prop">계좌번호</b>
                                    <span class="val">비트은행 274-072066-01-041</span>
                                </span>
                            <span class="line">
                                    <b class="prop">예금주</b><span class="val">(주)새늘봄</span>
                                </span>
                            <span class="line"><b class="prop">입금금액</b>
                                        <span class="val">32,400 원</span></span>
                            <span class="line"><b class="prop">보내시는분</b>
                                        <span class="val">Yuna</span></span>
                            <span class="line"><b class="prop">입금기한</b>
                                        <span class="val">다음날 오전 9시까지</span>
                                        </span>
                        </dd>
                    </dl>
                    <p class="more">상세내역은 아래 주문내역조회에서<br>확인하실 수 있습니다.</p>
                </div>
                <div class="checkout_next">
                    <div class="content_bottom_button">
                        <div class="bottom_row">
                            <div class="bottom_col">
                                <a href="/" class="bottom_button is_default">쇼핑 계속하기</a>
                            </div>
                            <div class="bottom_col">
                                <a href="#" class="bottom_button is_active">주문 내역 조회</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

</body>
</html>
