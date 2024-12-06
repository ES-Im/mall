// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// 전역 변수로 차트 인스턴스를 선언
let myLineChart = null;  // 초기에는 차트가 없으므로 null로 설정

// 페이지 로드 시 2024년 데이터를 기본으로 표시
window.onload = function() {
    const currentYear = new Date().getFullYear();  // 현재 연도를 자동으로 가져옵니다.
    fetchSalesData(currentYear);  // 2024년 데이터 로드
};

// 데이터를 가져오는 함수
function fetchSalesData(year) {
    const salesYear = year;
    console.log("Fetching data for year:", salesYear); // 확인용 로그
	
	const yearLabel = document.querySelector("#yearLabel");
	    if (yearLabel) {
	        yearLabel.textContent = `${salesYear}년도 월별 매출`;  // 텍스트 업데이트
	    }

    // 데이터 가져오기
    fetch(`../getMonthSalesByYear?salesYear=${salesYear}`)
        .then(response => response.json())  // JSON 응답을 객체로 변환
        .then(data => {
            // 월 이름을 배열로 가져오고, 이를 정렬 (1월부터 12월까지)
            const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
            
            // 월별로 정렬된 데이터 생성
            const labels = months.filter(month => data[month] !== undefined);  // 존재하는 월만 필터링
            const values = labels.map(month => data[month]);  // 정렬된 월에 해당하는 값들 가져오기
            
            console.log('Sorted Labels:', labels);  // 디버깅용 출력
            console.log('Sorted Values:', values);  // 디버깅용 출력
            
            // 기존 차트가 있으면 삭제
            if (myLineChart) {
                myLineChart.destroy();  // 기존 차트 삭제
            }

            // 차트 그리기
            var ctx = document.getElementById("myAreaChart").getContext('2d');
            myLineChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,  // 정렬된 월 이름
                    datasets: [{
                        label: "Sales",
                        lineTension: 0.3,
                        backgroundColor: "rgba(76, 91, 108, 0.05)",
                        borderColor: "rgba(76, 91, 108, 0.7)",
                        pointRadius: 3,
                        pointBackgroundColor: "rgba(78, 115, 223, 1)",
                        pointBorderColor: "rgba(78, 115, 223, 1)",
                        pointHoverRadius: 3,
                        pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                        pointHitRadius: 10,
                        pointBorderWidth: 2,
                        data: values,  // 정렬된 값
                    }],
                },
                options: {
                    maintainAspectRatio: false,
                    layout: {
                        padding: {
                            left: 10,
                            right: 25,
                            top: 25,
                            bottom: 0
                        }
                    },
                    scales: {
                        xAxes: [{
                            time: {
                                unit: 'date'
                            },
                            gridLines: {
                                display: false,
                                drawBorder: false
                            },
                            ticks: {
                                maxTicksLimit: 7
                            }
                        }],
                        yAxes: [{
                            ticks: {
                                min: 0,
                                maxTicksLimit: 5,
                                padding: 10,
                                callback: function(value) {
                                    return number_format(value) + '원';
                                }
                            },
                            gridLines: {
                                color: "rgb(234, 236, 244)",
                                zeroLineColor: "rgb(234, 236, 244)",
                                drawBorder: false,
                                borderDash: [2],
                                zeroLineBorderDash: [2]
                            }
                        }],
                    },
                    legend: {
                        display: false
                    },
                    tooltips: {
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        titleMarginBottom: 10,
                        titleFontColor: '#6e707e',
                        titleFontSize: 14,
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        intersect: false,
                        mode: 'index',
                        caretPadding: 10,
                        callbacks: {
                            label: function(tooltipItem, chart) {
                                var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                                return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
                            }
                        }
                    }
                }
            });
        });
}

