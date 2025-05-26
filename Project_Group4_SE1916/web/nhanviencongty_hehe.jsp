
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - Nhân viên | Hệ thống Quản lý Vật tư</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: {
                            50: '#f0f9ff', 100: '#e0f2fe', 200: '#bae6fd', 300: '#7dd3fc',
                            400: '#38bdf8', 500: '#0ea5e9', 600: '#0284c7', 700: '#0369a1',
                            800: '#075985', 900: '#0c4a6e'
                        },
                        secondary: {
                            50: '#f5f3ff', 100: '#ede9fe', 200: '#ddd6fe', 300: '#c4b5fd',
                            400: '#a78bfa', 500: '#8b5cf6', 600: '#7c3aed', 700: '#6d28d9',
                            800: '#5b21b6', 900: '#4c1d95'
                        },
                        accent: {
                            500: '#f59e0b', 600: '#d97706'
                        }
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif']
                    },
                    boxShadow: {
                        'custom': '0 4px 20px rgba(0, 0, 0, 0.1), 0 7px 10px -5px rgba(59, 130, 246, 0.4)'
                    }
                }
            }
        }
    </script>
    <!-- Toastify -->
    <link href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(to bottom, #f8fafc, #e0f2fe);
        }

        .sidebar {
            background: linear-gradient(195deg, #1e40af, #3b82f6);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.14), 0 7px 10px -5px rgba(59, 130, 246, 0.4);
            transition: all 0.3s cubic-bezier(0.645, 0.045, 0.355, 1);
            transform: translateX(-100%);
        }

        .sidebar.active {
            transform: translateX(0);
        }

        main, footer {
            transition: all 0.3s ease;
        }

        .sidebar.active ~ main,
        .sidebar.active ~ footer {
            margin-left: 18rem;
        }

        .nav-item {
            transition: all 0.2s ease;
            border-radius: 0.5rem;
            position: relative;
            overflow: hidden;
        }

        .nav-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, transparent, rgba(255, 255, 255, 0.2));
            transition: left 0.3s ease;
        }

        .nav-item:hover::before {
            left: 100%;
        }

        .nav-item:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: translateX(5px);
        }

        .nav-item.active {
            background: linear-gradient(to right, #3b82f6, #60a5fa);
            font-weight: 600;
        }

        .card {
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            border-radius: 1rem;
            border: 1px solid #e5e7eb;
            background: linear-gradient(to bottom, #ffffff, #f8fafc);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .btn-primary {
            background: linear-gradient(to right, #3b82f6, #8b5cf6);
            transition: all 0.3s ease;
            border-radius: 0.75rem;
            position: relative;
            overflow: hidden;
        }

        .btn-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, transparent, rgba(255, 255, 255, 0.3));
            transition: left 0.3s ease;
        }

        .btn-primary:hover::before {
            left: 100%;
        }

        .btn-primary:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 15px -3px rgba(59, 130, 246, 0.3), 0 4px 6px -2px rgba(59, 130, 246, 0.1);
        }

        .table-container {
            border-radius: 1rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            border: 1px solid #e5e7eb;
            background: linear-gradient(to bottom, #ffffff, #f8fafc);
        }

        .table th {
            background: linear-gradient(to right, #3b82f6, #60a5fa);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 0.05em;
            padding: 1rem;
        }

        .table td {
            padding: 1rem;
        }

        .table tr:nth-child(even) {
            background-color: #f8fafc;
        }

        .badge {
            padding: 0.25rem 0.75rem;
            border-radius: 0.5rem;
            font-size: 0.75rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .badge-success {
            background: linear-gradient(to right, #10b981, #34d399);
            color: white;
        }

        .badge-warning {
            background: linear-gradient(to right, #f59e0b, #fbbf24);
            color: white;
        }

        .badge-danger {
            background: linear-gradient(to right, #ef4444, #f87171);
            color: white;
        }

        .search-input {
            transition: all 0.3s ease;
            border-radius: 0.75rem;
            background: rgba(255, 255, 255, 0.1);
        }

        .search-input:focus {
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.3);
        }

        .dark-mode {
            background: linear-gradient(to bottom, #1a202c, #2d3748);
            color: #e2e8f0;
        }

        .dark-mode .card,
        .dark-mode .table-container {
            background: linear-gradient(to bottom, #2d3748, #4a5568);
            border-color: #4a5568;
        }

        .dark-mode .table tr:nth-child(even) {
            background-color: #2d3748;
        }

        .dark-mode .table tr {
            border-color: #4a5568;
        }

        .dark-mode .sidebar {
            background: linear-gradient(195deg, #111827, #1f2937);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.14), 0 7px 10px -5px rgba(31, 41, 55, 0.4);
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-fadeInUp {
            animation: fadeInUp 0.5s ease-out forwards;
        }

        .delay-100 { animation-delay: 0.1s; }
        .delay-200 { animation-delay: 0.2s; }
        .delay-300 { animation-delay: 0.3s; }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                max-width: 280px;
                z-index: 50;
            }
        }
    </style>
</head>
<body class="min-h-screen font-sans antialiased">
    <!-- Sidebar -->
    <aside id="sidebar" class="sidebar w-72 text-white p-6 fixed h-full z-50 hidden">
        <div class="flex items-center mb-8">
            <div class="w-12 h-12 rounded-full bg-white flex items-center justify-center mr-3">
                <i class="fas fa-boxes text-primary-600 text-2xl"></i>
            </div>
            <h2 class="text-2xl font-bold">QL Vật Tư</h2>
            <button id="toggleSidebar" class="ml-auto text-white opacity-70 hover:opacity-100">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="mb-6 px-2">
            <div class="relative">
                <input type="text" placeholder="Tìm kiếm..." 
                       class="w-full bg-white bg-opacity-20 text-white placeholder-white placeholder-opacity-70 rounded-lg py-2 pl-10 pr-4 focus:outline-none focus:ring-2 focus:ring-white focus:ring-opacity-50 search-input">
                <i class="fas fa-search absolute left-3 top-2.5 text-white opacity-70"></i>
            </div>
        </div>
        <nav class="space-y-2">
            <a href="material_list.jsp" class="nav-item flex items-center p-3">
                <i class="fas fa-list mr-3 w-6 text-center"></i>
                <span class="text-lg">Danh mục vật tư</span>
            </a>
            <a href="profile.jsp" class="nav-item flex items-center p-3">
                <i class="fas fa-user mr-3 w-6 text-center"></i>
                <span class="text-lg">Thông tin cá nhân</span>
            </a>
        </nav>
        <div class="absolute bottom-0 left-0 right-0 p-6 bg-white bg-opacity-10">
            <a href="logout.jsp" class="flex items-center p-3 rounded-lg hover:bg-white hover:bg-opacity-20">
                <i class="fas fa-sign-out-alt mr-3"></i>
                <span class="text-lg">Đăng xuất</span>
            </a>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 p-8 transition-all duration-300">
        <!-- Header -->
        <header class="flex flex-col md:flex-row justify-between items-start md:items-center mb-8 gap-4">
            <div class="flex items-center gap-4">
                <button id="toggleSidebarMobile" class="text-gray-700 hover:text-primary-600">
                    <i class="fas fa-bars text-2xl"></i>
                </button>
                <div>
                    <h1 class="text-4xl font-bold text-gray-800 dark:text-white">Tổng quan</h1>
                    <p class="text-base text-gray-600 dark:text-gray-300 mt-2">Quản lý vật tư và thông tin cá nhân</p>
                </div>
            </div>
            <div class="flex items-center space-x-6">
                <div class="relative">
                    <i class="fas fa-bell text-gray-500 hover:text-primary-600 cursor-pointer text-xl"></i>
                    <span class="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center animate-pulse">2</span>
                </div>
                <div class="flex items-center">
                    <img src="https://ui-avatars.com/api/?name=Nguyen+Van+A&background=3b82f6&color=fff" 
                         alt="Người dùng" class="w-10 h-10 rounded-full mr-3 border-2 border-primary-500">
                    <span class="font-medium text-gray-700 dark:text-white text-lg">Nguyễn Văn A</span>
                </div>
                <button id="toggleDarkMode" class="bg-gray-200 dark:bg-gray-700 p-2 rounded-full hover:bg-gray-300 dark:hover:bg-gray-600">
                    <i class="fas fa-moon text-gray-700 dark:text-yellow-300 text-xl"></i>
                </button>
            </div>
        </header>

        <!-- Request Stats -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8 mb-8">
            <div class="card bg-white dark:bg-gray-800 animate-fadeInUp">
                <div class="p-6 flex items-start justify-between">
                    <div>
                        <p class="text-base font-medium text-gray-500 dark:text-gray-400">Yêu cầu chờ duyệt</p>
                        <h3 class="text-4xl font-bold mt-2 text-gray-800 dark:text-white">2</h3>
                        <p class="text-base text-yellow-500 mt-3"><i class="fas fa-clock mr-1"></i>Đang chờ xử lý</p>
                    </div>
                    <div class="p-4 rounded-full bg-yellow-100 dark:bg-yellow-900 text-yellow-600 dark:text-yellow-300 animate-pulse">
                        <i class="fas fa-clock text-2xl"></i>
                    </div>
                </div>
                <div class="bg-gray-50 dark:bg-gray-700 px-6 py-4">
                    <a href="request_history.jsp" class="text-base font-medium text-primary-600 dark:text-primary-400 hover:underline">Xem chi tiết</a>
                </div>
            </div>
            <div class="card bg-white dark:bg-gray-800 animate-fadeInUp delay-100">
                <div class="p-6 flex items-start justify-between">
                    <div>
                        <p class="text-base font-medium text-gray-500 dark:text-gray-400">Yêu cầu đã duyệt</p>
                        <h3 class="text-4xl font-bold mt-2 text-gray-800 dark:text-white">5</h3>
                        <p class="text-base text-green-500 mt-3"><i class="fas fa-check-circle mr-1"></i>Hoàn tất</p>
                    </div>
                    <div class="p-4 rounded-full bg-green-100 dark:bg-green-900 text-green-600 dark:text-green-300 animate-pulse">
                        <i class="fas fa-check-circle text-2xl"></i>
                    </div>
                </div>
                <div class="bg-gray-50 dark:bg-gray-700 px-6 py-4">
                    <a href="request_history.jsp" class="text-base font-medium text-primary-600 dark:text-primary-400 hover:underline">Xem chi tiết</a>
                </div>
            </div>
            <div class="card bg-white dark:bg-gray-800 animate-fadeInUp delay-200">
                <div class="p-6 flex items-start justify-between">
                    <div>
                        <p class="text-base font-medium text-gray-500 dark:text-gray-400">Yêu cầu bị từ chối</p>
                        <h3 class="text-4xl font-bold mt-2 text-gray-800 dark:text-white">1</h3>
                        <p class="text-base text-red-500 mt-3"><i class="fas fa-times-circle mr-1"></i>Cần kiểm tra</p>
                    </div>
                    <div class="p-4 rounded-full bg-red-100 dark:bg-red-900 text-red-600 dark:text-red-300 animate-pulse">
                        <i class="fas fa-times-circle text-2xl"></i>
                    </div>
                </div>
                <div class="bg-gray-50 dark:bg-gray-700 px-6 py-4">
                    <a href="request_history.jsp" class="text-base font-medium text-primary-600 dark:text-primary-400 hover:underline">Xem chi tiết</a>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="mb-8 grid grid-cols-2 sm:grid-cols-2 gap-6">
            <button onclick="showToast('Đang chuyển đến trang yêu cầu xuất kho...')" 
                    class="btn-primary text-white px-6 py-4 flex flex-col items-center justify-center hover:shadow-lg transition-all">
                <i class="fas fa-arrow-up text-3xl mb-3"></i>
                <span class="text-lg font-semibold">Yêu cầu xuất kho</span>
            </button>
            <button onclick="showToast('Đang chuyển đến trang đề nghị mua vật tư...')" 
                    class="btn-primary text-white px-6 py-4 flex flex-col items-center justify-center hover:shadow-lg transition-all">
                <i class="fas fa-shopping-cart text-3xl mb-3"></i>
                <span class="text-lg font-semibold">Đề nghị mua vật tư</span>
            </button>
        </div>

        <!-- Request History Table -->
        <div class="table-container bg-white dark:bg-gray-800">
            <div class="p-6 border-b border-gray-200 dark:border-gray-700 flex justify-between items-center">
                <div>
                    <h2 class="text-2xl font-semibold text-gray-800 dark:text-white">Lịch sử yêu cầu</h2>
                    <p class="text-base text-gray-600 dark:text-gray-300">Danh sách các yêu cầu đã gửi</p>
                </div>
                <a href="request_history.jsp" class="text-base font-medium text-primary-600 dark:text-primary-400 hover:underline">Xem tất cả</a>
            </div>
            <div class="overflow-x-auto">
                <table class="w-full table-auto">
                    <thead>
                        <tr class="bg-primary-600 text-white">
                            <th class="p-4 text-left">Mã yêu cầu</th>
                            <th class="p-4 text-left">Loại yêu cầu</th>
                            <th class="p-4 text-left">Tên vật tư</th>
                            <th class="p-4 text-left">Số lượng</th>
                            <th class="p-4 text-left">Ngày gửi</th>
                            <th class="p-4 text-left">Trạng thái</th>
                            <th class="p-4 text-left">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="border-b border-gray-200 dark:border-gray-700">
                            <td class="p-4 font-medium text-base">YC001</td>
                            <td class="p-4 text-base">Xuất kho</td>
                            <td class="p-4 text-base">Bàn gỗ cao cấp</td>
                            <td class="p-4 text-base">5</td>
                            <td class="p-4 text-base">23/05/2025</td>
                            <td class="p-4"><span class="badge badge-warning">Chờ duyệt</span></td>
                            <td class="p-4">
                                <button onclick="showToast('Đang in phiếu yêu cầu...')" class="text-primary-600 hover:text-primary-800">
                                    <i class="fas fa-print"></i>
                                </button>
                            </td>
                        </tr>
                        <tr class="border-b border-gray-200 dark:border-gray-700">
                            <td class="p-4 font-medium text-base">YC002</td>
                            <td class="p-4 text-base">Mua vật tư</td>
                            <td class="p-4 text-base">Ghế xoay văn phòng</td>
                            <td class="p-4 text-base">3</td>
                            <td class="p-4 text-base">22/05/2025</td>
                            <td class="p-4"><span class="badge badge-success">Đã duyệt</span></td>
                            <td class="p-4">
                                <button onclick="showToast('Đang in phiếu đề nghị...')" class="text-primary-600 hover:text-primary-800">
                                    <i class="fas fa-print"></i>
                                </button>
                            </td>
                        </tr>
                        <tr class="border-b border-gray-200 dark:border-gray-700">
                            <td class="p-4 font-medium text-base">YC003</td>
                            <td class="p-4 text-base">Xuất kho</td>
                            <td class="p-4 text-base">Màn hình LCD 24"</td>
                            <td class="p-4 text-base">2</td>
                            <td class="p-4 text-base">21/05/2025</td>
                            <td class="p-4"><span class="badge badge-danger">Không duyệt</span></td>
                            <td class="p-4">
                                <button onclick="showToast('Đang xem lý do...')" class="text-primary-600 hover:text-primary-800">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-gray-100 dark:bg-gray-800 text-center p-4 mt-8 border-t border-gray-200 dark:border-gray-700 transition-all duration-300">
        <p class="text-xs text-gray-600 dark:text-gray-300">Hệ thống Quản lý Vật tư - Phiên bản 2.0 © 2025 | 
            <a href="mailto:support@company.com" class="text-primary-600 dark:text-primary-400 hover:underline text-xs">Liên hệ hỗ trợ</a>
        </p>
    </footer>

    <!-- JavaScript -->
    <script>
        // Toggle Sidebar
        const sidebar = document.getElementById('sidebar');
        const toggleSidebar = document.getElementById('toggleSidebar');
        const toggleSidebarMobile = document.getElementById('toggleSidebarMobile');

        function toggleSidebarVisibility() {
            sidebar.classList.toggle('active');
            sidebar.classList.toggle('hidden');
        }

        toggleSidebar.addEventListener('click', toggleSidebarVisibility);
        toggleSidebarMobile.addEventListener('click', toggleSidebarVisibility);

        // Initialize sidebar as hidden
        sidebar.classList.add('hidden');

        // Dark Mode Toggle
        const toggleDarkMode = document.getElementById('toggleDarkMode');
        toggleDarkMode.addEventListener('click', () => {
            document.body.classList.toggle('dark-mode');
            const icon = toggleDarkMode.querySelector('i');
            icon.classList.toggle('fa-moon');
            icon.classList.toggle('fa-sun');
            localStorage.setItem('darkMode', document.body.classList.contains('dark-mode'));
        });

        // Load Dark Mode Preference
        if (localStorage.getItem('darkMode') === 'true') {
            document.body.classList.add('dark-mode');
            toggleDarkMode.querySelector('i').classList.replace('fa-moon', 'fa-sun');
        }

        // Toast Notification
        function showToast(message) {
            Toastify({
                text: message,
                duration: 3000,
                gravity: "top",
                position: "right",
                backgroundColor: "linear-gradient(to right, #3b82f6, #8b5cf6)",
                stopOnFocus: true,
                className: "rounded-lg shadow-lg",
                style: { borderRadius: "0.5rem", fontWeight: "500" }
            }).showToast();
        }

        // Table Sorting
        document.querySelectorAll('th').forEach(th => {
            th.addEventListener('click', () => {
                const table = th.closest('table');
                const tbody = table.querySelector('tbody');
                const rows = Array.from(tbody.querySelectorAll('tr'));
                const columnIndex = th.cellIndex;
                const isNumeric = columnIndex === 3; // Số lượng
                const isAsc = th.classList.toggle('asc');
                th.classList.toggle('desc', !isAsc);
                table.querySelectorAll('th').forEach(header => {
                    if (header !== th) header.classList.remove('asc', 'desc');
                });
                rows.sort((a, b) => {
                    let aValue = a.cells[columnIndex].textContent;
                    let bValue = b.cells[columnIndex].textContent;
                    if (isNumeric) {
                        aValue = parseFloat(aValue) || 0;
                        bValue = parseFloat(bValue) || 0;
                        return isAsc ? aValue - bValue : bValue - aValue;
                    }
                    return isAsc ? aValue.localeCompare(bValue) : bValue.localeCompare(aValue);
                });
                tbody.innerHTML = '';
                rows.forEach(row => tbody.appendChild(row));
            });
        });
    </script>
</body>
</html>