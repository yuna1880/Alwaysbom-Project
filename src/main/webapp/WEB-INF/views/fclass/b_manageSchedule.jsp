<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>클래스 일정 관리</title>
    <%@ include file="../main/b_import.jspf"%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
</head>
<body>
<%@ include file="../main/b_header.jspf"%>
<div id="container" class="mx-auto d-flex">
<%--    <h2>${category}</h2>
    <h2>${classIdx}</h2>
    <h2>${branchIdx}</h2>--%>
    <div class="col-8 bg-secondary justify-content-between">
        <div class="bg-primary d-flex p-5">
            <select class="form-select me-3">
                <option selected>클래스 '월' 선택</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
            <select class="form-select">
                <option selected>클래스 '일' 선택</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
        </div>
        <div class="bg-success p-5">
            <table class="table">
                <thead class="table-dark">
                <tr>
                    <th scope="col" class="col-8">#</th>
                    <th scope="col" class="col-1">First</th>
                    <th scope="col" class="col-1">Last</th>
                    <th scope="col" class="col-2">Handle</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td colspan="2">Larry the Bird</td>
                    <td>@twitter</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-4 bg-warning d-flex justify-content-center align-items-center">
        <label class="form-label">
            <!--     <input data-provide="datepicker" required="required"> -->
            <input type="text" class="dateselect form-floating" required="required"/>
            <span>Date</span>
        </label>
    </div>
</div>
<%@ include file="../main/b_footer.jspf"%>
<script type="text/javascript"> $(function () {
    $('.dateselect').datepicker({
        format: 'mm/dd/yyyy',
        // startDate: '-3d'
    });
});
</script>

</body>
</html>

<style>

/*    label {
        position: relative;
        display: block;
    }
    label > input {
        position: relative;
        background-color: transparent;
        border: none;
        border-bottom: 1px solid #9e9e9e;
        border-radius: 0;
        outline: none;
        height: 45px;
        width: 100%;
        font-size: 16px;
        margin: 0 0 30px 0;
        padding: 0;
        box-shadow: none;
        box-sizing: content-box;
        transition: all .3s;
    }
    label > input:valid + span {
        transform: translateY(-25px) scale(0.8);
        transform-origin: 0;
    }
    label > input:valid {
        border-bottom: 1px solid #3F51B5;
        box-shadow: 0 1px 0 0 #3F51B5;
    }
    label > span {
        color: #9e9e9e;
        position: absolute;
        top: 0;
        left: 0;
        font-size: 16px;
        cursor: text;
        transition: .2s ease-out;
    }
    label > input:focus + span {
        transform: translateY(-25px) scale(0.8);
        transform-origin: 0;
        color: #3F51B5;
    }
    label > input:focus {
        border-bottom: 1px solid #3F51B5;
        box-shadow: 0 1px 0 0 #3F51B5;
    }*/




    /*Bootstrap Calendar*/
    .datepicker {
        border-radius: 0;
        padding: 0;
    }
    .datepicker-days table thead, .datepicker-days table tbody, .datepicker-days table tfoot {
        padding: 10px;
        display: list-item;
    }
    .datepicker-days table thead, .datepicker-months table thead, .datepicker-years table thead, .datepicker-decades table thead, .datepicker-centuries table thead {
        background: #3546b3;
        color: #ffffff;
        border-radius: 0;
    }
    .datepicker-days table thead tr:nth-child(2n+0) td, .datepicker-days table thead tr:nth-child(2n+0) th {
        border-radius: 3px;
    }
    .datepicker-days table thead tr:nth-child(3n+0) {
        text-transform: uppercase;
        font-weight: 300 !important;
        font-size: 12px;
        color: rgba(255, 255, 255, 0.7);
    }
    .table-condensed > tbody > tr > td, .table-condensed > tbody > tr > th, .table-condensed > tfoot > tr > td, .table-condensed > tfoot > tr > th, .table-condensed > thead > tr > td, .table-condensed > thead > tr > th {
        padding: 11px 13px;
    }
    .datepicker-months table thead td, .datepicker-months table thead th, .datepicker-years table thead td, .datepicker-years table thead th, .datepicker-decades table thead td, .datepicker-decades table thead th, .datepicker-centuries table thead td, .datepicker-centuries table thead th {
        border-radius: 0;
    }
    .datepicker td, .datepicker th {
        border-radius: 50%;
        padding: 0 12px;
    }
    .datepicker-days table thead, .datepicker-months table thead, .datepicker-years table thead, .datepicker-decades table thead, .datepicker-centuries table thead {
        background: #3546b3;
        color: #ffffff;
        border-radius: 0;
    }
    .datepicker table tr td.active, .datepicker table tr td.active:hover, .datepicker table tr td.active.disabled, .datepicker table tr td.active.disabled:hover {
        background-image: none;
    }
    .datepicker .prev, .datepicker .next {
        color: rgba(255, 255, 255, 0.5);
        transition: 0.3s;
        width: 37px;
        height: 37px;
    }
    .datepicker .prev:hover, .datepicker .next:hover {
        background: transparent;
        color: rgba(255, 255, 255, 0.99);
        font-size: 21px;
    }
    .datepicker .datepicker-switch {
        font-size: 24px;
        font-weight: 400;
        transition: 0.3s;
    }
    .datepicker .datepicker-switch:hover {
        color: rgba(255, 255, 255, 0.7);
        background: transparent;
    }
    .datepicker table tr td span {
        border-radius: 2px;
        margin: 3%;
        width: 27%;
    }
    .datepicker table tr td span.active, .datepicker table tr td span.active:hover, .datepicker table tr td span.active.disabled, .datepicker table tr td span.active.disabled:hover {
        background-color: #3546b3;
        background-image: none;
    }
    td day:hover {
        cursor: pointer;
    }
    td .old-day {
        color: gray;
    }
    .dropdown-menu {
        border: 1px solid rgba(0,0,0,.1);
        box-shadow: 0 6px 12px rgba(0,0,0,.175);
    }
    .datepicker-dropdown.datepicker-orient-top:before {
        border-top: 7px solid rgba(0,0,0,.1);
    }
</style>