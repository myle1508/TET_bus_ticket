<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống Kê Doanh Thu</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
		    font-family: 'Arial', sans-serif;
		    background-color: #d0f2e7;
		    color: #333;
		    margin: 0;
		    padding: 0;
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    justify-content: flex-start; /* Đẩy các phần tử lên trên */
		    height: 100vh;
		    width: 100%;
		    box-sizing: border-box;
		}
		
		h1, h2 {
		    text-align: center;
		    color: #4CAF50;
		    font-weight: bold;
		    margin: 10px 0;
		}
		
		h2 {
		    color: #ff9800;
		}
		
		form {
		    background-color: #fdfdfd; /* Màu trắng nhẹ */
		    border-radius: 8px;
		    padding: 15px;
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    justify-content: center;
		    width: 100%; /* Chiều rộng tối đa */
		    max-width: 700px; /* Giới hạn chiều rộng */
		    margin-bottom: 20px;
		}
		
		select, input[type="submit"] {
		    padding: 8px 0;
		    margin: 10px 0;
		    font-size: 14px;
		    border-radius: 5px;
		    border: 1px solid #ddd;
		    width: 100%; /* Chiều rộng tự động co giãn */
		    max-width: 200px; /* Đặt chiều rộng tối đa */
		    background-color: #ff7f50; /* Màu trắng sáng */
		    transition: all 0.3s ease;
		    text-align: center;
		    color: #333; /* Màu chữ đậm hơn */
		}
		
		select:hover, input[type="submit"]:hover {
		    background-color: #e07b3c; /* Màu vàng nhạt khi hover */
		    color: #000; /* Màu chữ đen rõ ràng */
		}
		
		select:focus, input[type="submit"]:focus {
		    border: 1px solid #ffa500; /* Màu cam nhấn mạnh */
		    outline: none;
		    box-shadow: 0 0 5px rgba(255, 165, 0, 0.5); /* Ánh sáng khi focus */
		}

		
		table {
		    width: 90%; /* Đảm bảo bảng không quá lớn */
		    max-width: 800px; /* Giới hạn chiều rộng */
		    border-collapse: collapse;
		    margin: 20px 0;
		    background-color: #fff;
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		    border-radius: 8px;
		    text-align: center;
		}
		
		th, td {
		    padding: 8px 5px; /* Giảm kích thước padding */
		    font-size: 14px; /* Giảm kích thước chữ */
		}
		
		th {
		    background-color: #ccc;
		    font-weight: bold;
		}
		
		tr:nth-child(even) {
		    background-color: #f9f9f9;
		}
		
		tr:hover {
		    background-color: #f1f1f1;
		    cursor: pointer;
		}
		
		canvas {
		    width: 90%; /* Giảm chiều rộng */
		    max-width: 700px; /* Giới hạn chiều rộng */
		    height: auto;
		    margin-top: 20px;
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		    border-radius: 8px;
		}
		
		.section-container {
		    width: 90%; /* Đảm bảo mọi thứ luôn gọn */
		    max-width: 800px;
		    padding: 10px 0;
		    margin-top: 10px;
		    text-align: center;
		}


        .top-routes {
            margin-top: 30px;
        }

        .rank-icon {
            width: 20px;
            height: 20px;
            margin-right: 10px;
        }

        .rank1 { color: gold; }
        .rank2 { color: silver; }
        .rank3 { color: #cd7f32; }

    </style>
</head>
<body>
	<div class="section-container">
        <h2>Doanh Thu Theo Ngày/Tháng/Năm</h2>
        <form method="get" action="thong-ke">
            <label for="period">Chọn khoảng thời gian:</label>
            <select id="period" name="period">
                <option value="%Y-%m-%d">Theo ngày</option>
                <option value="%Y-%m">Theo tháng</option>
                <option value="%Y">Theo năm</option>
            </select>
            <input type="submit" value="Xem">
        </form>
    </div>
    <div class="section-container">
        <h2>Biểu Đồ Doanh Thu Theo </h2>
        <div class="chart-container">
            <canvas id="revenueChart"></canvas>
        </div>
    </div>

    <%
        Map<String, Double> revenueByDate = (Map<String, Double>) request.getAttribute("revenueByDate");
        StringBuilder dates = new StringBuilder();
        StringBuilder revenues = new StringBuilder();
        if (revenueByDate != null && !revenueByDate.isEmpty()) {
            for (Map.Entry<String, Double> entry : revenueByDate.entrySet()) {
                dates.append("'").append(entry.getKey()).append("',");
                revenues.append(entry.getValue()).append(",");
            }
        }
    %>

    <script>
        var ctx = document.getElementById('revenueChart').getContext('2d');
        var revenueChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [<%= dates.toString() %>],
                datasets: [{
                    label: 'Doanh Thu (VNĐ)',
                    data: [<%= revenues.toString() %>],
                    borderColor: '#3498db',
                    borderWidth: 3,
                    tension: 0.1,
                    fill: false
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: true
                    }
                },
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Ngày'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Doanh Thu (VNĐ)'
                        },
                        beginAtZero: true
                    }
                }
            }
        });

        window.addEventListener('resize', function () {
            revenueChart.resize();
        });
    </script>

    <div class="section-container">
        <h2>Top 3 Người Mua Vé Nhiều Nhất</h2>
        <table>
            <thead>
                <tr>
                    <th>Rank</th>
                    <th>Tên Người Dùng</th>
                    <th>Số Vé Mua</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Map<String, Object>> topUsers = (List<Map<String, Object>>) request.getAttribute("topUsers");
                    int rank = 1;
                    for (Map<String, Object> user : topUsers) {
                %>
                <tr>
                    <td>
                        <span class="<%= rank == 1 ? "rank1" : (rank == 2 ? "rank2" : "rank3") %>">
                            <%= rank == 1 ? "🥇" : (rank == 2 ? "🥈" : "🥉") %>
                        </span>
                    </td>
                    <td><%= user.get("ho_ten") %></td>
                    <td><%= user.get("so_ve_mua") %></td>
                </tr>
                <% 
                        rank++;
                    } 
                %>
            </tbody>
        </table>
    </div>

    <div class="section-container top-routes">
        <h2>Top 3 Tuyến Đường Có Nhiều Người Đặt Vé Nhất</h2>
        <table>
            <thead>
                <tr>
                    <th>Rank</th>
                    <th>Tuyến Đường</th>
                    <th>Số Vé Đặt</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Map<String, Integer> topRoute = (Map<String, Integer>) request.getAttribute("topRoute");
                    if (topRoute != null && !topRoute.isEmpty()) {
                        int ranka = 1;
                        for (Map.Entry<String, Integer> entry : topRoute.entrySet()) {
                %>
                <tr>
                    <td>
                        <span class="<%= ranka == 1 ? "rank1" : (ranka == 2 ? "rank2" : "rank3") %>">
                            <%= ranka == 1 ? "🥇" : (ranka == 2 ? "🥈" : "🥉") %>
                        </span>
                    </td>
                    <td><%= entry.getKey() %></td>
                    <td><%= entry.getValue() %></td>
                </tr>
                <% 
                            ranka++;
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3">Không có dữ liệu về tuyến đường.</td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>
