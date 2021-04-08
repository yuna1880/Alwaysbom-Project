<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>새늘봄 / 매출분석 - 정기구독</title>
    <%@ include file="../main/b_import.jspf"%>
    <script src="/static/chartjs/dist/chart.js"></script>
    <script src="/static/chartjs/dist/chartjs-plugin-datalabels.js"></script>
</head>
<body>
<%@ include file="../main/b_header.jspf"%>
<div id="container" class="mx-auto d-flex flex-column p-3 bg-white">
    <!-- 버튼 영역 -->
    <div class="d-flex">
        <!-- 최근6개월 / 이번달 -->
        <div class="col-4 d-flex row-cols-2 btn-group" role="group">
            <label class="row-cols-1 pe-1">
                <input type="radio" class="btn-check" name="period" checked>
                <span class="col btn btn-outline-secondary">최근 6개월</span>
            </label>
            <label class="row-cols-1 ps-1">
                <input type="radio" class="btn-check" name="period">
                <span class="col btn btn-outline-secondary">이번 달</span>
            </label>
        </div>

        <!-- 성별, 매출처 -->
        <div class="col-6 d-flex px-3 row-cols-2">
            <div class="pe-1">
                <select class="form-select col" aria-label="gender group">
                    <option selected>성별</option>
                    <option value="male">남</option>
                    <option value="female">여</option>
                </select>
            </div>
            <div class="ps-1">
                <select class="form-select col" aria-label="sales group">
                    <option selected>매출처</option>
                    <option value="정기구독">정기구독</option>
                    <option value="꽃다발">꽃다발</option>
                    <option value="소품샵">소품샵</option>
                    <option value="클래스">플라워클래스</option>
                </select>
            </div>
        </div>

        <!-- 검색버튼 -->
        <div class="col-2 d-flex">
            <button class="col btn btn-primary" onclick="searchSales()">검색</button>
        </div>

    </div>

    <!-- 매출 현황 그래프 -->
    <div style="height: 500px" class="d-flex">
        <canvas id="salesChart"></canvas>
    </div>

    <!-- 기간별 매출 상세 현황 -->
    <div class="pt-3 d-flex flex-column">
        <!-- 헤더 -->
        <div class="d-flex text-center bg-secondary text-white">
            <div class="col-2 d-flex">
                <span class="col p-3 border-end">기간</span>
            </div>
            <div class="col-1 d-flex">
                <span class="col p-3 border-end">판매수</span>
            </div>
            <div class="col-8 d-flex row-cols-5">
                <span class="p-3 border-end">정기구독</span>
                <span class="p-3 border-end">꽃다발</span>
                <span class="p-3 border-end">원데이클래스</span>
                <span class="p-3 border-end">플로리스트</span>
                <span class="p-3 border-end">소품샵</span>
            </div>
            <div class="col-1 d-flex">
                <span class="col p-3">총계</span>
            </div>
        </div>
    </div>
    <ul class="list-unstyled p-0 m-0 d-flex flex-column text-center">
        <li class="border border-top-0 border-secondary d-flex">
            <div class="col-2 d-flex border-end border-secondary">
                <div class="col p-3 d-flex flex-column">
                    <span>2020-01-01</span>
                    <span>~</span>
                    <span>2020-01-30</span>
                </div>
            </div>
            <div class="col-1 d-flex border-end border-secondary align-items-center">
                <span class="col p-3">30</span>
            </div>
            <div class="col-8 d-flex row-cols-5">
                <span class="p-3 border-end border-secondary d-flex justify-content-center align-items-center">20</span>
                <span class="p-3 border-end border-secondary d-flex justify-content-center align-items-center">10</span>
                <span class="p-3 border-end border-secondary d-flex justify-content-center align-items-center">30</span>
                <span class="p-3 border-end border-secondary d-flex justify-content-center align-items-center">10</span>
                <span class="p-3 border-end border-secondary d-flex justify-content-center align-items-center">5</span>
            </div>
            <div class="col-1 d-flex align-items-center">
                <span class="col p-3">75</span>
            </div>
        </li>
        <li class="border border-top-0 border-secondary d-flex">
            <div class="col-2 d-flex border-end border-secondary">
                <div class="col p-3 d-flex flex-column">
                    <span>2020-02-01</span>
                    <span>~</span>
                    <span>2020-02-28</span>
                </div>
            </div>
            <div class="col-1 d-flex border-end border-secondary align-items-center">
                <span class="col p-3">30</span>
            </div>
            <div class="col-8 d-flex row-cols-5">
                <span class="p-3 border-end border-secondary d-flex justify-content-center align-items-center">20</span>
                <span class="p-3 border-end border-secondary d-flex justify-content-center align-items-center">10</span>
                <span class="p-3 border-end border-secondary d-flex justify-content-center align-items-center">30</span>
                <span class="p-3 border-end border-secondary d-flex justify-content-center align-items-center">10</span>
                <span class="p-3 border-end border-secondary d-flex justify-content-center align-items-center">5</span>
            </div>
            <div class="col-1 d-flex align-items-center">
                <span class="col p-3">75</span>
            </div>
        </li>
    </ul>
</div>
<%@ include file="../main/b_footer.jspf"%>
<script>

    let myChart;

    searchSales().then(function (result) {
        myChart = result;
        console.log(result);
    });

    async function searchSales() {
        return fetch("/statistics/api/subsByMonth").then(response => {
            return response.json().then(result => {
                const labels = result.map(v => v.label);
                const values = result.map(v => v.value);
                const data = {
                    labels: labels,
                    datasets: [{
                        label: '월별 구독 수 추이',
                        backgroundColor: '#ff6384',
                        border: 'none',
                        data: values
                    }]
                }

                const config = {
                    type: 'bar',
                    data: data,
                    plugins: [ChartDataLabels],
                    options: {
                        maintainAspectRatio: false,
                        plugins: {
                            title: {
                                display: true,
                                text: '월별 구독 수 추이'
                            },
                            datalabels: {
                                font: {
                                    size: 20
                                },
                                color: '#FFFFFF'
                            }
                        }
                    }
                }

                const ctxMonth = document.querySelector("#salesChart");
                return new Chart(ctxMonth, config);
            })
        });
    }




</script>
</body>
</html>
