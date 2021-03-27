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
            <div>
            <label class="form-label">
                <input type="text" placeholder="조회하실 클래스의 날짜를 선택해주세요" id="dataForm" class="dateselect form-floating p-4" onclick="checkValidDate()" required="required"/>
            </label>
            <button type="button" class="btn btn-dark" onclick="searchSchedule()">검색</button>
            </div>
            <table class="table table-hover" id="scheduleTable" disabled>
                <thead class="table-dark" id="scheduleThead"></thead>
                <tbody id="scheduleTbody" class="overflow-auto"></tbody>
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
    async function searchSchedule() {
        let sdate = document.querySelector("#dataForm");
        let data = {
            fclassIdx: ${fclass.idx},
            branchIdx: ${branch.idx},
            sdate: sdate.value
        };

        let option = {
            method: "post",
            body: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json;charset=UTF-8"
            }
        };
        let response = await fetch("/admin/fclass/api/searchSchedule", option);
        let result = await response.json();
        console.log(result);

        let scheduleThead = document.querySelector("#scheduleThead");
        scheduleThead.innerHTML = '<tr><th scope="col" class="col-1">No</th>'
                                + '<th scope="col" class="col-3">클래스 수강일</th>'
                                + '<th scope="col" class="col-2">시작시간</th>'
                                + '<th scope="col" class="col-2">종료시간</th>'
                                + '<th scope="col" class="col-2">수강정원</th>'
                                + '<th scope="col" class="col-2">등록인원</th>'
                                + '</tr>'

        let tbody = document.querySelector("#scheduleTbody");
        tbody.innerHTML = "";
        result.forEach(function (schedule, index) {
            let tr = document.createElement("tr");
            tr.innerHTML = '<th scope="row">' + (index + 1) + '</th>';
            // tr.innerHTML += '<td>' + new Date(schedule.sdate).toLocaleDateString() + '</td>'
            tr.innerHTML += '<td>' + schedule.smonth + '월 ' + schedule.sday + '일' + '</td>'
            tr.innerHTML += '<td>' + schedule.startTime + '</td>'
            tr.innerHTML += '<td>' + schedule.endTime + '</td>'
            tr.innerHTML += '<td>' + schedule.totalCount + '</td>'
            tr.innerHTML += '<td>' + schedule.regCount + '</td>';
            tbody.appendChild(tr);
        })
    }

    async function addSchedule() {
        let classDate = document.querySelector("#classDate");
        let startTime = document.querySelector("#startTime");
        let endTime = document.querySelector("#endTime");
        let capacity = document.querySelector("#capacity");
        let data = {
            branchIdx: ${branch.idx},
            fclassIdx: ${fclass.idx},
            sday: classDate.value,
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
        response.json().then((result) => {
            console.log(result);
            alert("클래스 일정이 추가되었습니다")
            // location.href = "/admin/fclass/manageSchedule?classIdx=" + result.fclassIdx + "&branchIdx=" + result.branchIdx;
        }).catch(() => alert("클래스 일정 추가에 실패했습니다"));
    }

    async function checkValidDate() {
        console.log("야 호출되냐?");
        let dataForm = document.querySelector("#dataForm");

        let disabledArrayInit = [];

        let today = new Date().getTime();
        for(let i = 0; i < 60; i++) {
            let date = new Date(today + 1000 * 60 * 60 * 24 * i);
            let year = date.getFullYear();
            let month = date.getMonth() + 1;
            let day = date.getDate();
            month = month < 10 ? '0' + month : month;
            day = day < 10 ? '0' + day : day;

            let dateString = year + "-" + month + "-" + day;
            disabledArrayInit.push(dateString);
        }

        let data = {
            branchIdx: ${branch.idx},
            fclassIdx: ${fclass.idx}
        };

        let option = {
            method: "post",
            body: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json;charset=UTF-8"
            }
        };

        let response = await fetch("/admin/fclass/api/searchSchedule", option);
        let result = await response.json();
        console.log(result);

        for (let scheduleVo of result) {
            let sdate = new Date(scheduleVo.sdate);
            let year = sdate.getFullYear();
            let month = sdate.getMonth() + 1;
            let day = sdate.getDate();
            month = month < 10 ? '0' + month : month;
            day = day < 10 ? '0' + day : day;

            let sdateString = year + "-" + month + "-" + day;

            let number = disabledArrayInit.indexOf(sdateString);
            disabledArrayInit.splice(number, 1);
        }


        // //fetch 했다 치고
        // let fetchResult = ['2021-03-29', '2021-03-30'];
        // for (let enabledDate of fetchResult) {
        //     let number = disabledArrayInit.indexOf(enabledDate);
        //     disabledArrayInit.splice(number, 1);
        // }

        $('.dateselect').datepicker("setDatesDisabled",disabledArrayInit);

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

        $datepicker.languate = 'en';
    });

    function filterKey(event, filter) {
        if (filter) {
            var sKey = String.fromCharCode(event.keyCode);
            var re = new RegExp(filter);
            if (!re.test(sKey)) event.returnValue = false;
        };
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