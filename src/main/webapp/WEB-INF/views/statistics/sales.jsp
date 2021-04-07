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
        <!-- 월간/분기/연간 -->
        <div class="col-4 d-flex row-cols-3">
            <div>
                <button class="col-12 btn btn-secondary">월간</button>
            </div>
            <div class="px-1">
                <button class="col-12 btn btn-secondary">분기</button>
            </div>
            <div>
                <button class="col-12 btn btn-secondary">연간</button>
            </div>
        </div>

        <!-- 연령층, 성별, 매출처 -->
        <div class="col-6 d-flex px-3 row-cols-3">
            <div>
                <select class="form-select col" aria-label="age group">
                    <option selected>연령</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
            </div>
            <div class="px-1">
                <select class="form-select col" aria-label="gender group">
                    <option selected>성별</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
            </div>
            <div>
                <select class="form-select col" aria-label="sales group">
                    <option selected>매출처</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
            </div>
        </div>

        <!-- 검색버튼 -->
        <div class="col-2 d-flex">
            <button class="col btn btn-primary">검색</button>
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
    fetch("/statistics/api/subsByMonth").then(response => {
        response.json().then(result => {
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
            const subsByMonth = new Chart(ctxMonth, config);

        })
    });
</script>
</body>
</html>
