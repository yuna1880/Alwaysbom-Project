<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="my_epilogue_wrap">

    <!-- 1:1 문의 작성 폼 -->
    <div class="epilogue_write">

        <div class="epilogue_write_form inquiry">
            <form id="question-form" accept="" method="post" enctype="multipart/form-data">
                <input type="hidden" name="csrfmiddlewaretoken" value="Rmv8xzCNSR7nPTPOZRp5kWTODLgFgxIlcwQI4geUfkzt9QF9k00JOEfRe4NrFDPx">
                <input type="hidden" name="question_id" id="id_question_id" value="new">
                <fieldset>
                    <legend></legend>
                    <div class="row">
                        <div class="th"><span class="txt">주문번호</span></div>
                        <div class="td order">
                            <button id="account-question-order-search-btn" type="button" class="righ_btn search modalOpener" modal-data="inquiryOrderListOk">주문
                                조회
                            </button>
                            <div class="ipt">
                                <input type="text" name="order_no" maxlength="128" id="id_order_no">
                            </div>
                        </div>
                    </div>
                    <div class="row '">
                        <div class="th"><span class="txt">제목</span></div>
                        <div class="td">
                            <div class="ipt title">
                                <input type="text" name="title" maxlength="1024" required="" id="id_title">

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="th"><span class="txt">내용</span></div>
                        <div class="td">
                            <div class="ipt">
                                <textarea name="message" cols="40" rows="5" class="form-control form-control-small" required="" id="id_message"></textarea>

                            </div>
                            <span class="warring">게시판 성격에 맞지 않는 글의 경우, 게시가 중단될 수 있습니다.</span>
                            <span class="td_tit">사진 첨부</span>
                            <div class="ipt_file_boot f0" style="display: block;">
                                <div class="inner">
                                    <input type="file" name="image" accept="image/*" class="file_select" id="id_image" tabindex="-1" style="position: absolute; clip: rect(0px, 0px, 0px, 0px);"><div class="bootstrap-filestyle input-group"><input type="text" class="form-control " placeholder="" disabled=""> <span class="group-span-filestyle input-group-btn" tabindex="0"><label for="id_image" class="btn btn-default "><span class="icon-span-filestyle glyphicon glyphicon-folder-open"></span> <span class="buttonText"> 사진 선택</span></label></span></div>
                                </div>
                                <button type="button" class="file_del" style="display: none;"><span class="blind">첨부삭제</span></button>
                            </div>
                            <span class="ipt_file_noti">(5mb, 최대 3장 첨부 가능)</span>

                            <div class="ipt_file_boot f1" style="display: none;">
                                <div class="inner">
                                    <input type="file" name="image_1" accept="image/*" class="file_select" id="id_image_1" tabindex="-1" style="position: absolute; clip: rect(0px, 0px, 0px, 0px);"><div class="bootstrap-filestyle input-group"><input type="text" class="form-control " placeholder="" disabled=""> <span class="group-span-filestyle input-group-btn" tabindex="0"><label for="id_image_1" class="btn btn-default "><span class="icon-span-filestyle glyphicon glyphicon-folder-open"></span> <span class="buttonText"> 사진 선택</span></label></span></div>
                                </div>
                                <button type="button" class="file_del" style="display: none;"><span class="blind">첨부삭제</span></button>
                            </div>

                            <div class="ipt_file_boot f2" style="display: none;">
                                <div class="inner">
                                    <input type="file" name="image_2" accept="image/*" class="file_select" id="id_image_2" tabindex="-1" style="position: absolute; clip: rect(0px, 0px, 0px, 0px);"><div class="bootstrap-filestyle input-group"><input type="text" class="form-control " placeholder="" disabled=""> <span class="group-span-filestyle input-group-btn" tabindex="0"><label for="id_image_2" class="btn btn-default "><span class="icon-span-filestyle glyphicon glyphicon-folder-open"></span> <span class="buttonText"> 사진 선택</span></label></span></div>
                                </div>
                                <button type="button" class="file_del" style="display: none;"><span class="blind">첨부삭제</span></button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="th"><span class="txt">답변 받기</span></div>
                        <div class="td">
                            <div class="ipt_checkbox">
                                <div class="role_checkbox">
                                    <label class="label checked"><input type="checkbox" name="reply_to_email" checked="checked" id="id_reply_to_email"> E-Mail</label>
                                </div>
                                <div class="role_checkbox">
                                    <label class="label"><input type="checkbox" name="reply_to_phone" id="id_reply_to_phone"> Message</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row_submit">
                        <a id="question_form_submit" href="#" class="btn submit">등록하기</a>
                    </div>
                </fieldset>
            </form>
        </div>
        <!-- 주문 내역 선택 -->
        <div class="modal" id="inquiryOrderListOkModal">
            <div class="modal_wrap">
                <div class="modal_content">
                    <h5 class="title"></h5>
                    <div class="content-box">
                        <!-- 주문 내역이 존재. -->
                        <div class="order_list">
                            <table>
                                <thead>
                                <tr>
                                    <th>주문 일자</th>
                                    <th>상품 내역</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>
                                    <td>2021.03.18</td>
                                    <td>그리너리 릴리 에디션</td>
                                    <td><a href="#" class="select" onclick="select_order(event, &quot;20210318110323357473&quot;);">선택</a></td>
                                </tr>
                                <script>
                                    function select_order(event, order_no) {
                                        event.preventDefault();
                                        $('#id_order_no').val(order_no);
                                        closeModal();
                                        // $('#inquiryOrderListOkModal').hide(500);
                                    }
                                </script>

                                </tbody>
                            </table>
                        </div>



                    </div>
                    <a href="#" class="close"><span class="blind">팝업 닫기</span></a>
                </div>
            </div>
        </div>

        <!-- 별점 선택 액션 -->
        <script>
            require(['config'], function () {
                require(['jquery', 'datepicker'], function ($, datepicker) {
                    $(function () {
                        // Code...

                        // 파일 선택

                        // 주문 내역 선택 시 코드

                    })
                });
            });
        </script>

    </div>

</div>
</body>
</html>
