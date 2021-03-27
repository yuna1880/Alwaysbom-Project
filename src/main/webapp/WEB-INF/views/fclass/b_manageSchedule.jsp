<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>클래스 일정 관리</title>
    <%@ include file="../main/b_import.jspf" %>
    <link rel="stylesheet" href="/static/bootstrap-datepicker/bootstrap-datepicker.css">
    <script src="/static/bootstrap-datepicker/bootstrap-datepicker.js"></script>
</head>
<body>
<%@ include file="../main/b_header.jspf" %>
<div id="container" class="mx-auto d-flex h-100 p-4">
    <div class="col-8 h-100 d-flex flex-column border-warning border-end px-4">
        <div class="w-100 d-flex justify-content-center align-items-center p-3 position-relative">
            <div class="position-absolute top-0 start-0 bg-dark text-white rounded-3 p-2">
                <span>${fclass.category}</span> /
                <span>${fclass.name}</span> /
                <span>${branch.name}</span>
            </div>
            <span class="fs-2 fw-bold">클래스 조회</span>
        </div>
        <div class="h-100 w-100 d-flex flex-column align-items-center">
            <label class="form-label">
                <input type="text" placeholder="조회하실 클래스의 날짜를 선택해주세요" id="dataForm" class="dateselect form-floating p-4" required="required"/>
            </label>
            <table class="table table-hover">
                <thead class="table-dark">
                <tr>
                    <th scope="col" class="col-1">No</th>
                    <th scope="col" class="col-3">클래스 수강일</th>
                    <th scope="col" class="col-2">시작시간</th>
                    <th scope="col" class="col-2">종료시간</th>
                    <th scope="col" class="col-2">수강정원</th>
                    <th scope="col" class="col-2">등록인원</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>

                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>

                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-4 h-100 d-flex flex-column px-4">
        <div class="w-100 d-flex justify-content-center align-items-center p-3">
            <span class="fs-2 fw-bold">수강등록</span>
        </div>
        <div class="h-100 w-100 d-flex flex-column align-items-center">
            <div><input type="text" placeholder="등록할 수강일을 선택해주세요" id="classDate" class="dateselect form-floating p-2 mb-2 dataForm2" required="required" aria-label="수강일"/></div>
            <div class="mb-2"><input type="time" id="startTime" class="dataForm2 form-floating p-2" placeholder="시작시간" value="10:00" required="required" aria-label="시작시간"/></div>
            <div class="mb-2"><input type="time" id="endTime" class="dataForm2 form-floating p-2" placeholder="종료시간" value="20:00" required="required" aria-label="종료시간"/></div>
            <div class="mb-2"><input type="text" id="capacity" class="dataForm2 form-floating p-2" placeholder="수강정원" pattern="[0-9]+" onkeyup="this.reportValidity()" required="required" aria-label="수강정원"/></div>
            <div class="d-flex justify-content-between">
                <button type="button" class="btn btn-secondary w-50 m-2" onclick="addSchedule()">추가</button>
                <button type="button" class="btn btn-dark w-50 m-2">완료</button>
            </div>
        </div>
    </div>
</div>
<%@ include file="../main/b_footer.jspf" %>
<script type="text/javascript">
    async function addSchedule() {
        let classDate = document.querySelector("#classDate");
        let startTime = document.querySelector("#startTime");
        let endTime = document.querySelector("#endTime");
        let capacity = document.querySelector("#capacity");
        let data = {
            branchIdx: ${branch.idx},
            fclassIdx: ${fclass.idx},
            sdate: classDate.value,
            startTime: startTime.value,
            endTime: endTime.value,
            totalCount: capacity.value
        };

        let option = {
            method: "post",
            body: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json;charset=UTF-8"
            }
        };

        let response = await fetch("/admin/fclass/api/addSchedule", option);
        console.log(response);
        let result = await response.json();
        console.log(result);



    }
    $(function () {
        let $datepicker = $('.dateselect').datepicker({
            format: 'yyyy-mm-dd',
            showOtherMonths: false,
            startDate: 'noBefore',
            endDate: '+60d',
            setDate: 'today',
            todayHighlight: true,
            title: '새늘봄 클래스 일정을 선택해주세요',
            language: 'ko'
            // multidate: 3,
            // datesDisabled: ['03/29/2021']
        });
    });

    function filterKey(event, filter) {
        if (filter) {
            var sKey = String.fromCharCode(event.keyCode);
            var re = new RegExp(filter);
            if (!re.test(sKey)) event.returnValue = false;
        }
    }

</script>

</body>
</html>

<style>

    #dataForm {
        border: none;
        border-radius: 2rem;
        width: 385px;
        text-align: center;
        font-size: large;
        font-weight: bold;
    }
    .dataForm2 {
        border: none;
        border-radius: 1rem;
        text-align: center;
        width: 230px;
    }
    table {
        text-align: center;
    }

</style>