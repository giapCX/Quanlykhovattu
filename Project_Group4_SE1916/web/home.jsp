<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - Quản lý vật tư</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Toastify -->
    <link href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <!-- Heroicons -->
    <script src="https://unpkg.com/@heroicons/vue@2.1.1/dist/20/solid.js"></script>
    <style>
        /* Custom styles for professional look */
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
        body {
            font-family: 'Inter', 'Roboto', sans-serif;
        }
        .sidebar {
            background: linear-gradient(to bottom, #1e3a8a, #3b82f6);
            transition: width 0.3s ease;
        }
        .sidebar-hidden {
            width: 0;
            overflow: hidden;
        }
        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: fadeIn 0.5s ease-in-out;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }
        .search-bar input {
            transition: all 0.3s ease;
        }
        .search-bar input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 10px rgba(59, 130, 246, 0.3);
        }
        .btn-action {
            transition: transform 0.2s ease, background-color 0.3s ease;
        }
        .btn-action:hover {
            transform: scale(1.05);
            filter: brightness(90%);
        }
        table {
            width: 100%;
            overflow-x: auto;
        }
        th:hover {
            cursor: pointer;
            background-color: #2563eb;
        }
        .dark-mode {
            background-color: #1f2937;
            color: #f3f4f6;
        }
        .dark-mode .card, .dark-mode .table-container {
            background-color: #374151;
            color: #f3f4f6;
        }
        .dark-mode .navbar, .dark-mode .sidebar {
            background: linear-gradient(to bottom, #111827, #1f2937);
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen flex">
    <!-- Sidebar -->
    <aside id="sidebar" class="sidebar w-64 text-white p-4 fixed h-full shadow-lg">
        <div class="flex items-center mb-6">
            <h2 class="text-2xl font-bold">Quản lý vật tư</h2>
            <button id="toggleSidebar" class="ml-auto text-white">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                </svg>
            </button>
        </div>
        <nav class="space-y-2">
            <a href="home.jsp" class="flex items-center p-2 hover:bg-blue-700 rounded">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path></svg>
                Tổng quan
            </a>
            <a href="inventory.jsp" class="flex items-center p-2 hover:bg-blue-700 rounded">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0v6a2 2 0 01-2 2H6a2 2 0 01-2-2V7m16 0H4"></path></svg>
                Quản lý kho
            </a>
            <a href="items.jsp" class="flex items-center p-2 hover:bg-blue-700 rounded">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
                Danh mục vật tư
            </a>
            <a href="orders.jsp" class="flex items-center p-2 hover:bg-blue-700 rounded">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path></svg>
                Đơn hàng
            </a>
            <a href="reports.jsp" class="flex items-center p-2 hover:bg-blue-700 rounded">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 8v8m-4-5v5m-4-2v2m-2 4h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                Báo cáo
            </a>
            <a href="settings.jsp" class="flex items-center p-2 hover:bg-blue-700 rounded">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path></svg>
                Cài đặt
            </a>
            <a href="logout.jsp" class="flex items-center p-2 hover:bg-blue-700 rounded">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path></svg>
                Đăng xuất
            </a>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 p-6 ml-0 md:ml-64 transition-all duration-300">
        <!-- Header with Dark Mode Toggle -->
        <header class="flex justify-between items-center mb-6">
            <h1 class="text-3xl font-bold text-gray-800">Tổng quan</h1>
            <button id="toggleDarkMode" class="bg-gray-200 p-2 rounded-full hover:bg-gray-300">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"></path></svg>
            </button>
        </header>

        <!-- Search Bar -->
        <div class="search-bar mb-6">
            <div class="relative">
                <input id="searchInput" type="text" placeholder="Tìm kiếm vật tư (mã, tên, danh mục)..."
                       class="w-full max-w-lg p-3 pl-10 rounded-lg border border-gray-300 focus:outline-none">
                <svg class="absolute left-3 top-3 w-5 h-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
            </div>
        </div>

        <!-- Dashboard -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-6">
            <div class="card bg-white p-6 rounded-lg shadow-md flex items-center">
                <svg class="w-8 h-8 text-blue-600 mr-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0v6a2 2 0 01-2 2H6a2 2 0 01-2-2V7m16 0H4"></path></svg>
                <div>
                    <h3 class="text-lg font-semibold text-blue-600">Tổng vật tư</h3>
                    <p class="text-2xl font-bold">1,234</p>
                </div>
            </div>
            <div class="card bg-white p-6 rounded-lg shadow-md flex items-center">
                <svg class="w-8 h-8 text-red-600 mr-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                <div>
                    <h3 class="text-lg font-semibold text-blue-600">Vật tư sắp hết</h3>
                    <p class="text-2xl font-bold">5</p>
                </div>
            </div>
            <div class="card bg-white p-6 rounded-lg shadow-md flex items-center">
                <svg class="w-8 h-8 text-yellow-600 mr-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
                <div>
                    <h3 class="text-lg font-semibold text-blue-600">Đơn chờ duyệt</h3>
                    <p class="text-2xl font-bold">3</p>
                </div>
            </div>
            <div class="card bg-white p-6 rounded-lg shadow-md flex items-center">
                <svg class="w-8 h-8 text-green-600 mr-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 8v8m-4-5v5m-4-2v2m-2 4h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                <div>
                    <h3 class="text-lg font-semibold text-blue-600">Giao dịch hôm nay</h3>
                    <p class="text-2xl font-bold">10</p>
                </div>
            </div>
        </div>

        <!-- Chart -->
        <div class="table-container bg-white p-6 rounded-lg shadow-md mb-6">
            <h2 class="text-xl font-semibold text-blue-600 mb-4">Xu hướng tồn kho</h2>
            <canvas id="inventoryChart" height="100"></canvas>
        </div>

        <!-- Quick Actions -->
        <div class="quick-actions text-center mb-6 flex justify-center space-x-4">
            <button onclick="showToast('Đang chuyển đến trang thêm vật tư...')" class="btn-action bg-green-500 text-white px-6 py-3 rounded-lg flex items-center">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
                Thêm vật tư
            </button>
            <button onclick="showToast('Đang chuyển đến trang nhập kho...')" class="btn-action bg-blue-500 text-white px-6 py-3 rounded-lg flex items-center">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16l-4-4m0 0l4-4m-4 4h18"></path></svg>
                Nhập kho
            </button>
            <button onclick="showToast('Đang chuyển đến trang xuất kho...')" class="btn-action bg-blue-500 text-white px-6 py-3 rounded-lg flex items-center">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
                Xuất kho
            </button>
        </div>

        <!-- Low Stock Items -->
        <div class="table-container bg-white p-6 rounded-lg shadow-md mb-6">
            <h2 class="text-xl font-semibold text-blue-600 mb-4">Vật tư sắp hết</h2>
            <div class="overflow-x-auto">
                <table id="lowStockTable" class="w-full text-left">
                    <thead>
                        <tr class="bg-blue-600 text-white">
                            <th class="p-3 sortable" data-column="0">Mã vật tư <svg class="w-4 h-4 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path></svg></th>
                            <th class="p-3 sortable" data-column="1">Tên vật tư <svg class="w-4 h-4 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path></svg></th>
                            <th class="p-3 sortable" data-column="2">Số lượng <svg class="w-4 h-4 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path></svg></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="border-b">
                            <td class="p-3">VT001</td>
                            <td class="p-3">Bàn</td>
                            <td class="p-3">10</td>
                        </tr>
                        <tr class="border-b">
                            <td class="p-3">VT002</td>
                            <td class="p-3">Ghế</td>
                            <td class="p-3">5</td>
                        </tr>
                        <tr class="border-b">
                            <td class="p-3">VT003</td>
                            <td class="p-3">Thước</td>
                            <td class="p-3">8</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Recent Transactions -->
        <div class="table-container bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-xl font-semibold text-blue-600 mb-4">Lịch sử giao dịch gần đây</h2>
            <div class="overflow-x-auto">
                <table id="transactionTable" class="w-full text-left">
                    <thead>
                        <tr class="bg-blue-600 text-white">
                            <th class="p-3 sortable" data-column="0">Thời gian <svg class="w-4 h-4 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path></svg></th>
                            <th class="p-3 sortable" data-column="1">Loại <svg class="w-4 h-4 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path></svg></th>
                            <th class="p-3 sortable" data-column="2">Mã vật tư <svg class="w-4 h-4 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path></svg></th>
                            <th class="p-3 sortable" data-column="3">Số lượng <svg class="w-4 h-4 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path></svg></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="border-b">
                            <td class="p-3">10:30 23/05/2025</td>
                            <td class="p-3">Nhập kho</td>
                            <td class="p-3">VT001</td>
                            <td class="p-3">50</td>
                        </tr>
                        <tr class="border-b">
                            <td class="p-3">09:15 23/05/2025</td>
                            <td class="p-3">Xuất kho</td>
                            <td class="p-3">VT002</td>
                            <td class="p-3">20</td>
                        </tr>
                        <tr class="border-b">
                            <td class="p-3">08:45 23/05/2025</td>
                            <td class="p-3">Nhập kho</td>
                            <td class="p-3">VT003</td>
                            <td class="p-3">30</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-blue-900 text-white text-center p-4 mt-6">
        <p>Quản lý vật tư - Phiên bản 1.0 | <a href="mailto:support@company.com" class="underline">Liên hệ: support@company.com</a></p>
    </footer>

    <!-- JavaScript -->
    <script>
        // Toggle Sidebar
        const sidebar = document.getElementById('sidebar');
        const toggleSidebar = document.getElementById('toggleSidebar');
        toggleSidebar.addEventListener('click', () => {
            sidebar.classList.toggle('sidebar-hidden');
            document.querySelector('main').classList.toggle('md:ml-64');
            document.querySelector('main').classList.toggle('ml-0');
        });

        // Dark Mode Toggle
        const toggleDarkMode = document.getElementById('toggleDarkMode');
        toggleDarkMode.addEventListener('click', () => {
            document.body.classList.toggle('dark-mode');
            const icon = toggleDarkMode.querySelector('svg');
            icon.innerHTML = document.body.classList.contains('dark-mode') ?
                '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"></path>' :
                '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"></path>';
        });

        // Toast Notification
        function showToast(message) {
            Toastify({
                text: message,
                duration: 3000,
                gravity: "bottom",
                position: "right",
                backgroundColor: "#10b981",
                stopOnFocus: true
            }).showToast();
        }

        // Search Functionality
        const searchInput = document.getElementById('searchInput');
        const lowStockTable = document.getElementById('lowStockTable').querySelector('tbody');
        const transactionTable = document.getElementById('transactionTable').querySelector('tbody');
        const originalLowStockRows = Array.from(lowStockTable.querySelectorAll('tr'));
        const originalTransactionRows = Array.from(transactionTable.querySelectorAll('tr'));

        searchInput.addEventListener('input', () => {
            const query = searchInput.value.toLowerCase();
            lowStockTable.innerHTML = '';
            transactionTable.innerHTML = '';

            originalLowStockRows.forEach(row => {
                const cells = Array.from(row.querySelectorAll('td')).map(cell => cell.textContent.toLowerCase());
                if (cells.some(cell => cell.includes(query))) {
                    lowStockTable.appendChild(row.cloneNode(true));
                }
            });

            originalTransactionRows.forEach(row => {
                const cells = Array.from(row.querySelectorAll('td')).map(cell => cell.textContent.toLowerCase());
                if (cells.some(cell => cell.includes(query))) {
                    transactionTable.appendChild(row.cloneNode(true));
                }
            });
        });

        // Sort Table
        function sortTable(tableId, column, isNumeric) {
            const table = document.getElementById(tableId);
            const tbody = table.querySelector('tbody');
            const rows = Array.from(tbody.querySelectorAll('tr'));
            const isAsc = table.querySelector(`th[data-column="${column}"]`).classList.toggle('asc');

            rows.sort((a, b) => {
                let aValue = a.querySelectorAll('td')[column].textContent;
                let bValue = b.querySelectorAll('td')[column].textContent;
                if (isNumeric) {
                    aValue = parseFloat(aValue) || 0;
                    bValue = parseFloat(bValue) || 0;
                }
                return isAsc ? aValue > bValue ? 1 : -1 : aValue < bValue ? 1 : -1;
            });

            tbody.innerHTML = '';
            rows.forEach(row => tbody.appendChild(row));
        }

        document.querySelectorAll('.sortable').forEach(th => {
            th.addEventListener('click', () => {
                const column = th.getAttribute('data-column');
                const isNumeric = column === '2' || column === '3';
                sortTable(th.closest('table').id, column, isNumeric);
            });
        });

        // Chart.js
        const ctx = document.getElementById('inventoryChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6'],
                datasets: [
                    {
                        label: 'Tồn kho',
                        data: [1200, 1150, 1100, 1050, 1000],
                        backgroundColor: 'rgba(59, 130, 246, 0.5)',
                        borderColor: '#3b82f6',
                        borderWidth: 1
                    },
                    {
                        label: 'Nhập kho',
                        data: [200, 150, 100, 80, 50],
                        backgroundColor: 'rgba(16, 185, 129, 0.5)',
                        borderColor: '#10b981',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' },
                    tooltip: { enabled: true }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        title: { display: true, text: 'Số lượng' }
                    }
                }
            }
        });
    </script>
</body>
</html>