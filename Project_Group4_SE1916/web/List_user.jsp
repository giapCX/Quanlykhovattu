<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Người dùng - Hệ thống Quản lý Vật tư</title>
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
                        }
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif']
                    }
                }
            }
        }
    </script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8fafc;
        }

        .table-container {
            border-radius: 1rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            border: 1px solid #e5e7eb;
        }

        .table th {
            background-color: #3b82f6;
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

        .btn-primary {
            background: linear-gradient(to right, #3b82f6, #6366f1);
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 15px -3px rgba(59, 130, 246, 0.3), 0 4px 6px -2px rgba(59, 130, 246, 0.1);
        }

        .btn-secondary {
            background: linear-gradient(to right, #6b7280, #9ca3af);
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 15px -3px rgba(107, 114, 128, 0.3), 0 4px 6px -2px rgba(107, 114, 128, 0.1);
        }

        .dark-mode {
            background-color: #1a202c;
            color: #e2e8f0;
        }

        .dark-mode .table-container {
            background-color: #2d3748;
            color: #e2e8f0;
            border-color: #4a5568;
        }

        .dark-mode .table tr:nth-child(even) {
            background-color: #2d3748;
        }

        .dark-mode .table tr {
            border-color: #4a5568;
        }

        th.asc::after {
            content: ' ↑';
            font-size: 0.75rem;
        }

        th.desc::after {
            content: ' ↓';
            font-size: 0.75rem;
        }
    </style>
</head>
<body class="bg-gray-50 min-h-screen font-sans antialiased">
    <%
        if (request.getAttribute("data") == null && request.getParameter("fromServlet") == null) {
            response.sendRedirect("listuser?fromServlet=true");
            return;
        }
    %>

    <!-- Main Content -->
    <main class="flex-1 p-8">
        <div class="max-w-6xl mx-auto">
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-bold text-gray-800 dark:text-white">Danh sách Người dùng</h2>
                <a href="adduser" class="btn-primary text-white px-6 py-3 rounded-lg flex items-center">
                    <i class="fas fa-plus-circle mr-2"></i> Thêm Người dùng Mới
                </a>
            </div>

            <div class="table-container bg-white dark:bg-gray-800">
                <div class="overflow-x-auto">
                    <table class="w-full table-auto">
                        <thead>
                            <tr class="bg-primary-600 text-white">
                                <th class="p-4 text-left">Tên người dùng</th>
                                <th class="p-4 text-left">Họ và tên</th>
                                <th class="p-4 text-left">Địa chỉ</th>
                                <th class="p-4 text-left">Email</th>
                                <th class="p-4 text-left">Số điện thoại</th>
                                <th class="p-4 text-left">Vai trò</th>
                                <th class="p-4 text-left">Trạng thái</th>
                                <th class="p-4 text-left">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${data}">
                                <tr class="border-b border-gray-200 dark:border-gray-700">
                                    <td class="p-4 font-medium">${item.username}</td>
                                    <td class="p-4">${item.fullName}</td>
                                    <td class="p-4">${item.address}</td>
                                    <td class="p-4">${item.email}</td>
                                    <td class="p-4">${item.phone}</td>
                                    <td class="p-4">${item.role.roleName}</td>
                                    <td class="p-4">${item.status}</td>
                                    <td class="p-4">
                                        <a href="edituser?userId=${item.userId}" class="text-primary-600 dark:text-primary-400 hover:underline">Chỉnh sửa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="mt-6 flex justify-center">
                <a href="home.jsp" class="btn-secondary text-white px-6 py-3 rounded-lg">Quay lại Trang chủ</a>
            </div>
        </div>
    </main>

    <!-- JavaScript for Dark Mode and Table Sorting -->
    <script>
        // Dark Mode Toggle
        const toggleDarkMode = document.createElement('button');
        toggleDarkMode.id = 'toggleDarkMode';
        toggleDarkMode.className = 'bg-gray-200 dark:bg-gray-700 p-2 rounded-full hover:bg-gray-300 dark:hover:bg-gray-600 fixed top-4 right-4 z-50';
        toggleDarkMode.innerHTML = '<i class="fas fa-moon text-gray-700 dark:text-yellow-300 text-xl"></i>';
        document.body.appendChild(toggleDarkMode);

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

        // Table Sorting
        document.querySelectorAll('th').forEach(th => {
            th.addEventListener('click', () => {
                const table = th.closest('table');
                const tbody = table.querySelector('tbody');
                const rows = Array.from(tbody.querySelectorAll('tr'));
                const columnIndex = th.cellIndex;
                const isNumeric = columnIndex === 4; // Phone number might be numeric
                const isAsc = th.classList.toggle('asc');
                th.classList.toggle('desc', !isAsc);
                table.querySelectorAll('th').forEach(header => {
                    if (header !== th)
                        header.classList.remove('asc', 'desc');
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