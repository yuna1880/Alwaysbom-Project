<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>새늘봄 - checkout</title>
    <%@ include file="../main/import.jspf" %>
    <link rel="stylesheet" href="/static/css/order/orderstyle.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        //배송지목록 찾기 -> 모달
        $(function () {
            $("#btnradio2").on("click", function () {
                $.ajax({
                    url: "/order/findAddress",
                    type: "post",
                    success: function (data) {
                        document.getElementById('findAddr').click();
                        document.getElementById('find-name').value = data.receiverName;
                        document.getElementById('find-zipcode').value = data.receiverZipcode;
                        document.getElementById('find-address').value = data.receiverAddrBase;
                        document.getElementById('find-address-details').value = data.receiverAddrDetail;
                        document.getElementById('find-address-extra').value = data.receiverAddrExtra;
                    },
                    error: function () {
                        alert("실패!!!!");
                    }
                });
            });
        });
    </script>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div class="container">
    <!-- 헤더 -->
    <div class="checkout_wrap">
        <div class="navi" tabindex="-1">
            <ol class="process">
                <li class="step"><span class="order"><b>1</b><span class="desc">편지 추가</span></span></li>
                <li class="step current"><span class="order"><b>2</b><span class="desc">주소 입력</span></span></li>
                <li class="step"><span class="order"><b>3</b><span class="desc">결제</span></span></li>
            </ol>
        </div>

        <form name="frm" method="post">
            <div class="checkout_content">
                <div class="step" id="inputAddress">
                    <div class="infomation_box">
                        <div class="checkout_address_input">
                            <p class="noti">거의 다 왔어요, 이제 주소만 적어주세요 :-)</p>
                            <div class="address_tabs role_tabs">

                                <!-- 배송지 라디오 버튼 -->

                                <div class="check_row_method" id="check_row_method">
                                    <div class="row" style="width: 630px;">
                                        <div class="btn-group" role="group"
                                             aria-label="Basic radio toggle button group">
                                            <input type="radio" class="btn-check" name="btnradio" id="btnradio1"
                                                   autocomplete="off" checked>
                                            <label class="btn btn-outline-primary" id="btn-text" for="btnradio1"
                                                   onclick="addDelivery()">배송지 입력</label>
                                            <!-- 누르면 ajax로 배송지 찾는 컨트롤러로 이동 -->
                                            <input type="radio" class="btn-check" name="btnradio" id="btnradio2"
                                                   onclick="findDelivery()">
                                            <!-- 모달 실행 -->
                                            <input type="hidden" name="btnradio" id="findAddr"
                                                   data-bs-toggle="modal" data-bs-target="#exampleModal">
                                            <label class="btn btn-outline-primary" for="btnradio2">배송지 목록</label>
                                            <input type="radio" class="btn-check" name="btnradio" id="btnradio3"
                                                   onclick="addSender()" autocomplete="off">
                                            <label class="btn btn-outline-primary" for="btnradio3">받는 분이 입력</label>
                                        </div>
                                    </div>
                                </div>

                                <!-------------------------------------결제 주소 입력창1 ----------------------------------------------------------------------->

                                <div class="address_tabpanel role_tabpanelbox">

                                    <!-- 주소입력창 -->
                                    <div class="role_tabpanel opened" tabindex="0" role="tabpanel" id="input_info">
                                        <div class="address_input_table">
                                            <div class="detail">
                                                <c:forEach var="letter" items="${letter}">
                                                    <input type="hidden" name="idx" value="${letter.idx}">
                                                    <input type="hidden" name="name" value="${letter.name}">
                                                    <input type="hidden" name="letterContent" value="${letter.content}">
                                                </c:forEach>
                                                <span class="th">수령인 이름</span>
                                                <div class="td">
                                                    <input maxlength="255" id="receiving_name" name="receiverName" type="text" value="유나" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="detail">
                                                <span class="th">수령인 연락처</span>
                                                <div class="td_phone">
                                                    <div>
                                                        <select id="receiving_phone1" name="receiver_phone1">
                                                            <option value="010">010</option>
                                                            <option value="011">011</option>
                                                            <option value="016">016</option>
                                                            <option value="017">017</option>
                                                            <option value="018">018</option>
                                                            <option value="019">019</option>
                                                        </select>
                                                    </div>
                                                    <span class="d">-</span>
                                                    <div>
                                                        <input type="phone" maxlength="4" id="receiving_phone2" name="receiver_phone2" value="" autocomplete="off">
                                                    </div>
                                                    <span class="d">-</span>
                                                    <div>
                                                        <input type="phone" maxlength="4" class="form-control form-control-small" id="receiving_phone3" name="receiver_phone3" value="" autocomplete="off">
                                                        <input type="hidden" id="receiver_phone" name="receiverPhone">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="detail">
                                                <span class="th">우편번호</span>
                                                <div class="td">
                                                    <div class="find_address">
                                                        <input type="text" maxlength="128" class="find" id="receiving_postcode" autocomplete="off" name="receiverZipcode" placeholder="주소 검색" readonly="" value="" onclick="showPostcode()">
                                                        <span class="empty"></span>
                                                        <button type="button" class="btn btn-light btn-sm" onclick="showPostcode()">찾기</button>
                                                        <%--  <button type="button" class="btn btn-outline-secondary">찾기</button> --%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="detail">
                                                <span class="th">주소</span>
                                                <span class="td">
                                                    <input type="text" maxlength="255" id="receiving_address_1" autocomplete="off" name="receiverAddrBase" readonly="" value="">
                                                </span>
                                            </div>
                                            <div class="detail">
                                                <span class="th">상세주소</span>
                                                <span class="td">
                                                    <input type="text" maxlength="255" id="receiving_address_2" autocomplete="off" name="receiverAddrDetail" value="">
                                                </span>
                                            </div>
                                            <div class="detail">
                                                <span class="th">참고주소</span>
                                                <span class="td">
                                                    <input type="text" maxlength="255" id="receiving_address_3" autocomplete="off" name="receiverAddrExtra" value="">
                                                </span>
                                            </div>
                                            <div class="detail">
                                                <span class="th">발신인</span>
                                                <span class="td_unknown"><input type="text" maxlength="64" autocomplete="off" id="sender_name" name="senderName" value="Yuna">
                                                    <span class="unknow_noti">
                                                        <input type="checkbox" name="sender_unknown" id="sender_unknown" class="lb_unknow_name_new" onchange="unknownName()">
                                                        <label for="sender_unknown">익명으로 보내기</label>
                                                    </span>
                                                </span>
                                            </div>
                                            <div class="detail">
                                                <span class="th">배송지 저장</span>
                                                <span class="td_unknown">
                                                    <span class="unknow_noti2">
                                                        <label class="save_delivery">
                                                            <input type="radio" class="save_address" name="save_address" value="저장하기" onclick="saveAddress()">저장하기
                                                        </label>
                                                        <label>
                                                            <input type="radio" class="save_address no" name="save_address" value="저장안함" checked>저장안함
                                                        </label>
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                        <!-- 주의사항-->
                                        <span class="unknow_txt modify_0724">
                                                <span class="l"><i>*</i><b>익명으로 보내기를 선택할 경우, 주의할 것이 있어요.</b>
                                                    <br>보내는 분의 성함이 기재되지 않아 받는 분이 수령을 거부하기도 해요.<br>
                                                    이 경우 환불이나 교환이 어려우니 꼭 확인하신 후 체크 부탁드릴게요.</span>
                                                <span class="l"><i>*</i><b>토요일 수령 선택 시 주의사항</b>
                                                    <br>토요일 수령을 선택하실 경우, 회사 주소는 배송이 어려워요.
                                                    <br>자택이나 수령인이 직접 받으실 수 있는 주소지로 입력 부탁드릴게요.
                                                </span>
                                            </span>
                                    </div>

                                    <!-------------------------------------받는분이 입력하는 란----------------------------------------------------------------------->

                                    <div class="role_tabpanel" tabindex="-1" role="tabpanel" id="sender_input" aria-labelledby="tabpanel_address_to">
                                        <div>
                                            <div class="unknow_address">
                                                <h4 class="tit">받는 분의 주소를 모르셔도 괜찮아요.<br>
                                                    kukka가 대신 여쭤볼게요 :-)</h4>
                                                <ul class="noti_txt">
                                                    <li class="color_red">기재해주신 연락처로 배송지를 입력할 수 있는 URL이 발송됩니다.</li>
                                                    <li class="color_red">입력 기간은 3일이며, 기한 내에 입력이 완료되지 않으면 주문은 취소됩니다.</li>
                                                    <li class="color_red">혹시 오류로 인해 문자가 가지 않는다면 [마이페이지-주문내역]에서 [다시 전송] 버튼을 눌러 주세요.</li>
                                                    <li class="color_red">받아보시는 분의 주소는 기존 배송지 목록에 추가되지 않습니다.</li>
                                                </ul>
                                            </div>
                                            <%--                                                <div>--%>
                                            <%--                                                    <ul class="list-unstyled m-0 p-0 text-secondary">--%>
                                            <%--                                                        <li class="d-flex py-2">--%>
                                            <%--                                                            <div class="col-3">수령인 이름</div>--%>
                                            <%--                                                            <div class="col-9">--%>
                                            <%--                                                                <input class="w-100 border border-secondary text-secondary" type="text" value="권유나">--%>
                                            <%--                                                            </div>--%>
                                            <%--                                                        </li>--%>
                                            <%--                                                        <li class="d-flex py-2">--%>
                                            <%--                                                            <div class="col-3">수령인 연락처</div>--%>
                                            <%--                                                            <div class="col-9 d-flex">--%>
                                            <%--                                                                <select id="receiving_phone1_gift" name="receiving_phone1_gift" class="border border-secondary text-secondary" style="flex: 0 0 auto; width: 32%;">--%>
                                            <%--                                                                    <option value="010">010</option>--%>
                                            <%--                                                                    <option value="011">011</option>--%>
                                            <%--                                                                    <option value="016">016</option>--%>
                                            <%--                                                                    <option value="017">017</option>--%>
                                            <%--                                                                    <option value="018">018</option>--%>
                                            <%--                                                                    <option value="019">019</option>--%>
                                            <%--                                                                </select>--%>
                                            <%--                                                                <span class="text-center" style="flex: 0 0 auto; width:2%;">-</span>--%>
                                            <%--                                                                <input class="border border-secondary text-secondary" style="flex: 0 0 auto; width: 32%;" type="text">--%>
                                            <%--                                                                <span class="text-center" style="flex: 0 0 auto; width:2%;">-</span>--%>
                                            <%--                                                                <input class="border border-secondary text-secondary" style="flex: 0 0 auto; width: 32%;" type="text">--%>
                                            <%--                                                            </div>--%>
                                            <%--                                                        </li>--%>
                                            <%--                                                    </ul>--%>
                                            <%--                                                </div>--%>
                                            <table class="address_input_table">
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <div class="detail">
                                                            <span class="th">수령인 이름</span>
                                                            <span class="td">
                                                                        <input maxlength="255" id="receiving_name_gift" name="receiving_name_gift" type="text" value="권유나" autocomplete="off">
                                                                    </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="detail">
                                                            <span class="th">수령인 연락처</span>
                                                            <div class="td_phone">
                                                                <div>
                                                                    <select id="receiving_phone1_gift" name="receiving_phone1_gift">
                                                                        <option value="010">010</option>
                                                                        <option value="011">011</option>
                                                                        <option value="016">016</option>
                                                                        <option value="017">017</option>
                                                                        <option value="018">018</option>
                                                                        <option value="019">019</option>
                                                                    </select>
                                                                </div>
                                                                <span class="d">-</span>
                                                                <div id="id_form-0-phone_2_form-group">
                                                                    <input type="text" maxlength="4" id="receiving_phone2_gift" name="receiving_phone2_gift" value="5847" autocomplete="off">
                                                                </div>
                                                                <span class="d">-</span>
                                                                <div>
                                                                    <input type="text" maxlength="4" class="form-control form-control-small" id="receiving_phone3_gift" name="receiving_phone3_gift" value="1880" autocomplete="off">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- 여기 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="complete">
                    <button type="button" class="info_btn next" id="purchase_submit" onclick="submitForm(this.form)">
                        <span>결제하기</span>
                    </button>
                    <button type="button" class="info_btn back" onclick="history.back()">
                        <span>이전 단계로</span>
                    </button>
                </div>
            </div>
        </form>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">최근 배송지</h5>
                        <button type="button" id="close-button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="address_input_table">
                            <div class="detail">
                                <span class="th">수령인 이름</span>
                                <span class="td">
                                    <input name="receiving_name" id="find-name" type="text" readonly>
                                </span>
                            </div>
                            <div class="detail">
                                <span class="th">우편번호</span>
                                <span class="td">
                                    <input type="text" class="saved_address" id="find-zipcode" name="receiving_zipcode" readonly>
                                </span>
                            </div>
                            <div class="detail">
                                <span class="th">주소</span>
                                <span class="td">
                                    <input type="text" class="saved_address" id="find-address" name="receiving_address" readonly>
                                </span>
                            </div>
                            <div class="detail">
                                <span class="th">상세주소</span>
                                <span class="td">
                                    <input type="text" class="saved_address" id="find-address-details" name="receiving_address_detail" readonly>
                                </span>
                            </div>
                            <div class="detail">
                                <span class="th">참고주소</span>
                                <span class="td">
                                    <input type="text" class="saved_address" id="find-address-extra" name="receiving_address_extra" readonly>
                                    <button type="button" class="btn btn-dark btn-sm" onclick="selectAddress()">선택</button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="closed-button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Close
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../main/footer.jspf" %>
<script>
    //라디오버튼 화면 변경
    window.onload = function () {
        addDelivery();
    }
    function addDelivery() {
        document.getElementById('sender_input').style.display = 'none';
        document.getElementById('input_info').style.display = 'block';
    }
    function addSender() {
        document.getElementById('input_info').style.display = 'none';
        document.getElementById('sender_input').style.display = 'block';
    }
    function findDelivery() {
        document.getElementById('sender_input').style.display = 'none';
        document.getElementById('input_info').style.display = 'block';
    }
    function unknownName() {
        let unknown = document.getElementById('sender_unknown');
        if (unknown.checked == true) {
            document.getElementById('sender_name').value = '';
        }
    }
    //다음 주소 API
    data = {
        userSelectedType: '',
        roadAddress: '',
        jibunAddress: '',
        bname: '',
        buildingName: '',
        zonecode: ''
    };
    function showPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목 클릭했을때 실행할 코드를 작성하는 부분.
                // 내려오는 변수가 값이 없는 경우에는 공백('')값을 가지므로, 이를 참고하여 분기한다.
                let fullAddr = ''; // 최종 주소 변수
                let extraAddr = ''; // 조합형 주소 변수
                // 사용자가 선택한 주소 타입에 따라 해당 주소값을 가져온다.
                if (data.userSelectedType === 'R') {
                    // 사용자가 도로명 주소 선택
                    fullAddr = data.roadAddress;
                } else { // 지번주소 선택(J)
                    fullAddr = data.jibunAddress;
                }
                //사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if (data.userSelectedType === 'R') {
                    //동 이름 추가
                    if (data.bname !== '') {
                        extraAddr += data.bname;
                    }
                    //건물명 있으면 추가
                    if (data.buildingName !== '') {
                        //조합형 주소의 유무에 따라 양쪽에 괄호를 추가해서 최종 주소를 만든다.
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    //조합형 주소의 유무에 따라 양쪽에 괄호를 추가해서 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ') ' : '');
                }
                //우편번호와 주소정보를 해당 필드에 넣는다. 5자리 새 우편번호 사용.
                document.getElementById('receiving_postcode').value = data.zonecode;
                document.getElementById('receiving_address_1').value = fullAddr;
                //커서를 상세주소 필드로 이동한다.
                document.getElementById('receiving_address_2').focus();
            }
        }).open();
    }
    function selectAddress() {
        let name = document.getElementById('find-name').value;
        let zip = document.getElementById('find-zipcode').value;
        let addr = document.getElementById('find-address').value;
        let addrDeatil = document.getElementById('find-address-details').value;
        let addrExtra = document.getElementById('find-address-extra').value;

        document.getElementById('receiving_name').value = name;
        document.getElementById('receiving_postcode').value = zip;
        document.getElementById('receiving_address_1').value = addr;
        document.getElementById('receiving_address_2').value = addrDeatil;
        document.getElementById('receiving_address_3').value = addrExtra;
        document.getElementById('close-button').click();

    }
    function submitForm(frm) {
         let f = document.frm;
         let phone = f.receiver_phone1.value + '-' + f.receiver_phone2.value + '-' + f.receiver_phone3.value;
         document.getElementById('receiver_phone').value = phone;
        alert("합친번호 : " + phone);
        //컨트롤러 이동
        f.action = "/order/payment";
        f.submit();
    }
</script>
</body>
</html>