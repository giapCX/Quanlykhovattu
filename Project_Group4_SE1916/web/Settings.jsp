<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Dal.DBContext" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cài đặt - Hệ thống Quản lý Vật tư</title>
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

        .sidebar {
            background: linear-gradient(195deg, #1e3a8a, #3b82f6);
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
            margin-left: 18rem; /* Matches w-72 (288px) */
        }

        .nav-item {
            transition: all 0.2s ease;
            border-radius: 0.5rem;
        }

        .nav-item:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: translateX(5px);
        }

        .nav-item.active {
            background-color: rgba(255, 255, 255, 0.2);
            font-weight: 600;
        }

        .card {
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            border-radius: 1rem;
            border: 1px solid #e5e7eb;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .btn-primary {
            background: linear-gradient(to right, #3b82f6, #6366f1);
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 15px -3px rgba(59, 130, 246, 0.3), 0 4px 6px -2px rgba(59, 130, 246, 0.1);
        }

        .dark-mode {
            background-color: #1a202c;
            color: #e2e8f0;
        }

        .dark-mode .card {
            background-color: #2d3748;
            color: #e2e8f0;
            border-color: #4a5568;
        }

        .dark-mode .sidebar {
            background: linear-gradient(195deg, #111827, #1f2937);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.14), 0 7px 10px -5px rgba(31, 41, 55, 0.4);
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                max-width: 280px;
                z-index: 50;
            }
        }
    </style>
</head>
<body class="bg-gray-50 min-h-screen font-sans antialiased">
    <!-- Session Check -->
    <%
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
    %>

    <!-- Sidebar -->
    <aside id="sidebar" class="sidebar w-72 text-white p-6 fixed h-full z-50">
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
                       class="w-full bg-white bg-opacity-20 text-white placeholder-white placeholder-opacity-70 rounded-lg py-2 pl-10 pr-4 focus:outline-none focus:ring-2 focus:ring-white focus:ring-opacity-50">
                <i class="fas fa-search absolute left-3 top-2.5 text-white opacity-70"></i>
            </div>
        </div>
        <nav class="space-y-2">
            <a href="Home.jsp" class="nav-item flex items-center p-3">
                <i class="fas fa-tachometer-alt mr-3 w-6 text-center"></i>
                <span class="text-lg">Tổng quan</span>
                <i class="fas fa-chevron-right ml-auto text-sm opacity-50"></i>
            </a>
            <a href="Inventory.jsp" class="nav-item flex items-center p-3">
                <i class="fas fa-warehouse mr-3 w-6 text-center"></i>
                <span class="text-lg">Quản lý kho</span>
                <span class="ml-auto bg-white bg-opacity-20 text-sm px-2 py-1 rounded-full">5</span>
            </a>
            <a href="Items.jsp" class="nav-item flex items-center p-3">
                <i class="fas fa-box-open mr-3 w-6 text-center"></i>
                <span class="text-lg">Danh mục vật tư</span>
                <i class="fas fa-chevron-right ml-auto text-sm opacity-50"></i>
            </a>
            <a href="Orders.jsp" class="nav-item flex items-center p-3">
                <i class="fas fa-clipboard-list mr-3 w-6 text-center"></i>
                <span class="text-lg">Đơn hàng</span>
                <span class="ml-auto bg-red-500 text-white text-sm px-2 py-1 rounded-full">3</span>
            </a>
            <a href="Reports.jsp" class="nav-item flex items-center p-3">
                <i class="fas fa-chart-bar mr-3 w-6 text-center"></i>
                <span class="text-lg">Báo cáo</span>
                <i class="fas fa-chevron-right ml-auto text-sm opacity-50"></i>
            </a>
            <a href="List_user.jsp" class="nav-item flex items-center p-3">
                    <i class="fas fa-cog mr-3 w-6 text-center"></i>
                    <span class="text-lg">Danh sách người dùng</span>
                    <i class="fas fa-chevron-right ml-auto text-sm opacity-50"></i>
                </a>
            <a href="Settings.jsp" class="nav-item active flex items-center p-3">
                <i class="fas fa-cog mr-3 w-6 text-center"></i>
                <span class="text-lg">Cài đặt</span>
                <i class="fas fa-chevron-right ml-auto text-sm opacity-50"></i>
            </a>
        </nav>
        <div class="absolute bottom-0 left-0 right-0 p-6 bg-white bg-opacity-10">
            <a href="logout" class="flex items-center p-3 rounded-lg hover:bg-white hover:bg-opacity-20">
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
                    <h1 class="text-3xl font-bold text-gray-800 dark:text-white">Cài đặt</h1>
                    <p class="text-sm text-gray-600 dark:text-gray-300 mt-1">Quản lý thông tin tài khoản</p>
                </div>
            </div>
            <div class="flex items-center space-x-6">
                <div class="relative">
                    <i class="fas fa-bell text-gray-500 hover:text-primary-600 cursor-pointer text-xl"></i>
                    <span class="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center">3</span>
                </div>
                <div class="flex items-center">
                    <img src="https://ui-avatars.com/api/?name=<%= java.net.URLEncoder.encode(username, "UTF-8") %>&background=3b82f6&color=fff" 
                         alt="Người dùng" class="w-10 h-10 rounded-full mr-3">
                    <span class="font-medium text-gray-700 dark:text-white text-lg"><%= username %></span>
                </div>
                <button id="toggleDarkMode" class="bg-gray-200 dark:bg-gray-700 p-2 rounded-full hover:bg-gray-300 dark:hover:bg-gray-600">
                    <i class="fas fa-moon text-gray-700 dark:text-yellow-300 text-xl"></i>
                </button>
            </div>
        </header>

        <!-- User Information -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <div class="card bg-white dark:bg-gray-800 p-6">
                <div class="flex justify-between items-center mb-4">
                    <h2 class="text-xl font-semibold text-gray-800 dark:text-white">Thông tin người dùng</h2>
                    <button id="editProfileBtn" class="text-primary-600 dark:text-primary-400 hover:underline">
                        <i class="fas fa-edit mr-1"></i> Chỉnh sửa
                    </button>
                </div>
                <%
                    String fullName = "";
                    String email = "";
                    String phone = "";
                    String roleName = "";

                    Connection conn = null;
                    try {
                        conn = new DBContext().getConnection();
                        if (conn == null) {
                            throw new SQLException("Database connection failed.");
                        }

                        String sql = "SELECT u.full_name, u.email, u.phone, r.role_name " +
                                     "FROM users u " +
                                     "JOIN roles r ON u.role_id = r.role_id " +
                                     "WHERE u.username = ?";
                        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                            stmt.setString(1, username);
                            ResultSet rs = stmt.executeQuery();
                            if (rs.next()) {
                                fullName = rs.getString("full_name");
                                email = rs.getString("email");
                                phone = rs.getString("phone");
                                roleName = rs.getString("role_name");
                            } else {
                                throw new SQLException("User not found.");
                            }
                        }
                    } catch (SQLException e) {
                        request.setAttribute("error", "Error fetching profile: " + e.getMessage());
                    } finally {
                        if (conn != null) {
                            try {
                                conn.close();
                            } catch (SQLException e) {
                                System.err.println("Error closing connection: " + e.getMessage());
                            }
                        }
                    }
                %>

                <% if (request.getAttribute("error") != null) { %>
                    <div class="text-red-500 mb-4"><%= request.getAttribute("error") %></div>
                <% } %>
                <% if (request.getAttribute("message") != null) { %>
                    <div class="text-green-500 mb-4"><%= request.getAttribute("message") %></div>
                <% } %>

                <!-- Read-Only View -->
                <div id="profileView" class="space-y-4">
                    <div>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Tên người dùng</p>
                        <p class="text-lg text-gray-800 dark:text-white"><%= username %></p>
                    </div>
                    <div>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Họ và tên</p>
                        <p class="text-lg text-gray-800 dark:text-white"><%= fullName %></p>
                    </div>
                    <div>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Email</p>
                        <p class="text-lg text-gray-800 dark:text-white"><%= email != null ? email : "Chưa cập nhật" %></p>
                    </div>
                    <div>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Số điện thoại</p>
                        <p class="text-lg text-gray-800 dark:text-white"><%= phone != null ? phone : "Chưa cập nhật" %></p>
                    </div>
                    <div>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Vai trò</p>
                        <p class="text-lg text-gray-800 dark:text-white"><%= roleName %></p>
                    </div>
                </div>

                <!-- Editable Form (Hidden by Default) -->
                <form id="profileForm" action="user_profile" method="post" class="space-y-4 hidden">
                    <div class="space-y-2">
                        <label for="username" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Tên người dùng</label>
                        <input type="text" id="username" name="username" value="<%= username %>" class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-gray-100 dark:bg-gray-700 dark:text-white" readonly>
                    </div>
                    <div class="space-y-2">
                        <label for="fullName" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Họ và tên</label>
                        <input type="text" id="fullName" name="fullName" value="<%= fullName != null ? fullName : "" %>" class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 dark:bg-gray-700 dark:text-white" required>
                    </div>
                    <div class="space-y-2">
                        <label for="email" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Email</label>
                        <input type="email" id="email" name="email" value="<%= email != null ? email : "" %>" class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 dark:bg-gray-700 dark:text-white" required>
                    </div>
                    <div class="space-y-2">
                        <label for="phone" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Số điện thoại</label>
                        <input type="text" id="phone" name="phone" value="<%= phone != null ? phone : "" %>" class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 dark:bg-gray-700 dark:text-white">
                    </div>
                    <div class="space-y-2">
                        <label for="role" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Vai trò</label>
                        <input type="text" id="role" name="role" value="<%= roleName %>" class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-gray-100 dark:bg-gray-700 dark:text-white" readonly>
                    </div>
                    <div class="flex space-x-4">
                        <button type="submit" class="btn-primary text-white px-6 py-3 rounded-lg flex-1">Lưu thay đổi</button>
                        <button type="button" id="cancelEditBtn" class="bg-gray-200 dark:bg-gray-600 text-gray-700 dark:text-gray-200 px-6 py-3 rounded-lg flex-1 hover:bg-gray-300 dark:hover:bg-gray-500">Hủy</button>
                    </div>
                </form>
            </div>

            <!-- Change Password Section -->
            <div class="card bg-white dark:bg-gray-800 p-6">
                <h2 class="text-xl font-semibold text-gray-800 dark:text-white mb-4">Bảo mật tài khoản</h2>
                <div class="space-y-4">
                    <div>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Đổi mật khẩu</p>
                        <p class="text-sm text-gray-600 dark:text-gray-300">Cập nhật mật khẩu để tăng cường bảo mật tài khoản của bạn.</p>
                    </div>
                    <a href="forgetPassword/Change_password.jsp" class="btn-primary text-white px-6 py-3 rounded-lg inline-flex items-center">
                        <i class="fas fa-lock mr-2"></i>
                        <span>Đổi mật khẩu</span>
                    </a>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-gray-100 dark:bg-gray-800 text-center p-6 mt-8 border-t border-gray-200 dark:border-gray-700 transition-all duration-300">
        <p class="text-gray-600 dark:text-gray-300 text-sm">Hệ thống Quản lý Vật tư - Phiên bản 2.0 © 2025 | <a href="mailto:support@company.com" class="text-primary-600 dark:text-primary-400 hover:underline text-base">Liên hệ hỗ trợ</a></p>
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

        // Toggle Edit Mode for Profile
        const editProfileBtn = document.getElementById('editProfileBtn');
        const cancelEditBtn = document.getElementById('cancelEditBtn');
        const profileView = document.getElementById('profileView');
        const profileForm = document.getElementById('profileForm');

        editProfileBtn.addEventListener('click', () => {
            profileView.classList.add('hidden');
            profileForm.classList.remove('hidden');
            editProfileBtn.classList.add('hidden');
        });

        cancelEditBtn.addEventListener('click', () => {
            profileView.classList.remove('hidden');
            profileForm.classList.add('hidden');
            editProfileBtn.classList.remove('hidden');
        });
    </script>
</body>
</html>